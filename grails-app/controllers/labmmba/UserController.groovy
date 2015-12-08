package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class UserController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.findAllByEnabled(true,params), model:[userCount: User.findAllByEnabled(true).size()]
    }

	def pending(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.findAllByEnabled(false,params), model:[userCount: User.findAllByEnabled(false).size()]
    }

    @Secured(['ROLE_USER','ROLE_ADMIN']) //Borrar despues
    def show(User user) {
        respond user
    }

    @Secured(['ROLE_ANONYMOUS','ROLE_ADMIN'])
    def create() {
        respond new User(params)
    }

    @Transactional
    @Secured(['ROLE_ANONYMOUS','ROLE_ADMIN'])
    def save(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        user.save flush:true
		UserRole.create user, Role.findByAuthority('ROLE_PENDING_USER'), true
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect (controller: "user" , action:"create")
            }
            '*' { respond user, [status: CREATED] }
        }
    }
    @Transactional
    def promote(User user){
        UserRole.create user, Role.findByAuthority('ROLE_ADMIN'), true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: '{0} {1} Promovido a Administrador', args: [message(code: 'user.label', default: 'User'), user.username])
                redirect user
            }
        }
    }

	@Transactional
	def approve(User user){
        user.enabled = true
        user.save()
		request.withFormat {
            form multipartForm {
                flash.message = message(code: '{0} {1} aprobado', args: [message(code: 'user.label', default: 'User'), user.username])
                redirect user
            }
		}
	}
    def edit(User user) {
        respond user
    }

    @Secured(['ROLE_USER'])
    def select_avatar() {
    }

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']
    @Secured(['ROLE_USER'])
    @Transactional
    def upload_avatar() {

        def user = User.findById(springSecurityService.principal.id)

        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')
        // List of OK mime-types
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Avatar must be one of: ${okcontents}"
            render(view:'select_avatar', model:[user:user])
            return
        }

        // Save the image and mime type
        user.avatar = f.bytes
        user.avatarType = "test"
        log.info("File uploaded: $user.avatarType")

        // Validation works, will check if the image is too big
        if (!user.save()) {
            flash.message = "Avatar must be less than 16384 bytes"
            render(view:'select_avatar', model:[user:user])
        }
        else{
            flash.message = "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
            redirect(action:'show', id: user.id)
        }
    }

    @Secured(['permitAll'])
    def avatar_image() {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = avatarUser.avatarType
        response.contentLength = avatarUser.avatar.size()
        OutputStream out = response.outputStream
        out.write(avatarUser.avatar)
        out.close()
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
