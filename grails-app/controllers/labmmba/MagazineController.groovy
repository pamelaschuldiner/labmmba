package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MagazineController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Magazine.list(params), model:[magazineCount: Magazine.count()]
    }

    def show(Magazine magazine) {
        respond magazine
    }

    def create() {
        respond new Magazine(params)
    }

    @Transactional
    def save(Magazine magazine) {
        if (magazine == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (magazine.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond magazine.errors, view:'create'
            return
        }

        magazine.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'magazine.label', default: 'Magazine'), magazine.id])
                redirect magazine
            }
            '*' { respond magazine, [status: CREATED] }
        }
    }

    def edit(Magazine magazine) {
        respond magazine
    }

    @Transactional
    def update(Magazine magazine) {
        if (magazine == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (magazine.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond magazine.errors, view:'edit'
            return
        }

        magazine.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'magazine.label', default: 'Magazine'), magazine.id])
                redirect magazine
            }
            '*'{ respond magazine, [status: OK] }
        }
    }

    @Transactional
    def delete(Magazine magazine) {

        if (magazine == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        magazine.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'magazine.label', default: 'Magazine'), magazine.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'magazine.label', default: 'Magazine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
