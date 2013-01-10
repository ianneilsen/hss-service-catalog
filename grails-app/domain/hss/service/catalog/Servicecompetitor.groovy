package hss.service.catalog

class Servicecompetitor {

    String competitorname
    String competitorservice
    String competitordescription
    String compservicedifference
    String whousescompservice
    String competitorsmotivation
    String competitorvalue

    static belongsTo = [teamservices:  Teamservice]

    static constraints = {
        competitorname(blank: false)
        competitorservice()
        competitordescription(size: 2..1000)
        compservicedifference(size: 2..1000)
        whousescompservice(size: 2..1000)
        competitorsmotivation(size: 2..1000)
        competitorvalue(size: 2..1000)
    }
    String toString(){
     competitorname
    }
}
