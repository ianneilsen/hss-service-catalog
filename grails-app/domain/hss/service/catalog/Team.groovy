package hss.service.catalog

class Team {

    String teamname
    String teamdivision
    String teamcontact
    Date dateCreated
    Date lastUpdated

    static  hasMany = [teamservices: Teamservice]



    static constraints = {
        teamname(unique: true, blank: false, size: 2..255)
        teamdivision( blank: false, size: 2..255)
    }
    String toString(){
     teamname
     teamdivision
    }
}
