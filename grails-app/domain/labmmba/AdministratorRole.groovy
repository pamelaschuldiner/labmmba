package labmmba

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class AdministratorRole implements Serializable {

	private static final long serialVersionUID = 1

	Administrator administrator
	Role role

	AdministratorRole(Administrator u, Role r) {
		this()
		administrator = u
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof AdministratorRole)) {
			return false
		}

		other.administrator?.id == administrator?.id && other.role?.id == role?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (administrator) builder.append(administrator.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static AdministratorRole get(long administratorId, long roleId) {
		criteriaFor(administratorId, roleId).get()
	}

	static boolean exists(long administratorId, long roleId) {
		criteriaFor(administratorId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long administratorId, long roleId) {
		AdministratorRole.where {
			administrator == Administrator.load(administratorId) &&
			role == Role.load(roleId)
		}
	}

	static AdministratorRole create(Administrator administrator, Role role, boolean flush = false) {
		def instance = new AdministratorRole(administrator, role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Administrator u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = AdministratorRole.where { administrator == u && role == r }.deleteAll()

		if (flush) { AdministratorRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Administrator u, boolean flush = false) {
		if (u == null) return

		AdministratorRole.where { administrator == u }.deleteAll()

		if (flush) { AdministratorRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		AdministratorRole.where { role == r }.deleteAll()

		if (flush) { AdministratorRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, AdministratorRole ur ->
			if (ur.administrator == null || ur.administrator.id == null) return
			boolean existing = false
			AdministratorRole.withNewSession {
				existing = AdministratorRole.exists(ur.administrator.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['administrator', 'role']
		version false
	}
}
