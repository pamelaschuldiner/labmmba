import labmmba.Role
import labmmba.Administrator
import labmmba.AdministratorRole
import labmmba.User
import labmmba.UserRole

class BootStrap {

    def init = {
		def adminRole = new Role('ROLE_ADMIN').save()
		def userRole= new  Role('ROLE_USER').save()
		def pendingRole = new Role('ROLE_PENDING_USER').save()

		def admin = new Administrator(username:'admin',password:'admin',email:'admin@admin.admin').save()
		AdministratorRole.create admin, adminRole, true

		def testUser1 = new User(username:'test',password:'test',email:'test@test.cl',firstname:"test",lastname:"test",enabled:true).save()
		UserRole.create testUser1, userRole, true
		def testUser2 = new User(username:'test2',password:'test2',email:'test2@test.cl',firstname:"test2",lastname:"test2",enabled:true).save()
		UserRole.create testUser2, userRole, true
		testUser1.sendMessage(2,"Hola mundo")
    }
    def destroy = {
    }
}

