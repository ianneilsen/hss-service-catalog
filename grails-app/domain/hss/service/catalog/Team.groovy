package hss.service.catalog

class Team {

    String teamname
    String teamdivision
    String teamcontact
    String teammembers
    Date dateCreated
    Date lastUpdated

    static  hasMany = [teamservices: Teamservice]

    static constraints = {
        teamname(unique: true, blank: false, size: 2..255)
        teamdivision(blank: false, size: 2..255)
        teamcontact()
        teammembers(nullable: true, url: true)
    }

    String toString(){
        teamname
    }

}