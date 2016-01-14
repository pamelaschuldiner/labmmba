package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ADMIN_ROLE'])
@Transactional(readOnly = true)
class EventController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Event.list(params), model:[eventCount: Event.count()]
    }

    def show(Event event) {
        respond event
    }

    def create() {
        respond new Event(params)
    }

    @Transactional
    def save(Event event) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'create'
            return
        }

        event.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*' { respond event, [status: CREATED] }
        }
    }

    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    @Transactional
    def create_and_upload(){

        def f = request.getFile("presentacion")
        if (!okcontents.contains(f.getContentType()) && !f.isEmpty()) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"congresos", controller:"welcome"
            return
        }

        def webrootDir = servletContext.getRealPath("/")
        def eventDIr = new File(webrootDir + "event")

        def evento = new Event(params)
        springSecurityService.currentUser.addToEvents(evento).save()
        evento.save()

        if(!f.isEmpty()){
            if (!eventDIr.exists()) {
                eventDIr.mkdirs()
            }
            File fileDest = new File(webrootDir, "event/" + evento.id.toString() + ".pdf")
            f.transferTo(fileDest)
        }


        flash.message = "Congreso Creado"
        redirect action:"congresos", controller:"welcome"

    }

    def edit(Event event) {
        respond event
    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download(Event event) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "event/" + event.id.toString() + ".pdf"
        def thesisFile = new File(path)
        if(thesisFile.exists()){
            render(contentType: "multipart/form-data", file: thesisFile, fileName: event.event_pname + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "resumenperfil")
        }
    }

    @Transactional
    def update(Event event) {
        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view:'edit'
            return
        }

        event.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect event
            }
            '*'{ respond event, [status: OK] }
        }
    }

    @Secured(['ROLE_USER','ROLE_PENDING_USER','ROLE_ADMIN'])
    @Transactional
    def delete(Event event) {

        if (event == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        event.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'event.label', default: 'Event'), event.id])
                redirect controller: "welcome", action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
        def list() {
        [studys: Study.list(params)]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
