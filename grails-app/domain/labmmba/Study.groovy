package labmmba

class Study {

    String study_name
    String study_type

    static hasMany = [users: User, thesis: Thesi]
    static belongsTo = [User, University]

	static mapping = {
        thesis joinTable: [name: "study_thesis", key: 'm_thesis_id' ]
    }


    static constraints = {
    }
}
