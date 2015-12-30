package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ThesiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Thesi.list(params), model:[thesiCount: Thesi.count()]
    }

    def show(Thesi thesi) {
        respond thesi
    }

    def create() {
        respond new Thesi(params)
    }

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

        thesi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'thesi.label', default: 'Thesi'), thesi.id])
                redirect thesi
            }
            '*' { respond thesi, [status: CREATED] }
        }
    }

    def edit(Thesi thesi) {
        respond thesi
    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download(Thesi thesi) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "thesis/" + thesi.id.toString() + ".pdf"
        def thesisFile = new File(path)
        if(thesisFile.exists()){
            render(contentType: "multipart/form-data", file: thesisFile, fileName: thesi.thesis_name + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "resumenperfil")
        }
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

        def list() {
        [thesis: Thesi.list(params)]
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
