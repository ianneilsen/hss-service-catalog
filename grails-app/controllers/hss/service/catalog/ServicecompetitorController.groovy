package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServicecompetitorController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicecompetitorInstanceList: Servicecompetitor.list(params), servicecompetitorInstanceTotal: Servicecompetitor.count()]
    }

    def create() {
        [servicecompetitorInstance: new Servicecompetitor(params)]
    }

    def save() {
        def servicecompetitorInstance = new Servicecompetitor(params)
        if (!servicecompetitorInstance.save(flush: true)) {
            render(view: "create", model: [servicecompetitorInstance: servicecompetitorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), servicecompetitorInstance.id])
        redirect(action: "show", id: servicecompetitorInstance.id)
    }

    def show(Long id) {
        def servicecompetitorInstance = Servicecompetitor.get(id)
        if (!servicecompetitorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "list")
            return
        }

        [servicecompetitorInstance: servicecompetitorInstance]
    }

    def edit(Long id) {
        def servicecompetitorInstance = Servicecompetitor.get(id)
        if (!servicecompetitorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "list")
            return
        }

        [servicecompetitorInstance: servicecompetitorInstance]
    }

    def update(Long id, Long version) {
        def servicecompetitorInstance = Servicecompetitor.get(id)
        if (!servicecompetitorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicecompetitorInstance.version > version) {
                servicecompetitorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'servicecompetitor.label', default: 'Servicecompetitor')] as Object[],
                        "Another user has updated this Servicecompetitor while you were editing")
                render(view: "edit", model: [servicecompetitorInstance: servicecompetitorInstance])
                return
            }
        }

        servicecompetitorInstance.properties = params

        if (!servicecompetitorInstance.save(flush: true)) {
            render(view: "edit", model: [servicecompetitorInstance: servicecompetitorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), servicecompetitorInstance.id])
        redirect(action: "show", id: servicecompetitorInstance.id)
    }

    def delete(Long id) {
        def servicecompetitorInstance = Servicecompetitor.get(id)
        if (!servicecompetitorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "list")
            return
        }

        try {
            servicecompetitorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servicecompetitor.label', default: 'Servicecompetitor'), id])
            redirect(action: "show", id: id)
        }
    }
}
