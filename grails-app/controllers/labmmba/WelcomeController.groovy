package labmmba

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class WelcomeController {


    def index() { }

 
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
    def avancetesis() {

        render(view: 'avancetesis.gsp')

         } 	 
    def publicaciones() {

        render(view: 'publicaciones.gsp')

         } 
    def personal(){

        render(view: 'personal.gsp')

         }
    def resumenperfil() {

        render(view: 'resumenperfil.gsp')

         }
    def congresos() {

        render(view: 'congresos.gsp')

         }
}
