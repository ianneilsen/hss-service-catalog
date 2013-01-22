package hss.service.catalog

class Servicebenefit {

    String benefit
    String benefitmeasure

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        benefit(size: 2..1000)
        benefitmeasure(size: 2..1000)
    }
    String toString(){
     benefit
    }
}
               //todo add in a category which service benefits can be listed against //catgeories to be decided
