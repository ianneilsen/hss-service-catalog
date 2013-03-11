package hss.service.catalog

class Teamtool {

    String toolname
    String tooluse
    String toolmotivation
    String toolsatisfaction

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        toolname(blank: false)
        tooluse(size: 2..1000)
        toolmotivation(size: 2..1000)
        toolsatisfaction()
    }
    String toString(){
     toolname
    }
}
