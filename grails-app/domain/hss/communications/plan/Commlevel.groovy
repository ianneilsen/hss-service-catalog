package hss.communications.plan

class Commlevel {



    String comlevelname
    String comleveldsecrip

    static constraints = {
        comlevelname(blank: false,size: 2..200,unique: true)
        comleveldsecrip(blank: false,size: 2..200)
    }
    String toString(){
        comlevelname
    }
}
