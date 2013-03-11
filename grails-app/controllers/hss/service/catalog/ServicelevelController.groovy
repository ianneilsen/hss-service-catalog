package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class ServicelevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [servicelevelInstanceList: Servicelevel.list(params), servicelevelInstanceTotal: Servicelevel.count()]
    }

    def create() {
        [servicelevelInstance: new Servicelevel(params)]
    }

    def save() {
        def servicelevelInstance = new Servicelevel(params)
        if (!servicelevelInstance.save(flush: true)) {
            render(view: "create", model: [servicelevelInstance: servicelevelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), servicelevelInstance.id])
        redirect(action: "show", id: servicelevelInstance.id)
    }

    def show(Long id) {
        def servicelevelInstance = Servicelevel.get(id)
        if (!servicelevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "list")
            return
        }

        [servicelevelInstance: servicelevelInstance]
    }

    def edit(Long id) {
        def servicelevelInstance = Servicelevel.get(id)
        if (!servicelevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "list")
            return
        }

        [servicelevelInstance: servicelevelInstance]
    }

    def update(Long id, Long version) {
        def servicelevelInstance = Servicelevel.get(id)
        if (!servicelevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (servicelevelInstance.version > version) {
                servicelevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'servicelevel.label', default: 'Servicelevel')] as Object[],
                        "Another user has updated this Servicelevel while you were editing")
                render(view: "edit", model: [servicelevelInstance: servicelevelInstance])
                return
            }
        }

        servicelevelInstance.properties = params

        if (!servicelevelInstance.save(flush: true)) {
            render(view: "edit", model: [servicelevelInstance: servicelevelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), servicelevelInstance.id])
        /*redirect(action: "show", id: servicelevelInstance.id)*/
        redirect(controller: "teamservice", action: "show", id: params.id)
    }

    def delete(Long id) {
        def servicelevelInstance = Servicelevel.get(id)
        if (!servicelevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "list")
            return
        }

        try {
            servicelevelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servicelevel.label', default: 'Servicelevel'), id])
            redirect(action: "show", id: id)
        }
    }
}
