package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class UserController {

    def springSecurityService
    static allowedMethods = [update_personal_data: "POST", save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.findAllByEnabled(true,params), model:[userCount: User.findAllByEnabled(true).size()]
    }
	
	def pending(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.findAllByEnabled(false,params), model:[userCount: User.findAllByEnabled(false).size()]
    }
	
    def show(User user) {
        respond user
    }

    @Secured("ROLE_ANONONYMOUS")
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
                redirect(controller: "user", action: "create")
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

    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def update_personal_data(){

        def f = request.getFile("avatar")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        def avatarDir = new File(webrootDir + "avatars")
        def user = springSecurityService.currentUser
        def rol = new Labrol()
        def campo = new Field()

        if (f.isEmpty()==false){
            if (!okcontents.contains(f.getContentType())) {
                flash.message = "Document must be one of: ${okcontents}"
                redirect action:"personal", controller:"welcome"
                return
            }

            if (size> 2097152) {
                flash.message = "Avatar must be less than 2097152 bytes"
                redirect action:"personal", controller:"welcome"
                return
            }

            if (!avatarDir.exists()) {
                avatarDir.mkdirs()
            }

            File fileDest = new File(webrootDir, "avatars/" + user.id.toString())
            f.transferTo(fileDest)
        }

        if(params.firstname){
            user.firstname = params.firstname
        }

        if(params.lastname){
            user.lastname = params.lastname
        }

        if(params.labrol[0]!='Seleccione cargo en laboratorio...'){
            if(params.labrol[0]=="Otro"){
                if(Labrol.findByLabrol_name(params.labrol[1])){
                    rol = Labrol.findByLabrol_name(params.labrol[1])
                }
                else{
                    rol = new Labrol(labrol_name: params.labrol[1])
                    rol.save()
                }
                user.labrol = rol
                user.save()
            }
            else{
                if(Labrol.findByLabrol_name(params.labrol[0])){
                    rol = Labrol.findByLabrol_name(params.labrol[0])
                }
                else{
                    rol = new Labrol(labrol_name: params.labrol[0])
                    rol.save()
                }
                user.labrol = rol
                user.save()
            }
        }

        if(params.campo[0]!='Seleccione cargo en laboratorio...') {
            if (params.campo[0] == "Otro") {
                if (Field.findByField_name(params.campo[1])) {
                    campo = Field.findByField_name(params.campo[1])
                } else {
                    campo = new Field(field_name: params.campo[1])
                }
                campo.addToUsers(springSecurityService.currentUser).save()
            } else {
                if (Field.findByField_name(params.campo[0])) {
                    campo = Field.findByField_name(params.campo[0])
                } else {
                    campo = new Field(field_name: params.campo[0])
                }
                campo.addToUsers(springSecurityService.currentUser).save()
            }
        }

        flash.message = "Datos personales actualizados"
        redirect action:"personal", controller:"welcome"
    }

    @Secured(['permitAll'])
    def avatar_image() {
        def user = User.get(params.id)
        def webrootDir = servletContext.getRealPath("/")
        File avatar = new File(webrootDir, "avatars/" + user.id.toString())

        if(!avatar.exists()) {
            response.status = 404
        } else {
            OutputStream out = response.getOutputStream();
            out.write(avatar.bytes);
            out.close()
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
