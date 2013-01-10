package hss.service.catalog

class Serviceenvironment {

    String successfactors
    String successmeasure

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        successfactors(blank: false,size: 2..1000)
        successmeasure(size: 2..1000)
    }
    String toString (){
        successfactors
    }
}
