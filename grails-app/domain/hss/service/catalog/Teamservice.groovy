package hss.service.catalog

class Teamservice {

    String servicename
    String servicedescription
    String coreresponsibility
    String competencyalignment
    String servicecontact
    String baselevelservices
    String notincludeservices
    String serviceowner
    String serviceactive
    String servicedocumentation
    Date dateCreated
    Date lastUpdated

    static hasMany = [tools: Teamtool, servicesusers: Serviceuser, costs: Costanalysis, servicebenefits: Servicebenefit, competitors: Servicecompetitor, serviceenvironments: Serviceenvironment, swots: Swot, servicelevels: Servicelevel]
    static belongsTo = [team: Team]
    static hasOne = [servicecatagory: Servicecatagory]

    static constraints = {
        servicename(blank: false)
        servicedescription(size: 2..1000)
        coreresponsibility(size: 2..1000)
        competencyalignment(size: 2..1000)
        servicecontact(size: 2..100, blank: false)
        baselevelservices(blank: false, size: 2..500)
        notincludeservices(size: 2..500)
        serviceowner()
        serviceactive(inList: ["Yes","No"])
        servicedocumentation(url: "true")

    }
    String toString(){
     servicename
    }
}


/*
base level services
services not included
service availablity

service catagory
service premium,silver, gold
service owner
service contact
service charge*/
