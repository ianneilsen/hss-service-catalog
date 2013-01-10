package hss.service.catalog

class Costanalysis {

    String costname
    String rapcost
    String eipcost
    String pacost
    String iedcost
    String engopscost
    String qecost
    String othercosts

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        costname(blank: false)
        rapcost(size: 2..500)
        eipcost(size: 2..500)
        pacost(size: 2..500)
        iedcost(size: 2..500)
        engopscost(size: 2..500)
        qecost(size: 2..500)
        othercosts(size: 2..500)
    }
    String toString(){
        costname
    }
}
