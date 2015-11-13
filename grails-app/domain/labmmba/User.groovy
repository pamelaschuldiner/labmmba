package labmmba

class User {

    String user_name
    String user_type
    String user_pic
    String user_lastname
    String user_alias
    String user_pass
    String user_email

    static hasMany = [books: Book, events: Event, experiments: Experiment, fields: Field, proyects: Proyect, magazines: Magazine, studys: Study]


    static constraints = {
    }
}
