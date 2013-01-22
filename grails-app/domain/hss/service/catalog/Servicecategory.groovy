package hss.service.catalog

class Servicecategory {

    String categoryname

   /* static hasMany = [teamservices: Teamservice]*/

    static constraints = {
        categoryname(unique: true, blank: false, size: 2..100)
    }

    String toString() {
        categoryname
    }
}
