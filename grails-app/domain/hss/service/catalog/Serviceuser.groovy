package hss.service.catalog

class Serviceuser {

    String users
    String role
    String howtheyuse
    String motivation
    Integer estimatedusers
    String peakusetimes
    String frequencyofserviceoffering

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        users(blank: false)
        role(blank: false)
        howtheyuse(blank: true, size: 2..1000)
        motivation(blank: true, size: 2..1000)
        peakusetimes(size: 2..150)
        frequencyofserviceoffering(size: 2..100)
    }
    String toString(){
     users
     role
    }
}
//split field frequency of offering into 2  1- how many times did the user request the service and how many times did the team supply the service.
