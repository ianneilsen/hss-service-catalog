

import hss.service.catalog.Servicecatagory
import hss.service.catalog.Team
import hss.service.catalog.Teamservice

class BootStrap {

    def init = { servletContext ->

def newservicecat = new Servicecatagory(catagoryname:"NA").save()

def team = new Team(teamname:"Reports and Publications", teamdivision:"Hosted and Shared Services", teamcontact:"mdoyle", teammembers:"http://google.com").save()
/*
def newteamservice = new Teamservice(servicename:"Docs QE", servicedescription:"Does docs qe stuff",coreresponsibility:"core responsibility stuff",competencyalignment:"competency stuff", servicecontact:"modyle",
              baselevelservices:"we do this as a minimum",notincludeservices:"we dont do this",serviceowner:"mdoyle",serviceactive:"Yes",servicedocumentation:"http://google.com",  servicecatagory: newservicecat)
        team.addToTeamservices(newteamservice).save()*/




    }
    def destroy = {
    }
}
