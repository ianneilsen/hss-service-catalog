package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class TeamserviceController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 7, 15)
        [teamserviceInstanceList: Teamservice.list(params), teamserviceInstanceTotal: Teamservice.count()]
    }

    def create() {
        [teamserviceInstance: new Teamservice(params)]
    }

    def save() {
        def teamserviceInstance = new Teamservice(params)
        if (!teamserviceInstance.save(flush: true)) {
            render(view: "create", model: [teamserviceInstance: teamserviceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), teamserviceInstance.id])
        redirect(action: "show", id: teamserviceInstance.id)
    }

    def show(Long id) {
        def teamserviceInstance = Teamservice.get(id)
        if (!teamserviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "list")
            return
        }

        [teamserviceInstance: teamserviceInstance]
    }

    def edit(Long id) {
        def teamserviceInstance = Teamservice.get(id)
        if (!teamserviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "list")
            return
        }

        [teamserviceInstance: teamserviceInstance]
    }

    def update(Long id, Long version) {
        def teamserviceInstance = Teamservice.get(id)
        if (!teamserviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (teamserviceInstance.version > version) {
                teamserviceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'teamservice.label', default: 'Teamservice')] as Object[],
                        "Another user has updated this Teamservice while you were editing")
                render(view: "edit", model: [teamserviceInstance: teamserviceInstance])
                return
            }
        }

        teamserviceInstance.properties = params

        if (!teamserviceInstance.save(flush: true)) {
            render(view: "edit", model: [teamserviceInstance: teamserviceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), teamserviceInstance.id])
        redirect(action: "show", id: teamserviceInstance.id)
    }

    def delete(Long id) {
        def teamserviceInstance = Teamservice.get(id)
        if (!teamserviceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "list")
            return
        }

        try {
            teamserviceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teamservice.label', default: 'Teamservice'), id])
            redirect(action: "show", id: id)
        }
    }
}
