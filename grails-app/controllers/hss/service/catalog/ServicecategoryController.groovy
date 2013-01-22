package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServicecategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicecategoryInstanceList: Servicecategory.list(params), servicecategoryInstanceTotal: Servicecategory.count()]
    }

    def create() {
        [servicecategoryInstance: new Servicecategory(params)]
    }

    def save() {
        def servicecategoryInstance = new Servicecategory(params)
        if (!servicecategoryInstance.save(flush: true)) {
            render(view: "create", model: [servicecategoryInstance: servicecategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), servicecategoryInstance.id])
        redirect(action: "show", id: servicecategoryInstance.id)
    }

    def show(Long id) {
        def servicecategoryInstance = Servicecategory.get(id)
        if (!servicecategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "list")
            return
        }

        [servicecategoryInstance: servicecategoryInstance]
    }

    def edit(Long id) {
        def servicecategoryInstance = Servicecategory.get(id)
        if (!servicecategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "list")
            return
        }

        [servicecategoryInstance: servicecategoryInstance]
    }

    def update(Long id, Long version) {
        def servicecategoryInstance = Servicecategory.get(id)
        if (!servicecategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicecategoryInstance.version > version) {
                servicecategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'servicecategory.label', default: 'Servicecategory')] as Object[],
                        "Another user has updated this Servicecategory while you were editing")
                render(view: "edit", model: [servicecategoryInstance: servicecategoryInstance])
                return
            }
        }

        servicecategoryInstance.properties = params

        if (!servicecategoryInstance.save(flush: true)) {
            render(view: "edit", model: [servicecategoryInstance: servicecategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), servicecategoryInstance.id])
        redirect(action: "show", id: servicecategoryInstance.id)
    }

    def delete(Long id) {
        def servicecategoryInstance = Servicecategory.get(id)
        if (!servicecategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "list")
            return
        }

        try {
            servicecategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servicecategory.label', default: 'Servicecategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
