package labmmba

class Book {
    String book_name
    String book_ed
    Integer book_year
    String book_isbn
    String book_authors
    String book_url


    static hasMany = [users: User]
    static belongsTo = User

    static constraints = {
    }
}
