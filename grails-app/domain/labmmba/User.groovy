package labmmba

import java.sql.Blob

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String firstname
	String lastname
	String password
    String email
	Byte[] avatar
	String avatarType
	boolean enabled = false
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

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
		username blank: false, unique: true
		password blank: false
		avatar(nullable:true, maxSize: 16384 /* 16K */)
		avatarType(nullable:true)
	}

	static mapping = {
		avatar column: "avatar", sqlType: "blob"
		password column: '`password`'
	}
}
