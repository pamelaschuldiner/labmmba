package labmmba

class Magazine {
    String mag_name

    static hasOne = [field: Field]
    static belongsTo = [user: User]

    static constraints = {
        field nullable: true
    }
}
