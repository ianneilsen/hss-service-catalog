package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServiceuserController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [serviceuserInstanceList: Serviceuser.list(params), serviceuserInstanceTotal: Serviceuser.count()]
    }

    def create() {
        [serviceuserInstance: new Serviceuser(params)]
    }

    def save() {
        def serviceuserInstance = new Serviceuser(params)
        if (!serviceuserInstance.save(flush: true)) {
            render(view: "create", model: [serviceuserInstance: serviceuserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), serviceuserInstance.id])
        redirect(action: "show", id: serviceuserInstance.id)
    }

    def show(Long id) {
        def serviceuserInstance = Serviceuser.get(id)
        if (!serviceuserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "list")
            return
        }

        [serviceuserInstance: serviceuserInstance]
    }

    def edit(Long id) {
        def serviceuserInstance = Serviceuser.get(id)
        if (!serviceuserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "list")
            return
        }

        [serviceuserInstance: serviceuserInstance]
    }

    def update(Long id, Long version) {
        def serviceuserInstance = Serviceuser.get(id)
        if (!serviceuserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (serviceuserInstance.version > version) {
                serviceuserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'serviceuser.label', default: 'Serviceuser')] as Object[],
                        "Another user has updated this Serviceuser while you were editing")
                render(view: "edit", model: [serviceuserInstance: serviceuserInstance])
                return
            }
        }

        serviceuserInstance.properties = params

        if (!serviceuserInstance.save(flush: true)) {
            render(view: "edit", model: [serviceuserInstance: serviceuserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), serviceuserInstance.id])
        redirect(action: "show", id: serviceuserInstance.id)
    }

    def delete(Long id) {
        def serviceuserInstance = Serviceuser.get(id)
        if (!serviceuserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "list")
            return
        }

        try {
            serviceuserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'serviceuser.label', default: 'Serviceuser'), id])
            redirect(action: "show", id: id)
        }
    }
}
