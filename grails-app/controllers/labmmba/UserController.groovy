package labmmba

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class UserController {

    def springSecurityService
    def mailService
    static allowedMethods = [update_personal_data: "POST", save: "POST", update: "PUT", delete: "DELETE", upload_media: "POST", delete_media: "DELETE", eliminar_area: "DELETE", changePassword: "PUT"]

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

    @Secured("permitAll")
    def create() {
        respond new User(params)
    }


    @Secured(['ROLE_ANONYMOUS','ROLE_ADMIN'])
    @Transactional
    def confirmarMail(User user){
        if(params.confirmationNumber.toInteger() == user.confirmationNumber && !user.emailConfirmed){
            user.emailConfirmed = true
            user.save(flush: true)
            mailService.sendMail {
                to Administrator.list().email + UserRole.findAllByRole(Role.findByAuthority("ROLE_ADMIN")).user.email
                subject ("Confirmacion cuenta: " + user.firstname + " " + user.lastname)
                html "<a href='" + g.createLink(controller: "user", action: "show", resource: user, absoulute: true) + "'>Aprobar Usuario</a>"
            }
            mailService.sendMail {
                to user.email
                subject "Confirmacion correo Labmmba"
                body "Confirmacion exitosa, espere aprobacion por administrador."
            }
        }
        if(params.confirmationNumber.toInteger() != user.confirmationNumber){
            mailService.sendMail {
                to user.email
                subject "Confirmacion correo Labmmba"
                body "Cuenta borrada por fallo de confirmacion, intente crear su cuenta de nuevo."
            }

            UserRole.findByUser(user).delete flush: true
            user.delete flush:true
        }
        render("Correo confirmado")
    }

    @Transactional
    @Secured(['ROLE_USER','ROLE_PENDING_USER'])
    def changePassword(){
        def user = springSecurityService.currentUser
        if(!springSecurityService.passwordEncoder.isPasswordValid(user.password, params.claveActual, null)){
            flash.message = "Clave actual incorrecta"
            redirect(controller: "welcome", action: "cuenta")
            return
        }
        if(!params.claveNueva.equals(params.claveNuevaConfirmacion)){
            flash.message = "Claves no coinciden"
            redirect(controller: "welcome", action: "cuenta")
            return
        }
        if( springSecurityService.passwordEncoder.isPasswordValid(user.password, params.claveNueva, null)){
            flash.message = "Clave es igual a clave actual"
            redirect(controller: "welcome", action: "cuenta")
            return
        }
        user.password = params.claveNueva
        user.save()
        flash.message = "Clave cambiada"
        redirect(controller: "welcome", action: "cuenta")
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def admin_save(User user) {
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

        user.enabled = true
        user.emailConfirmed = true
        user.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect(controller: "user", action: "create")
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    @Transactional
    @Secured(['ROLE_ANONYMOUS'])
    def user_save(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'loginreg', controller: "welcome"
            return
        }

        user.save flush:true
        UserRole.create user, Role.findByAuthority('ROLE_USER'), true
        mailService.sendMail {
            to user.email
            subject "Confirmacion correo Labmmba"
            html "<a href='" + g.createLink(controller: "user", action: "confirmarMail", resource: user, params:[confirmationNumber: user.confirmationNumber], absoulute: true) + "'>Confirmar Correo</a>"
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.username])
                redirect(controller: "welcome", action: "loginreg")
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
        mailService.sendMail {
            to user.email
            subject "Aprovacion cuenta Labmmba"
            body "Su cuenta a sido aprovada por un administrador"
        }
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

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def update_personal_data(){

        def okcontents = ['image/png', 'image/jpeg', 'image/gif']

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

        if(params.campo[0]!="Seleccione área de investigación...") {
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
            redirect(url: g.resource(dir: 'assets/team', file: 'member1.png', absoulute: true))
        }
        else {
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

        UserRole.findByUser(user).delete flush: true
        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    @Transactional
    def eliminar_area() {
        def user = springSecurityService.currentUser
        def field = user.fields.find{it.id == params.area_id.toInteger()}
        field.removeFromUsers(user)

        user.save()
        redirect(controller: "welcome", action: "resumenperfil")
    }

    @Secured(['permitAll'])
    def media(User user) {
        if(user==null){
            if(springSecurityService.currentUser==null&&getPrincipal().username!="admin"){
                redirect(controller: "welcome", action: "index")
                return
            }
            else{
                user = User.findById(springSecurityService.currentUser.id)
            }
        }

        def webrootDir = servletContext.getRealPath("/")
        File media
        if(params.tipo=="imagen"){
            media = new File(webrootDir, "galeria/imagenes/" + user.id + "/" + params.name )
        }
        if(params.tipo=="video"){
            media = new File(webrootDir, "galeria/videos/" + user.id + "/" + params.name )
        }
        if(params.tipo=="imagen_privada"){
            media = new File(webrootDir, "galeria/imagenes/privadas/" + user.id + "/" + params.name )
        }
        if(params.tipo=="video_privado"){
            media = new File(webrootDir, "galeria/videos/privados/" + user.id + "/" + params.name )
        }
        if(media == null || !media.exists()) {
            response.status = 404
        }
        else {
            OutputStream out = response.getOutputStream();
            if(params.tipo=="video" || params.tipo=="video_privado"){
                response.contentType = 'video/mp4'
            }
            out.write(media.bytes);
            out.close()
        }
    }

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    def delete_media() {

        def webrootDir = servletContext.getRealPath("/")
        def user = springSecurityService.currentUser
        File media
        if(params.tipo=="imagen"){
            media = new File(webrootDir, "galeria/imagenes/" + user.id + "/" + params.name )
        }
        if(params.tipo=="video"){
            media = new File(webrootDir, "galeria/videos/" + user.id + "/" + params.name )
        }
        if(params.tipo=="imagen_privada"){
            media = new File(webrootDir, "galeria/imagenes/privadas/" + user.id + "/" + params.name )
        }
        if(params.tipo=="video_privado"){
            media = new File(webrootDir, "galeria/videos/privados/" + user.id + "/" + params.name )
        }
        media.delete()
        redirect action:"editarGaleria", controller:"welcome"
    }

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    def upload_imagen() {
        def okcontents = ['image/png', 'image/jpeg', 'image/gif']
        def f = request.getFile("imagen")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        def user = springSecurityService.currentUser
        File mediaDir
        File fileDest
        if(params.privado){
            mediaDir = new File(webrootDir, "galeria/imagenes/privadas/" + user.id + "/")
        }
        else{
            mediaDir = new File(webrootDir, "galeria/imagenes/" + user.id + "/")
        }
        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"editarGaleria", controller:"welcome"
            return
        }

        if (size> 2097152) {
            flash.message = "Avatar must be less than 2097152 bytes"
            redirect action:"editarGaleria", controller:"welcome"
            return
        }

        if (!mediaDir.exists()) {
            mediaDir.mkdirs()
        }
        if(params.privado.toBoolean()){
            fileDest = new File(webrootDir, "galeria/imagenes/privadas/" + user.id + "/" + f.getOriginalFilename())
        }
        else{
            fileDest = new File(webrootDir, "galeria/imagenes/" + user.id + "/" + f.getOriginalFilename())
        }
        f.transferTo(fileDest)
        redirect action:"editarGaleria", controller:"welcome"
    }

    @Secured(['ROLE_PENDING_USER','ROLE_USER'])
    def upload_video() {


        def okcontents = ['video/mp4']
        def f = request.getFile("video")
        def size = f.bytes.size()
        def webrootDir = servletContext.getRealPath("/")
        def user = springSecurityService.currentUser
        File mediaDir
        File fileDest

        if(params.privado){
            mediaDir = new File(webrootDir, "galeria/videos/privados/" + user.id + "/")
        }
        else{
            mediaDir = new File(webrootDir, "galeria/videos/" + user.id + "/")
        }

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "Document must be one of: ${okcontents}"
            redirect action:"editarGaleria", controller:"welcome"
            return
        }

        if (size> 2097152) {
            flash.message = "Avatar must be less than 2097152 bytes"
            redirect action:"editarGaleria", controller:"welcome"
            return
        }

        if (!mediaDir.exists()) {
            mediaDir.mkdirs()
        }

        if(params.privado.toBoolean()){
            fileDest = new File(webrootDir, "galeria/videos/privados/" + user.id + "/" + f.getOriginalFilename())
        }
        else{
            fileDest = new File(webrootDir, "galeria/videos/" + user.id + "/" + f.getOriginalFilename())
        }
        f.transferTo(fileDest)
        redirect action:"editarGaleria", controller:"welcome"

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
