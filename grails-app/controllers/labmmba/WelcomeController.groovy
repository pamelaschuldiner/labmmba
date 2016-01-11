package labmmba

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class WelcomeController {

    def springSecurityService

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

    	render(view: 'team.gsp')

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
    def experimentos() {

        render(view: 'experimentos.gsp')

         } 
    def mensajes() {

        render(view: 'mensajes.gsp')

         } 
    def cuenta() {

        render(view: 'cuenta.gsp')

         }
    def news() {

        render(view: 'news.gsp')

    }
    def avancetesis() {

        render(view: 'avancetesis.gsp')

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

        render(view: 'resumenperfil.gsp', model: [user: user, images: imagesDir.listFiles(), videos:videosDir.listFiles() ])
         }

    def congresos() {

        render(view: 'congresos.gsp')

         }

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

        render(view: 'editarGaleria.gsp', model: [images: imagesDir.listFiles(), videos:videosDir.listFiles() ])

    }
}
