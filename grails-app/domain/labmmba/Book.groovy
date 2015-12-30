package labmmba

class Book {
    String book_name
    String book_ed
    Date book_year
    String book_isbn
    String book_authors

    static belongsTo = [user: User]

    static constraints = {
    }
}
