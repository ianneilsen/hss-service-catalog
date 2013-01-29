package hss.service.catalog

class Servicecatagory {

    String catagoryname

    static hasMany = [teamservices: Teamservice]

    static constraints = {
        catagoryname(unique: true, size: 2..170)
    }

    String toString (){
        catagoryname
    }
}
