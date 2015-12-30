package labmmba

import java.sql.Date

class Proyect {

    String proy_name
    Date proy_start
    Date proy_end
    String proy_role
    String proy_obs


    static belongsTo = [user: User]

    static mapping = {
    users joinTable: [name: "proyect_user", key: 'm_proyect_id' ]
}
    static constraints = {
    }
}
