package hss.service.catalog

class Teamservice {

    String servicename
    String servicedescription
    String coreresponsibility
    String competencyalignment

    static hasMany = [tools: Teamtool, servicesusers: Serviceuser, costs: Costanalysis, servicebenefits: Servicebenefit, competitors: Servicecompetitor, serviceenvironments: Serviceenvironment, swots: Swot]
    static belongsTo = [team: Team]

    static constraints = {
        servicename(blank: false)
        servicedescription(size: 2..1000)
        coreresponsibility(size: 2..1000)
        competencyalignment(size: 2..1000)
    }
    String toString(){
     servicename
    }
}
