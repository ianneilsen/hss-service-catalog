package hss.service.catalog

class Teamtool {

    String toolname
    String tooluse
    String toolmotivation

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        toolname()
        tooluse(size: 2..1000)
        toolmotivation(size: 2..1000)
    }
    String toString(){
     toolname
    }
}
