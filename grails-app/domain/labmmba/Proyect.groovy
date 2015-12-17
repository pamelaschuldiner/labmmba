package labmmba

import java.sql.Date

class Proyect {

    String proy_name
    Date proy_start
    Date proy_end
    String proy_role
    String proy_obs
    //DEBO AGREGAR FOREIGN KEY field_id INTEGER

    static hasMany = [users: User]
    static belongsTo = User

    static mapping = {
    users joinTable: [name: "proyect_user", key: 'm_proyect_id' ]
}
    static constraints = {
    }
}
