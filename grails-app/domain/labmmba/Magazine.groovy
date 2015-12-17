package labmmba

class Magazine {
    String mag_url
    

    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
