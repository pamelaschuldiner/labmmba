package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class ThesiController {

    def springSecurityService
    def mailService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE",create_current_thesi: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Thesi.list(params), model:[thesiCount: Thesi.count()]
    }

    def show(Thesi thesi) {
        respond thesi
    }

    def create() {
        respond new Thesi(params)
    }

    @Transactional
    def save(Thesi thesi) {
        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (thesi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond thesi.errors, view:'create'
            return
        }

        thesi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect thesi
            }
            '*' { respond thesi, [status: CREATED] }
        }
    }

    def edit(Thesi thesi) {
        respond thesi
    }

    @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Transactional
    def create_current_thesi(){

        def f = request.getFile("thesis")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        def thesisDir = new File(webrootDir + "thesis_activa")
        def user = springSecurityService.currentUser
        def thesis = new Thesi(thesis_name: params.thesis_name, thesis_tutor: User.get(params.tutor_id.toInteger()).username, thesis_cotutor: params.thesis_cotutor, cuentaAutor: user , cuentaTutor: User.get(params.tutor_id.toInteger()), active: true)
        if (size> 2097152) {
            flash.message = "File must be less than 2097152 bytes"
            redirect action:"avancetesis", controller:"welcome"
            return
        }

        if(Thesi.findByActive(true)){Thesi.findByActive(true).deleteAll()}
        thesis.save(flush: true)


        if (!thesisDir.exists()) {
            thesisDir.mkdirs()
        }

        File fileDest = new File(webrootDir, "thesis_activa/" + user.id.toString() + '.docx')
        f.transferTo(fileDest)

        mailService.sendMail {
            multipart true
            to thesis.cuentaTutor.email
            from thesis.cuentaAutor.email
            subject ("Avanze Tesis" + thesis.cuentaAutor.firstname + thesis.cuentaAutor.lastname)
            body g.createLink(controller:"thesi", action:"download_current", params:[user_id: thesis.cuentaAutor.id], absolute: true)
            attachBytes "Tesis.docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", f.getBytes("UTF-8")

        }
        redirect(controller: "welcome",action: "avancetesis")
    }

    @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Transactional
    def enviar_tesis(){
        print params.doc_url
        mailService.sendMail {
            to Thesi.findByCuentaAutor(springSecurityService.currentUser).cuentaTutor.email
            from springSecurityService.currentUser.email
            subject "Avanze tesis"
            body params.doc_url
        }
        redirect(controller: "welcome",action: "avancetesis")
    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download(Thesi thesi) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "thesis/" + thesi.id.toString() + ".pdf"
        def thesisFile = new File(path)
        if(thesisFile.exists()){
            render(contentType: "multipart/form-data", file: thesisFile, fileName: thesi.thesis_name + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "resumenperfil")
        }
    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download_current() {
        def user = User.get(params.user_id)
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "thesis_activa/" + user.id.toString() + ".docx"
        def thesisFile = new File(path)
        if(springSecurityService.currentUser!=user && springSecurityService.currentUser!=Thesi.findByCuentaAutor(user).cuentaTutor){
            flash.message = "No tienes permitido ver esta tesis"
            redirect(controller: "welcome",action: "avancetesis")
            return
        }
        if(thesisFile.exists()){
            render(contentType: "multipart/form-data", file: thesisFile, fileName: ("thesis_"+ user.username +".docx") )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "avancetesis")
        }
    }

    @Transactional
    def update(Thesi thesi) {
        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (thesi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond thesi.errors, view:'edit'
            return
        }

        thesi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect thesi
            }
            '*'{ respond thesi, [status: OK] }
        }
    }

    @Transactional
    def delete(Thesi thesi) {

        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        thesi.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

        def list() {
        [thesis: Thesi.list(params)]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'thesi.label', default: 'Thesi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
