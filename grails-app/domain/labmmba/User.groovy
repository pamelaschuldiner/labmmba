package labmmba

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String firstname
	String lastname
	String password
    String email
	boolean enabled = false
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [books: Book, events: Event, fields: Field, proyects: Proyect, magazines: Magazine, studys: Study]
	static hasOne = [labrol: Labrol]

	User(String username, String password) {
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
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
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
		labrol nullable: true
		username blank: false, unique: true
		password blank: false
		email email: true
	}

	static mapping = {
		password column: '`password`'
		proyects joinTable: [name: "proyect_user", key: 'm_user_id' ]

	}
}
