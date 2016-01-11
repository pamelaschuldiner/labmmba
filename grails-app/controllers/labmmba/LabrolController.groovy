package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class LabrolController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Labrol.list(params), model:[labrolCount: Labrol.count()]
    }

    def show(Labrol labrol) {
        respond labrol
    }

    def create() {
        respond new Labrol(params)
    }

    @Transactional
    def save(Labrol labrol) {
        if (labrol == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (labrol.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond labrol.errors, view:'create'
            return
        }

        labrol.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'labrol.label', default: 'Labrol'), labrol.id])
                redirect labrol
            }
            '*' { respond labrol, [status: CREATED] }
        }
    }

    def edit(Labrol labrol) {
        respond labrol
    }

    @Transactional
    def update(Labrol labrol) {
        if (labrol == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (labrol.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond labrol.errors, view:'edit'
            return
        }

        labrol.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'labrol.label', default: 'Labrol'), labrol.id])
                redirect labrol
            }
            '*'{ respond labrol, [status: OK] }
        }
    }

    @Transactional
    def delete(Labrol labrol) {

        if (labrol == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        labrol.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'labrol.label', default: 'Labrol'), labrol.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'labrol.label', default: 'Labrol'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
