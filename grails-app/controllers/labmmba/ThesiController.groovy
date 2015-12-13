package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class ThesiController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Thesi.list(params), model:[thesiCount: Thesi.count()]
    }

    @Secured(['permitAll'])
    def show(Thesi thesi) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "thesis/" + thesi.id.toString() + ".pdf"
        def thesis = new File(path)
        if(thesis.exists()){
            render(contentType: "multipart/form-data", file: new File(path), fileName: thesi.thesis_name + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "user",action: "show")
        }
    }

    @Secured(['ROLE_USER'])
    def create() {
        respond new Thesi(params)
    }

    @Secured(['ROLE_USER'])
    @Transactional
    def save(Thesi thesi) {
        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (thesi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond thesi.errors, view:'create'
            return
        }

        thesi.addToStudys(Study.findById(params.studyId))
        thesi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect springSecurityService.currentUser
            }
            '*' { respond thesi, [status: CREATED] }
        }
    }

    def edit(Thesi thesi) {
        respond thesi
    }
    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_USER'])
    @Transactional
    def upload_thesis() {

        def user = User.findById(springSecurityService.principal.id)

        // Get the avatar file from the multi-part request
        def f = request.getFile('thesi')
        // List of OK mime-types
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect(controller: "user", action: "show")
            return
        }

        def webrootDir = servletContext.getRealPath("/")
        def thesiDIr = new File(webrootDir + "thesis")

        if (!thesiDIr.exists()) {
            thesiDIr.mkdirs()
        }
        File fileDest = new File(webrootDir, "thesis/" + params.id.toString() + ".pdf")
        f.transferTo(fileDest)

        flash.message = "Thesis uploaded."
        redirect(controller: "user", action: "show")
    }

    @Transactional
    def update(Thesi thesi) {
        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (thesi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond thesi.errors, view:'edit'
            return
        }

        thesi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect thesi
            }
            '*'{ respond thesi, [status: OK] }
        }
    }

    @Transactional
    def delete(Thesi thesi) {

        if (thesi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        thesi.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'thesi.label', default: 'Thesi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}