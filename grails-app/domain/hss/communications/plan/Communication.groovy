package hss.communications.plan

class Communication {

    static  belongsTo = [commplan: Communicationplan]
    Commlevel commlevel

    String communication
    String purpose
    String targetGroups
    String expectations
    String communicator
    String datacollector
    String monitor
    String commchannelsmedia
    String timingfrequency
    String processdetailsdescrip

    static constraints = {
        communication(blank: false)
        purpose(size: 2..500)
        targetGroups()
        expectations(size: 2..1000)
        communicator()
        datacollector()
        monitor()
        commchannelsmedia()
        timingfrequency()
        processdetailsdescrip(size: 2..2000)
    }
/*
    String toString(){
        communication
    }*/
}
