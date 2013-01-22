package hss.service.catalog

class Servicelevel {

    String slaname   //sla type i.e. data recovery, network setup, switch maintenance
    String slatype  //sla category  -
    String servicehours
    String businesshours
    String peakusage //peak periods of Usage
    String responsetime
    String peakusers  //peak number of Users
    String offpeakusers  //offpeak number of Users
    String whatifnoservice  //what to do if cant supply service
    String slareview  //the is sla Reviewed when
    String implementrequire //implementation Requirements
    String servicelifetime  //how long does service Last
    String frequencyservice //frequency of Service

    static belongsTo = [teamservices: Teamservice]

    static constraints = {
        slaname()
        slatype()
        servicehours()
        businesshours()
        peakusage()
        responsetime()
        peakusers()
        offpeakusers()
        whatifnoservice()
        slareview()
        implementrequire()
        servicelifetime()
        frequencyservice()
    }
}
