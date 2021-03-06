package labmmba

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['permitAll'])
class WelcomeController {

    static allowedMethods = [media: "GET", delete_media: "DELETE", upload_video: "POST",upload_imagen: "POST"]
    def springSecurityService
    def directMessageService
    Random random = new Random(System.currentTimeMillis())

    def index() {
        def webrootDir = servletContext.getRealPath("/")

        File imagesDir = new File(webrootDir, "galeriaPrincipal/imagenes")
        if (!imagesDir.exists()) {
            imagesDir.mkdirs()
        }
        File videosDir = new File(webrootDir, "galeriaPrincipal/videos")
        if (!videosDir.exists()) {
            videosDir.mkdirs()
        }

        if( springSecurityService.isLoggedIn() && getPrincipal().username!="admin"){
            redirect(controller: "welcome", action: 'resumenperfil')
        }
        if( springSecurityService.isLoggedIn() && getPrincipal().username=="admin"){
            redirect(controller: "user", action: 'index')
        }
        else{
            render(view: "index", model: [images: imagesDir.listFiles(), videos: videosDir.listFiles()])
        }
    }
    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def about() {

    	render(view: 'about.gsp')

    	 }

    def loginreg(){
        respond new User(params)
    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def busqueda(Integer max){
        params.max = Math.min(max ?: 10, 100)
        if(request.forwardURI.endsWith("revistas")){
            respond Magazine.list(params), model:[count: Magazine.count()], view:"busqueda/revistas"
            return
        }
        if(request.forwardURI.endsWith("usuarios")){
            respond User.list(params), model:[count: User.count()], view:"busqueda/usuarios"
            return
        }
        if(request.forwardURI.endsWith("tesis")){
            respond Thesi.list(params), model:[count: Thesi.count()], view:"busqueda/tesis"
            return
        }
        if(request.forwardURI.endsWith("libros")){
            respond Book.list(params), model:[count: Book.count()], view:"busqueda/libros"
            return
        }
        if(request.forwardURI.endsWith("eventos")){
            respond Event.list(params), model:[count: Event.count()], view:"busqueda/eventos"
            return
        }
        if(request.forwardURI.endsWith("proyectos")){
            respond Magazine.list(params), model:[count: Magazine.count()], view:"busqueda/proyectos"
            return
        }
        render view:"busqueda"
    }

    def team() {
        def users= labmmba.User.findAllByEnabled(true).asList()
    	render(view: 'team.gsp', model: [users: users])
    	 }

    def contact() {

    	render(view: 'contact.gsp')
    	 }

    def blog() {

    	render(view: 'blog.gsp')

    	 }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def estudios() {

        render(view: 'estudios.gsp')

         }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def proyectos() {

        render(view: 'proyectos.gsp')

         }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def mensajes() {
        def sent = springSecurityService.currentUser.getSentMessages()
        def recived = springSecurityService.currentUser.getReceivedMessages()
        def users =  User.findAllByUsernameNotEqual(springSecurityService.currentUser.username)
        render(view: 'mensajes.gsp', model: [messagesSent: sent, messagesReceived: recived, users: users])

         }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def sendMessage(){
        render(params)
        if(springSecurityService.currentUser.sendMessage(params.senderId.toInteger(),params.message)){
            flash.message = "Mensaje enviado"
            redirect(controller: "welcome", action: "mensajes")
        }
        else{
            flash.message = "Error al enviar mensaje"
        }
    }



    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def cuenta() {
        if(springSecurityService.currentUser==null&&getPrincipal().username!="admin"){
            redirect(controller: "welcome", action: "index")
            return
        }
        else{
            def user = User.findById(springSecurityService.currentUser.id)
            render(view: "cuenta.gsp", model: [user: user])
        }
    }
    def news() {

        render(view: 'news.gsp')

    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def avancetesis() {
        def users = User.findAllByUsernameNotEqual(springSecurityService.currentUser.getUsername())
        def currentUser = springSecurityService.currentUser
        if(SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")){
            def tesisPupilos = Thesi.findAllByActive(true)
            render(view: 'avancetesis.gsp', model: [users: users, tesisPupilos: tesisPupilos, currentUser: currentUser])
        }
        else{
            def tesisPupilos = Thesi.findAllByCuentaTutor(springSecurityService.currentUser)
            render(view: 'avancetesis.gsp', model: [users: users, tesisPupilos: tesisPupilos, currentUser: currentUser])
        }
    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def publicaciones() {

        render(view: 'publicaciones.gsp')

         }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def personal(){

        render(view: 'personal.gsp')

         }

    def resumenperfil(User user) {
        if(user==null){
            if(springSecurityService.currentUser==null&&getPrincipal().username!="admin"){
                redirect(controller: "welcome", action: "index")
                return
            }
            else{
                user = User.findById(springSecurityService.currentUser.id)
            }
        }

        def webrootDir = servletContext.getRealPath("/")

        File emptyFile = new File(webrootDir, "empty")
        if (!emptyFile.exists()) {
            emptyFile.mkdirs()
        }
        File imagesDir = new File(webrootDir, "galeria/imagenes/" + user.id.toString())
        if (!imagesDir.exists()) {
            imagesDir.mkdirs()
        }
        File videosDir = new File(webrootDir, "galeria/videos/" + user.id.toString())
        if (!videosDir.exists()) {
            videosDir.mkdirs()
        }
        File privateImagesDir = new File(webrootDir, "galeria/imagenes/privadas/" + user.id.toString())
        if (!privateImagesDir.exists()) {
            privateImagesDir.mkdirs()
        }
        File privateVideosDir = new File(webrootDir, "galeria/videos/privados/" + user.id.toString())
        if (!privateVideosDir.exists()) {
            privateVideosDir.mkdirs()
        }

        if(springSecurityService.isLoggedIn()){
            render(view: 'resumenperfil.gsp', model: [user: user, images: imagesDir.listFiles(), videos: videosDir.listFiles(), private_images: privateImagesDir.listFiles(), private_videos: privateVideosDir.listFiles() ])
        }
        else{
            render(view: 'resumenperfil.gsp', model: [user: user, images: imagesDir.listFiles(), videos:videosDir.listFiles() , private_images: emptyFile.listFiles(), private_videos: emptyFile.listFiles() ])
        }
    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def congresos() {

        render(view: 'congresos.gsp')

         }
    @Secured(['ROLE_ADMIN'])
    def editarGaleriaPrincipal() {
        def webrootDir = servletContext.getRealPath("/")

        File imagesDir = new File(webrootDir, "galeriaPrincipal/imagenes")
        if (!imagesDir.exists()) {
            imagesDir.mkdirs()
        }
        File videosDir = new File(webrootDir, "galeriaPrincipal/videos")
        if (!videosDir.exists()) {
            videosDir.mkdirs()
        }

        render(view: 'editarGaleriaPrincipal.gsp', model: [images: imagesDir.listFiles(), videos: videosDir.listFiles()])
    }

    @Secured(['permitAll'])
    def media() {
        def webrootDir = servletContext.getRealPath("/")
        File media
        if(params.tipo=="imagen"){
            media = new File(webrootDir, "galeriaPrincipal/imagenes/" + params.name )
        }
        if(params.tipo=="video"){
            media = new File(webrootDir, "galeriaPrincipal/videos/" + params.name )
        }
        if(media == null || !media.exists()) {
            response.status = 404
        }
        else {
            OutputStream out = response.getOutputStream();
            if(params.tipo=="video" || params.tipo=="video_privado"){
                response.contentType = 'video/mp4'
            }
            out.write(media.bytes);
            out.close()
        }
    }

    @Secured(['ROLE_ADMIN'])
    def delete_media() {

        def webrootDir = servletContext.getRealPath("/")
        File media
        if(params.tipo=="imagen"){
            media = new File(webrootDir, "galeriaPrincipal/imagenes/" + params.name )
        }
        if(params.tipo=="video"){
            media = new File(webrootDir, "galeriaPrincipal/videos/" + params.name )
        }
        media.delete()
        redirect action:"editarGaleriaPrincipal", controller:"welcome"
    }

    @Secured(['ROLE_ADMIN'])
    def upload_imagen() {
        def okcontents = ['image/png', 'image/jpeg', 'image/gif']
        def f = request.getFile("imagen")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        File mediaDir
        File fileDest

        mediaDir = new File(webrootDir, "galeriaPrincipal/imagenes/")

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"editarGaleriaPrincipal", controller:"welcome"
            return
        }

        if (size> 2097152) {
            flash.message = "Avatar must be less than 2097152 bytes"
            redirect action:"editarGaleriaPrincipal", controller:"welcome"
            return
        }

        if (!mediaDir.exists()) {
            mediaDir.mkdirs()
        }

        fileDest = new File(webrootDir, "galeriaPrincipal/imagenes/" + f.getOriginalFilename())
        f.transferTo(fileDest)
        redirect action:"editarGaleriaPrincipal", controller:"welcome"
    }

    @Secured(['ROLE_ADMIN'])
    def upload_video() {


        def okcontents = ['video/mp4']
        def f = request.getFile("video")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        File mediaDir
        File fileDest

        mediaDir = new File(webrootDir, "galeriaPrincipal/videos/")

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"editarGaleriaPrincipal", controller:"welcome"
            return
        }

        if (size> 2097152) {
            flash.message = "Avatar must be less than 2097152 bytes"
            redirect action:"editarGaleriaPrincipal", controller:"welcome"
            return
        }

        if (!mediaDir.exists()) {
            mediaDir.mkdirs()
        }
        fileDest = new File(webrootDir, "galeriaPrincipal/videos/" + f.getOriginalFilename())
        f.transferTo(fileDest)
        redirect action:"editarGaleriaPrincipal", controller:"welcome"

    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def editarGaleria() {
        def user = springSecurityService.currentUser
        def webrootDir = servletContext.getRealPath("/")

        File imagesDir = new File(webrootDir, "galeria/imagenes/" + user.id.toString())
        if (!imagesDir.exists()) {
            imagesDir.mkdirs()
        }
        File videosDir = new File(webrootDir, "galeria/videos/" + user.id.toString())
        if (!videosDir.exists()) {
            videosDir.mkdirs()
        }
        File privateImagesDir = new File(webrootDir, "galeria/imagenes/privadas/" + user.id.toString())
        if (!imagesDir.exists()) {
            imagesDir.mkdirs()
        }
        File privateVideosDir = new File(webrootDir, "galeria/videos/privados/" + user.id.toString())
        if (!videosDir.exists()) {
            videosDir.mkdirs()
        }

        render(view: 'editarGaleria.gsp', model: [images: imagesDir.listFiles(), videos: videosDir.listFiles(), private_images: privateImagesDir.listFiles(), private_videos: privateVideosDir.listFiles() ])

    }

    def areainvesti() {

    render(view: 'areainvesti.gsp')

     }

         def links() {

    render(view: 'links.gsp')

     }

         def publicacion() {

    render(view: 'publicacion.gsp')

     }

         def patentes() {

    render(view: 'patentes.gsp')

     }

         def proy() {

    render(view: 'proy.gsp')

     }
 
}
