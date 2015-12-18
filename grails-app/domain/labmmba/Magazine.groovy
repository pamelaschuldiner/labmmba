package labmmba

class Magazine {
    String mag_name

    static hasOne = [field: Field]
    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
        field nullable: true
    }
}
