package labmmba

class University {

    String uni_name
    String uni_city
    String uni_count

    static hasMany = [studys: Study, thesis: Thesi]

    static constraints = {
    }
}
