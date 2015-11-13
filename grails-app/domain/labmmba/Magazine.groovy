package labmmba

class Magazine {
    String mag_name

    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
