package hss.service.catalog

class Swot {

    String swotnumber
    String strength
    String weaknesses
    String threats
    String opportunities
    String gaps
    String swotAnalysis

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
        swotAnalysis(size: 2..2000)
    }
    String toString(){
        swotnumber
    }

}

//new analysis field for users to write down their analysis of their swot after completing
