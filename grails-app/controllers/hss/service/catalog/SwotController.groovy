package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class SwotController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [swotInstanceList: Swot.list(params), swotInstanceTotal: Swot.count()]
    }

    def create() {
        [swotInstance: new Swot(params)]
    }

    def save() {
        def swotInstance = new Swot(params)
        if (!swotInstance.save(flush: true)) {
            render(view: "create", model: [swotInstance: swotInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'swot.label', default: 'Swot'), swotInstance.id])
        redirect(action: "show", id: swotInstance.id)
    }

    def show(Long id) {
        def swotInstance = Swot.get(id)
        if (!swotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "list")
            return
        }

        [swotInstance: swotInstance]
    }

    def edit(Long id) {
        def swotInstance = Swot.get(id)
        if (!swotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "list")
            return
        }

        [swotInstance: swotInstance]
    }

    def update(Long id, Long version) {
        def swotInstance = Swot.get(id)
        if (!swotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (swotInstance.version > version) {
                swotInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'swot.label', default: 'Swot')] as Object[],
                        "Another user has updated this Swot while you were editing")
                render(view: "edit", model: [swotInstance: swotInstance])
                return
            }
        }

        swotInstance.properties = params

        if (!swotInstance.save(flush: true)) {
            render(view: "edit", model: [swotInstance: swotInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'swot.label', default: 'Swot'), swotInstance.id])
       /* redirect(action: "show", id: swotInstance.id)*/
        redirect(controller: "teamservice", action: "show", id: params.id)
    }

    def delete(Long id) {
        def swotInstance = Swot.get(id)
        if (!swotInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "list")
            return
        }

        try {
            swotInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'swot.label', default: 'Swot'), id])
            redirect(action: "show", id: id)
        }
    }
}
