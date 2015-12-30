package labmmba

class Study {

    String study_name
    String study_type

    static hasOne = [thesis: Thesi]
    static belongsTo = [user: User, university: University]

	static mapping = {
        thesis joinTable: [name: "study_thesis", key: 'm_thesis_id' ]
    }


    static constraints = {
    }
}
