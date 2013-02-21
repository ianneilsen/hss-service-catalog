package hss.communications.plan

class Communicationplan {

    static hasMany = [communications: Communication]

    String planname
    String planoverview
    String planmeasures
    String planchanges

    static constraints = {
        planname(blank: false)
        planoverview(size: 2..2000)
        planmeasures(size: 2..2000)
        planchanges(size: 2..2000)
    }

   String toString (){
       planname
   }
}
