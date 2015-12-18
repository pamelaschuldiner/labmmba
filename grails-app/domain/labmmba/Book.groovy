package labmmba

class Book {
    String book_name
    String book_ed
    Date book_year
    String book_isbn
    String book_authors


    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
