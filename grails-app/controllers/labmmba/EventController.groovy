package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
<<<<<<< HEAD
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ADMIN_ROLE'])
@Transactional(readOnly = true)
class EventController {

    def springSecurityService
=======

@Transactional(readOnly = true)
class EventController {

>>>>>>> origin/master
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

<<<<<<< HEAD
    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    @Transactional
    def create_and_upload(){

        def f = request.getFile("presentacion")
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"congresos", controller:"welcome"
            return
        }

        def webrootDir = servletContext.getRealPath("/")
        def thesiDir = new File(webrootDir + "thesis")

        if (!thesiDir.exists()) {
            thesiDir.mkdirs()
        }
        File fileDest = new File(webrootDir, "thesis/" + params.id.toString() + ".pdf")
        f.transferTo(fileDest)

        def evento = new Event(params).save()
        springSecurityService.currentUser.addToEvents(evento).save()

        flash.message = "Congreso Creado"
        redirect action:"congresos", controller:"welcome"

    }

=======
>>>>>>> origin/master
    def edit(Event event) {
        respond event
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
                redirect action:"index", method:"GET"
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
