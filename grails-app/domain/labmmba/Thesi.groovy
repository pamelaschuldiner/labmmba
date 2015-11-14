package labmmba

class Thesi {

	String thesis_name
	String thesis_type

    static hasMany = [studys: Study]
    static belongsTo = Study


    static constraints = {
    }
}
