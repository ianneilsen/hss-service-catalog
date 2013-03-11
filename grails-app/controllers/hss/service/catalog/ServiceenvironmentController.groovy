package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServiceenvironmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [serviceenvironmentInstanceList: Serviceenvironment.list(params), serviceenvironmentInstanceTotal: Serviceenvironment.count()]
    }

    def create() {
        [serviceenvironmentInstance: new Serviceenvironment(params)]
    }

    def save() {
        def serviceenvironmentInstance = new Serviceenvironment(params)
        if (!serviceenvironmentInstance.save(flush: true)) {
            render(view: "create", model: [serviceenvironmentInstance: serviceenvironmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), serviceenvironmentInstance.id])
        redirect(action: "show", id: serviceenvironmentInstance.id)
    }

    def show(Long id) {
        def serviceenvironmentInstance = Serviceenvironment.get(id)
        if (!serviceenvironmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "list")
            return
        }

        [serviceenvironmentInstance: serviceenvironmentInstance]
    }

    def edit(Long id) {
        def serviceenvironmentInstance = Serviceenvironment.get(id)
        if (!serviceenvironmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "list")
            return
        }

        [serviceenvironmentInstance: serviceenvironmentInstance]
    }

    def update(Long id, Long version) {
        def serviceenvironmentInstance = Serviceenvironment.get(id)
        if (!serviceenvironmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (serviceenvironmentInstance.version > version) {
                serviceenvironmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'serviceenvironment.label', default: 'Serviceenvironment')] as Object[],
                        "Another user has updated this Serviceenvironment while you were editing")
                render(view: "edit", model: [serviceenvironmentInstance: serviceenvironmentInstance])
                return
            }
        }

        serviceenvironmentInstance.properties = params

        if (!serviceenvironmentInstance.save(flush: true)) {
            render(view: "edit", model: [serviceenvironmentInstance: serviceenvironmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), serviceenvironmentInstance.id])
        /*redirect(action: "show", id: serviceenvironmentInstance.id)*/
        redirect(controller: "teamservice", action: "show", id: params.id)
    }

    def delete(Long id) {
        def serviceenvironmentInstance = Serviceenvironment.get(id)
        if (!serviceenvironmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "list")
            return
        }

        try {
            serviceenvironmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'serviceenvironment.label', default: 'Serviceenvironment'), id])
            redirect(action: "show", id: id)
        }
    }
}
