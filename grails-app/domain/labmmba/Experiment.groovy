package labmmba

class Experiment {
    String exp_name

    //DEBO AGREGAR FOREIGN KEY field_id INTEGER

    static hasMany = [users: User]
    static belongsTo = User



    static constraints = {
    }
}
