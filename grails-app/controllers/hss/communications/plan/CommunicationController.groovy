package hss.communications.plan

import org.springframework.dao.DataIntegrityViolationException

class CommunicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [communicationInstanceList: Communication.list(params), communicationInstanceTotal: Communication.count()]
    }

    def create() {
        [communicationInstance: new Communication(params)]
    }

    def save() {
        def communicationInstance = new Communication(params)
        if (!communicationInstance.save(flush: true)) {
            render(view: "create", model: [communicationInstance: communicationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'communication.label', default: 'Communication'), communicationInstance.id])
        redirect(action: "show", id: communicationInstance.id)
    }

    def show(Long id) {
        def communicationInstance = Communication.get(id)
        if (!communicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "list")
            return
        }

        [communicationInstance: communicationInstance]
    }

    def edit(Long id) {
        def communicationInstance = Communication.get(id)
        if (!communicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "list")
            return
        }

        [communicationInstance: communicationInstance]
    }

    def update(Long id, Long version) {
        def communicationInstance = Communication.get(id)
        if (!communicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communicationInstance.version > version) {
                communicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'communication.label', default: 'Communication')] as Object[],
                        "Another user has updated this Communication while you were editing")
                render(view: "edit", model: [communicationInstance: communicationInstance])
                return
            }
        }

        communicationInstance.properties = params

        if (!communicationInstance.save(flush: true)) {
            render(view: "edit", model: [communicationInstance: communicationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'communication.label', default: 'Communication'), communicationInstance.id])
        redirect(action: "show", id: communicationInstance.id)
    }

    def delete(Long id) {
        def communicationInstance = Communication.get(id)
        if (!communicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "list")
            return
        }

        try {
            communicationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'communication.label', default: 'Communication'), id])
            redirect(action: "show", id: id)
        }
    }
}
