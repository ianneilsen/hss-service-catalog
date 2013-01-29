package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServicecatagoryController {

    static scaffold = "true"

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicecatagoryInstanceList: Servicecatagory.list(params), servicecatagoryInstanceTotal: Servicecatagory.count()]
    }

    def create() {
        [servicecatagoryInstance: new Servicecatagory(params)]
    }

    def save() {
        def servicecatagoryInstance = new Servicecatagory(params)
        if (!servicecatagoryInstance.save(flush: true)) {
            render(view: "create", model: [servicecatagoryInstance: servicecatagoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), servicecatagoryInstance.id])
        redirect(action: "show", id: servicecatagoryInstance.id)
    }

    def show(Long id) {
        def servicecatagoryInstance = Servicecatagory.get(id)
        if (!servicecatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "list")
            return
        }

        [servicecatagoryInstance: servicecatagoryInstance]
    }

    def edit(Long id) {
        def servicecatagoryInstance = Servicecatagory.get(id)
        if (!servicecatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "list")
            return
        }

        [servicecatagoryInstance: servicecatagoryInstance]
    }

    def update(Long id, Long version) {
        def servicecatagoryInstance = Servicecatagory.get(id)
        if (!servicecatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicecatagoryInstance.version > version) {
                servicecatagoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'servicecatagory.label', default: 'Servicecatagory')] as Object[],
                        "Another user has updated this Servicecatagory while you were editing")
                render(view: "edit", model: [servicecatagoryInstance: servicecatagoryInstance])
                return
            }
        }

        servicecatagoryInstance.properties = params

        if (!servicecatagoryInstance.save(flush: true)) {
            render(view: "edit", model: [servicecatagoryInstance: servicecatagoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), servicecatagoryInstance.id])
        redirect(action: "show", id: servicecatagoryInstance.id)
    }

    def delete(Long id) {
        def servicecatagoryInstance = Servicecatagory.get(id)
        if (!servicecatagoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "list")
            return
        }

        try {
            servicecatagoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servicecatagory.label', default: 'Servicecatagory'), id])
            redirect(action: "show", id: id)
        }
    }
}
