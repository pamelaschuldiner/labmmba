package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class FieldController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Field.list(params), model:[fieldCount: Field.count()]
    }

    def show(Field field) {
        respond field
    }

    def create() {
        respond new Field(params)
    }

    @Transactional
    def save(Field field) {
        if (field == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (field.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond field.errors, view:'create'
            return
        }

        field.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'field.label', default: 'Field'), field.id])
                redirect field
            }
            '*' { respond field, [status: CREATED] }
        }
    }

    def edit(Field field) {
        respond field
    }

    @Transactional
    def update(Field field) {
        if (field == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (field.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond field.errors, view:'edit'
            return
        }

        field.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'field.label', default: 'Field'), field.id])
                redirect field
            }
            '*'{ respond field, [status: OK] }
        }
    }

    @Transactional
    def delete(Field field) {

        if (field == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        field.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'field.label', default: 'Field'), field.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'field.label', default: 'Field'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
