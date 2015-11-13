package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProyectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proyect.list(params), model:[proyectCount: Proyect.count()]
    }

    def show(Proyect proyect) {
        respond proyect
    }

    def create() {
        respond new Proyect(params)
    }

    @Transactional
    def save(Proyect proyect) {
        if (proyect == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proyect.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond proyect.errors, view:'create'
            return
        }

        proyect.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proyect.label', default: 'Proyect'), proyect.id])
                redirect proyect
            }
            '*' { respond proyect, [status: CREATED] }
        }
    }

    def edit(Proyect proyect) {
        respond proyect
    }

    @Transactional
    def update(Proyect proyect) {
        if (proyect == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proyect.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond proyect.errors, view:'edit'
            return
        }

        proyect.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'proyect.label', default: 'Proyect'), proyect.id])
                redirect proyect
            }
            '*'{ respond proyect, [status: OK] }
        }
    }

    @Transactional
    def delete(Proyect proyect) {

        if (proyect == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        proyect.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'proyect.label', default: 'Proyect'), proyect.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyect.label', default: 'Proyect'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
