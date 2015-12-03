import labmmba.Role
import labmmba.Administrator
import labmmba.AdministratorRole
import labmmba.User
import labmmba.UserRole

class BootStrap {

    def init = { 
		def adminRole = new Role('ROLE_ADMIN').save()
		new Role('ROLE_USER').save()
		new Role('ROLE_PENDING_USER').save()
		
		def admin = new Administrator(username:'admin',password:'admin',email:'admin@admin.admin',enabled: true).save()
		AdministratorRole.create admin, adminRole, true
		
    }
    def destroy = {
    }
}

