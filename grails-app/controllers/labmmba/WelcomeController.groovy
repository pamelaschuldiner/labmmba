package labmmba

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class WelcomeController {

    def springSecurityService

    def index() {
        if( springSecurityService.isLoggedIn()){
            redirect(controller: "welcome", action: 'resumenperfil')
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
            if(springSecurityService.currentUser==null){
                redirect(controller: "welcome", action: "index")
                return
            }
            else{
                user = User.findById(springSecurityService.currentUser.id)
            }
        }

        respond user

         }
    def congresos() {

        render(view: 'congresos.gsp')

         }
}
