package labmmba

class Administrator implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	Administrator(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof Administrator && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		AdministratorRole.findAllByAdministrator(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}
}
