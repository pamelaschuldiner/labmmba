package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class MagazineController {

    def springSecurityService
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

    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def upload() {

        def f = request.getFile("pdf")
        def magazine_name = f.getOriginalFilename()
        def magazine = new Magazine(mag_name: magazine_name)

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"publicaciones", controller:"welcome"
            return
        }

        if(params.field[0]=="Otro"){
            if(Field.findByField_name(params.field[1])){
                magazine.field = Field.findByField_name(params.field[1])
            }
            else{
                magazine.field = new Field(field_name: params.field[1]).save()
            }
        }
        else{
            if(Field.findByField_name(params.field[0])){
                magazine.field = Field.findByField_name(params.field[0])
            }
            else{
                magazine.field = new Field(field_name: params.field[0]).save()
            }
        }

        springSecurityService.currentUser.addToMagazines(magazine).save()
        print magazine.save(flush: true)

        def webrootDir = servletContext.getRealPath("/")
        def magazineDir = new File(webrootDir + "magazines")

        if (!magazineDir.exists()) {
            magazineDir.mkdirs()
        }

        File fileDest = new File(webrootDir, "magazines/" + magazine.id.toString() + ".pdf")
        f.transferTo(fileDest)

        flash.message = "Exito al crear items"

        redirect action:"publicaciones", controller:"welcome"

    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download(Magazine magazine) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "magazines/" + magazine.id.toString() + ".pdf"
        def magazineFile = new File(path)
        if(magazineFile.exists()){
            render(contentType: "multipart/form-data", file: magazineFile, fileName: magazine.mag_name + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "resumenperfil")
        }
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

    @Secured(['ROLE_PENDING_USER','ROLE_USER','ROLE_ADMIN'])
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
                redirect controller: "welcome", action:"index", method:"GET"
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
