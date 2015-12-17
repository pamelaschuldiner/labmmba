package labmmba

class Thesi {

	String thesis_name
<<<<<<< HEAD
=======
	String thesis_url
>>>>>>> origin/master
	String thesis_tutor
	String thesis_cotutor

    static hasMany = [studys: Study]
    static belongsTo = Study

	static mapping = {
        studys joinTable: [name: "study_thesis", key: 'm_study_id' ]
    }

    static constraints = {
    }
}
