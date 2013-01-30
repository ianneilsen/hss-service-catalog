package hss.service.catalog

class Costanalysis {

    String role
    String reason
    Double cost
    String othercosts
    BigDecimal totalmoneycosts
    Date dateCreated
    Date lastUpdated

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
       role(blank: false)
        reason()
        cost(blank: false)
        othercosts()


    }
    String toString(){
     role
    }
}
