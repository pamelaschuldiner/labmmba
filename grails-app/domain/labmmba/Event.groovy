package labmmba

import java.sql.Date

class Event {
    String event_name
    String event_city
    String event_count
    Date event_datei
    Date event_datef
    String event_pname

    static belongsTo = [user: User]

    static constraints = {

    }
}
