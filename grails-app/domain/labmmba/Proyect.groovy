package labmmba

import java.sql.Date

class Proyect {

    String proy_name
    Date proy_start
    Date proy_end
    //DEBO AGREGAR FOREIGN KEY field_id INTEGER

    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
