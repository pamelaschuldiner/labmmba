package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class BookController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model:[bookCount: Book.count()]
    }

    def show(Book book) {
        respond book
    }

    def create() {
        respond new Book(params)
    }

    @Transactional
    def save(Book book) {
        if (book == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (book.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond book.errors, view:'create'
            return
        }

        book.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), book.id])
                redirect book
            }
            '*' { respond book, [status: CREATED] }
        }
    }

    def edit(Book book) {
        respond book
    }

    @Transactional
    def update(Book book) {
        if (book == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (book.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond book.errors, view:'edit'
            return
        }

        book.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), book.id])
                redirect book
            }
            '*'{ respond book, [status: OK] }
        }
    }

    private static final okcontents = ['application/pdf']

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def upload() {

        def f = request.getFile("pdf")

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"publicaciones", controller:"welcome"
            return
        }

        def book = new Book(params)
        springSecurityService.currentUser.addToBooks(book).save()
        book.save(flush: true)

        def webrootDir = servletContext.getRealPath("/")
        def bookDir = new File(webrootDir + "books")

        if (!bookDir.exists()) {
            bookDir.mkdirs()
        }

        File fileDest = new File(webrootDir, "books/" + book.id.toString() + ".pdf")
        f.transferTo(fileDest)

        flash.message = "Exito al crear items"

        redirect action:"publicaciones", controller:"welcome"

    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    def download(Book book) {
        def webrootDir = servletContext.getRealPath("/")
        def path = webrootDir + "books/" + book.id.toString() + ".pdf"
        def bookFile = new File(path)
        if(bookFile.exists()){
            render(contentType: "multipart/form-data", file: bookFile, fileName: book.book_name + ".pdf" )
        }
        else{
            flash.message = "El usuario no a subido el pdf"
            redirect(controller: "welcome",action: "resumenperfil")
        }
    }

    @Secured(['ROLE_USER','ROLE_ADMIN','ROLE_PENDING_USER'])
    @Transactional
    def delete(Book book) {

        if (book == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (book.user != springSecurityService.currentUser) {
            transactionStatus.setRollbackOnly()
            return
        }

        book.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), book.id])
                redirect controller: "welcome", action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
        def list() {
        [studys: Study.list(params)]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
