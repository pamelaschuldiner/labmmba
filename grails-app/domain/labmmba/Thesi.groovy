package labmmba

class Thesi {

	String thesis_name
	String thesis_tutor
	String thesis_cotutor
    User cuentaTutor
    Boolean active = false
    User cuentaAutor

    static hasMany = [studys: Study]
    static belongsTo = Study

	static mapping = {
        studys joinTable: [name: "study_thesis", key: 'm_study_id' ]
    }

    static constraints = {
        thesis_cotutor nullable: true
        cuentaTutor nullable: true
        cuentaAutor nullable: true
    }

}
