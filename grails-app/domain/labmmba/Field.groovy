package labmmba

class Field {
    String field_name

    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
