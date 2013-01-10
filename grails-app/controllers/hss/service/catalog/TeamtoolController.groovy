package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class TeamtoolController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [teamtoolInstanceList: Teamtool.list(params), teamtoolInstanceTotal: Teamtool.count()]
    }

    def create() {
        [teamtoolInstance: new Teamtool(params)]
    }

    def save() {
        def teamtoolInstance = new Teamtool(params)
        if (!teamtoolInstance.save(flush: true)) {
            render(view: "create", model: [teamtoolInstance: teamtoolInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), teamtoolInstance.id])
        redirect(action: "show", id: teamtoolInstance.id)
    }

    def show(Long id) {
        def teamtoolInstance = Teamtool.get(id)
        if (!teamtoolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "list")
            return
        }

        [teamtoolInstance: teamtoolInstance]
    }

    def edit(Long id) {
        def teamtoolInstance = Teamtool.get(id)
        if (!teamtoolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "list")
            return
        }

        [teamtoolInstance: teamtoolInstance]
    }

    def update(Long id, Long version) {
        def teamtoolInstance = Teamtool.get(id)
        if (!teamtoolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (teamtoolInstance.version > version) {
                teamtoolInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'teamtool.label', default: 'Teamtool')] as Object[],
                        "Another user has updated this Teamtool while you were editing")
                render(view: "edit", model: [teamtoolInstance: teamtoolInstance])
                return
            }
        }

        teamtoolInstance.properties = params

        if (!teamtoolInstance.save(flush: true)) {
            render(view: "edit", model: [teamtoolInstance: teamtoolInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), teamtoolInstance.id])
        redirect(action: "show", id: teamtoolInstance.id)
    }

    def delete(Long id) {
        def teamtoolInstance = Teamtool.get(id)
        if (!teamtoolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "list")
            return
        }

        try {
            teamtoolInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teamtool.label', default: 'Teamtool'), id])
            redirect(action: "show", id: id)
        }
    }
}
