package hss.service.catalog

class Swot {

    String swotnumber
    String strength
    String weaknesses
    String threats
    String opportunities
    String gaps

    static belongsTo = [teamservices:  Teamservice]

    static constraints = {
        swotnumber()
        //helpful internal
        strength(size: 2..500)
        //helpful external
        opportunities(size: 2..500)
        //harmful internal
        weaknesses(size: 2..500)
        //harmful external
        threats(size: 2..500)
        gaps(size: 2..500)
    }
    String toString(){
        swotnumber
    }

}
