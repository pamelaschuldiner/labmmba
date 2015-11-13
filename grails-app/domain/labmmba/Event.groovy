package labmmba

import java.sql.Date

class Event {
    String event_name
    String event_place
    String event_city
    String event_count
    Date event_date
    String event_url

    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {

    }
}
