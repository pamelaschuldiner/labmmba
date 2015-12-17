package labmmba

class Field {
    String field_name

    static hasMany = [users: User, magazines: Magazine]
    static belongsTo = User

    static constraints = {
    }
}
