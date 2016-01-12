package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class StudyController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Study.list(params), model:[studyCount: Study.count()]
    }

    def show(Study study) {
        respond study
    }

    def create() {
        respond new Study(params)
    }

    @Transactional
    def save(Study study) {
        if (study == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (study.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond study.errors,  view:'create'
            return
        }

        study.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'study.label', default: 'Study'), study.id])
                redirect study
            }
            '*' { respond study, [status: CREATED] }
        }
    }

    def edit(Study study) {
        respond study
    }

    def list() {
        [studys: Study.list(params)]
    }

    @Transactional
    def update(Study study) {
        if (study == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (study.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond study.errors, view:'edit'
            return
        }

        study.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'study.label', default: 'Study'), study.id])
                redirect study
            }
            '*'{ respond study, [status: OK] }
        }
    }

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def delete(Study study) {
        if (study == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        study.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'study.label', default: 'Study'), study.id])
                redirect controller:"welcome", action:"index", method:"GET"
            }

        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'study.label', default: 'Study'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def multi_save() {

        def estudio = new Study(study_name: params.study_name , study_type: params.study_type)
        def thesis = new Thesi(thesis_name: params.thesis_name, thesis_tutor: params.thesis_tutor, thesis_cotutor: params.thesis_cotutor)
        def universidad = new University()
        def f = request.getFile("thesis")

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"estudios", controller:"welcome"
            return
        }

        if(params.uni_name[0] == "Agregar Nueva") {
            universidad = new University(uni_name: params.uni_name[1], uni_count: params.uni_count, uni_city: params.uni_city)
        }
        else{
            universidad = University.findByUni_name(params.uni_name[0])
        }

        if(estudio.hasErrors()||thesis.hasErrors()||universidad.hasErrors()){
            flash.message = "Error al crear items"
            redirect action:"estudios", controller:"welcome"
        }

        springSecurityService.currentUser.addToStudys(estudio)
        thesis.addToStudys(estudio)
        universidad.addToStudys(estudio)

        universidad.save(flush: true)
        estudio.save(flush: true)
        thesis.save(flush: true)


        def webrootDir = servletContext.getRealPath("/")
        def thesiDir = new File(webrootDir + "thesis")

        if (!thesiDir.exists()) {
            thesiDir.mkdirs()
        }
        File fileDest = new File(webrootDir, "thesis/" + thesis.id.toString() + ".pdf")
        f.transferTo(fileDest)

        flash.message = "Exito al crear items"

        redirect action:"estudios", controller:"welcome"

    }

    def show2() {
        def study = Study.get(params.study_name)

    }

}
