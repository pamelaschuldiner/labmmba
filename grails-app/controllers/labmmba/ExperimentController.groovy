package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExperimentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Experiment.list(params), model:[experimentCount: Experiment.count()]
    }

    def show(Experiment experiment) {
        respond experiment
    }

    def create() {
        respond new Experiment(params)
    }

    @Transactional
    def save(Experiment experiment) {
        if (experiment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (experiment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond experiment.errors, view:'create'
            return
        }

        experiment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'experiment.label', default: 'Experiment'), experiment.id])
                redirect experiment
            }
            '*' { respond experiment, [status: CREATED] }
        }
    }

    def edit(Experiment experiment) {
        respond experiment
    }

    @Transactional
    def update(Experiment experiment) {
        if (experiment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (experiment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond experiment.errors, view:'edit'
            return
        }

        experiment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'experiment.label', default: 'Experiment'), experiment.id])
                redirect experiment
            }
            '*'{ respond experiment, [status: OK] }
        }
    }

    @Transactional
    def delete(Experiment experiment) {

        if (experiment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        experiment.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'experiment.label', default: 'Experiment'), experiment.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'experiment.label', default: 'Experiment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
