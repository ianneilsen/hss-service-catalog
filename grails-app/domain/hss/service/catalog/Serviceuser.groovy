package hss.service.catalog

class Serviceuser {

    String users
    String role
    String howtheyuse
    String motivation
    String peakusetimes
    String frequencyofserviceoffering

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        users(blank: false)
        role(blank: false)
        howtheyuse(blank: false, size: 2..1000)
        motivation(blank: false, size: 2..1000)
    }
    String toString(){
     users
     role
    }
}
