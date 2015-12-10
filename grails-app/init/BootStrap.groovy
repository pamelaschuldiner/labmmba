import labmmba.Role
import labmmba.Administrator
import labmmba.AdministratorRole
import labmmba.User
import labmmba.UserRole

class BootStrap {

    def init = { 
		def adminRole = new Role('ROLE_ADMIN').save()
		def userRole = new Role('ROLE_USER').save()
		new Role('ROLE_PENDING_USER').save()
		
		def admin = new Administrator(username:'admin',password:'admin',email:'admin@admin.admin',enabled: true).save()
		AdministratorRole.create admin, adminRole, true
		def testUser = new User(username:'test', password:'test',email:'test@test.test',enabled:true,firstname:'test',lastname:'test').save()
		UserRole.create testUser, userRole, true

	}
    def destroy = {
    }
}

