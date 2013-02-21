package hss.communications.plan

import org.springframework.dao.DataIntegrityViolationException

class CommunicationplanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [communicationplanInstanceList: Communicationplan.list(params), communicationplanInstanceTotal: Communicationplan.count()]
    }

    def create() {
        [communicationplanInstance: new Communicationplan(params)]
    }

    def save() {
        def communicationplanInstance = new Communicationplan(params)
        if (!communicationplanInstance.save(flush: true)) {
            render(view: "create", model: [communicationplanInstance: communicationplanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), communicationplanInstance.id])
        redirect(action: "show", id: communicationplanInstance.id)
    }

    def show(Long id) {
        def communicationplanInstance = Communicationplan.get(id)
        if (!communicationplanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "list")
            return
        }

        [communicationplanInstance: communicationplanInstance]
    }

    def edit(Long id) {
        def communicationplanInstance = Communicationplan.get(id)
        if (!communicationplanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "list")
            return
        }

        [communicationplanInstance: communicationplanInstance]
    }

    def update(Long id, Long version) {
        def communicationplanInstance = Communicationplan.get(id)
        if (!communicationplanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communicationplanInstance.version > version) {
                communicationplanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'communicationplan.label', default: 'Communicationplan')] as Object[],
                        "Another user has updated this Communicationplan while you were editing")
                render(view: "edit", model: [communicationplanInstance: communicationplanInstance])
                return
            }
        }

        communicationplanInstance.properties = params

        if (!communicationplanInstance.save(flush: true)) {
            render(view: "edit", model: [communicationplanInstance: communicationplanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), communicationplanInstance.id])
        redirect(action: "show", id: communicationplanInstance.id)
    }

    def delete(Long id) {
        def communicationplanInstance = Communicationplan.get(id)
        if (!communicationplanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "list")
            return
        }

        try {
            communicationplanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'communicationplan.label', default: 'Communicationplan'), id])
            redirect(action: "show", id: id)
        }
    }
}
