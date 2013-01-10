package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServicebenefitController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicebenefitInstanceList: Servicebenefit.list(params), servicebenefitInstanceTotal: Servicebenefit.count()]
    }

    def create() {
        [servicebenefitInstance: new Servicebenefit(params)]
    }

    def save() {
        def servicebenefitInstance = new Servicebenefit(params)
        if (!servicebenefitInstance.save(flush: true)) {
            render(view: "create", model: [servicebenefitInstance: servicebenefitInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), servicebenefitInstance.id])
        redirect(action: "show", id: servicebenefitInstance.id)
    }

    def show(Long id) {
        def servicebenefitInstance = Servicebenefit.get(id)
        if (!servicebenefitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "list")
            return
        }

        [servicebenefitInstance: servicebenefitInstance]
    }

    def edit(Long id) {
        def servicebenefitInstance = Servicebenefit.get(id)
        if (!servicebenefitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "list")
            return
        }

        [servicebenefitInstance: servicebenefitInstance]
    }

    def update(Long id, Long version) {
        def servicebenefitInstance = Servicebenefit.get(id)
        if (!servicebenefitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicebenefitInstance.version > version) {
                servicebenefitInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'servicebenefit.label', default: 'Servicebenefit')] as Object[],
                        "Another user has updated this Servicebenefit while you were editing")
                render(view: "edit", model: [servicebenefitInstance: servicebenefitInstance])
                return
            }
        }

        servicebenefitInstance.properties = params

        if (!servicebenefitInstance.save(flush: true)) {
            render(view: "edit", model: [servicebenefitInstance: servicebenefitInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), servicebenefitInstance.id])
        redirect(action: "show", id: servicebenefitInstance.id)
    }

    def delete(Long id) {
        def servicebenefitInstance = Servicebenefit.get(id)
        if (!servicebenefitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "list")
            return
        }

        try {
            servicebenefitInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servicebenefit.label', default: 'Servicebenefit'), id])
            redirect(action: "show", id: id)
        }
    }
}
