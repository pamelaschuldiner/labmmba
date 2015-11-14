package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsertempController {

        static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def register(){
        // new user posts his registration details
        if (request.method == 'POST') {
            // create domain object and assign parameters using data binding
            def u = new Usertemp(params)
  
                session.usertemp = u
                redirect(controller:'usertemp')

        }
    }

 



    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usertemp.list(params), model:[usertempCount: Usertemp.count()]
    }

    def show(Usertemp usertemp) {
        respond usertemp
    }

    def create() {
        respond new Usertemp(params)
    }

    @Transactional
    def save(Usertemp usertemp) {
        if (usertemp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (usertemp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond usertemp.errors, view:'create'
            return
        }

        usertemp.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usertemp.label', default: 'Usertemp'), usertemp.id])
                redirect usertemp
            }
            '*' { respond usertemp, [status: CREATED] }
        }
    }

    def edit(Usertemp usertemp) {
        respond usertemp
    }

    @Transactional
    def update(Usertemp usertemp) {
        if (usertemp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (usertemp.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond usertemp.errors, view:'edit'
            return
        }

        usertemp.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usertemp.label', default: 'Usertemp'), usertemp.id])
                redirect usertemp
            }
            '*'{ respond usertemp, [status: OK] }
        }
    }

    @Transactional
    def delete(Usertemp usertemp) {

        if (usertemp == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        usertemp.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usertemp.label', default: 'Usertemp'), usertemp.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usertemp.label', default: 'Usertemp'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
