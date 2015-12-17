package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ExperimentController {

    def springSecurityService
    static allowedMethods = [save_with_images: "POST", save: "POST", update: "PUT", delete: "DELETE"]

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

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    @Transactional
    @Secured(['ROLE_PENDING_USER'])
    def save_with_images(){

        def files = request.getMultiFileMap()["images"]

        def hasErrors
        files.each { file ->
            if (!okcontents.contains(file.getContentType())) {
                flash.message = "Document must be one of: ${okcontents}"
                hasErrors = true
            }
        }
        if(hasErrors){
            redirect controller: "welcome", action: "experimentos"
            return
        }

        def experiment = new Experiment(params).save()
        springSecurityService.currentUser.addToExperiments(experiment).save()
        def webrootDir = servletContext.getRealPath("/")
        def experimentDir = new File(webrootDir + "experiments/" + experiment.id.toString() + "/")

        if (!experimentDir.exists()) {
            experimentDir.mkdirs()
        }

        File fileDest
        files.eachWithIndex{ file,i->
            fileDest = new File(webrootDir, "experiments/" + experiment.id.toString() + "/"+ i.toString())
            file.transferTo(fileDest)
        }
        flash.message = "Experimento creado con exito"
		redirect controller: "welcome", action: "experimentos"
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
