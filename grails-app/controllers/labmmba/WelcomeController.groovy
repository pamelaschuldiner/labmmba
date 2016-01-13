package labmmba

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class WelcomeController {

    def springSecurityService
    Random random = new Random(System.currentTimeMillis())

    def index() {
        if( springSecurityService.isLoggedIn()&&getPrincipal().username!="admin"){
            redirect(controller: "welcome", action: 'resumenperfil')
        }
        if(springSecurityService.isLoggedIn()&&getPrincipal().username=="admin"){
            redirect(controller: "user", action: 'index')
        }
    }

 
    def about() {

    	render(view: 'about.gsp')

    	 }



    def team() {
        def users= labmmba.User.listOrderById()
    	render(view: 'team.gsp', model: [users: users])

    	 }
    def contact() {

    	render(view: 'contact.gsp')

    	 }
    def blog() {

    	render(view: 'blog.gsp')

    	 }

    def estudios() {

        render(view: 'estudios.gsp')

         }    
    def proyectos() {

        render(view: 'proyectos.gsp')

         }
    def mensajes() {

        render(view: 'mensajes.gsp')

         } 
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
    def avancetesis() {

        def users = User.findAllByUsernameNotEqual(springSecurityService.currentUser.getUsername())
        def tesisPupilos = Thesi.findAllByCuentaTutor(springSecurityService.currentUser)
        def currentUser = springSecurityService.currentUser
        render(view: 'avancetesis.gsp', model: [users: users, tesisPupilos: tesisPupilos, currentUser: currentUser])

         } 	 
    def publicaciones() {

        render(view: 'publicaciones.gsp')

         } 
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
        if(springSecurityService.isLoggedIn()){
            render(view: 'resumenperfil.gsp', model: [user: user, images: imagesDir.listFiles(), videos: videosDir.listFiles(), private_images: privateImagesDir.listFiles(), private_videos: privateVideosDir.listFiles() ])
        }
        else{
            render(view: 'resumenperfil.gsp', model: [user: user, images: imagesDir.listFiles(), videos:videosDir.listFiles() ])
        }
         }

    def congresos() {

        render(view: 'congresos.gsp')

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
}
