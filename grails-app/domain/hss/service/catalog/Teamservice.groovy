package hss.service.catalog

class Teamservice {

    String servicename
    String servicedescription
    String coreresponsibility
    String competencyalignment
    String servicecontact
    Date dateCreated
    Date lastUpdated

    static hasMany = [tools: Teamtool, servicesusers: Serviceuser, costs: Costanalysis, servicebenefits: Servicebenefit, competitors: Servicecompetitor, serviceenvironments: Serviceenvironment, swots: Swot]
    static belongsTo = [team: Team]
    /*Servicecategory servicecategory*/

    static constraints = {
        servicename(blank: false)
        servicedescription(size: 2..1000)
        coreresponsibility(size: 2..1000)
        competencyalignment(size: 2..1000)
        servicecontact(size: 2..100, blank: false)

    }
    String toString(){
     servicename
    }
}
