package hss.communications.plan

import org.springframework.dao.DataIntegrityViolationException

class CommlevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [commlevelInstanceList: Commlevel.list(params), commlevelInstanceTotal: Commlevel.count()]
    }

    def create() {
        [commlevelInstance: new Commlevel(params)]
    }

    def save() {
        def commlevelInstance = new Commlevel(params)
        if (!commlevelInstance.save(flush: true)) {
            render(view: "create", model: [commlevelInstance: commlevelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), commlevelInstance.id])
        redirect(action: "show", id: commlevelInstance.id)
    }

    def show(Long id) {
        def commlevelInstance = Commlevel.get(id)
        if (!commlevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "list")
            return
        }

        [commlevelInstance: commlevelInstance]
    }

    def edit(Long id) {
        def commlevelInstance = Commlevel.get(id)
        if (!commlevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "list")
            return
        }

        [commlevelInstance: commlevelInstance]
    }

    def update(Long id, Long version) {
        def commlevelInstance = Commlevel.get(id)
        if (!commlevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (commlevelInstance.version > version) {
                commlevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'commlevel.label', default: 'Commlevel')] as Object[],
                        "Another user has updated this Commlevel while you were editing")
                render(view: "edit", model: [commlevelInstance: commlevelInstance])
                return
            }
        }

        commlevelInstance.properties = params

        if (!commlevelInstance.save(flush: true)) {
            render(view: "edit", model: [commlevelInstance: commlevelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), commlevelInstance.id])
        redirect(action: "show", id: commlevelInstance.id)
    }

    def delete(Long id) {
        def commlevelInstance = Commlevel.get(id)
        if (!commlevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "list")
            return
        }

        try {
            commlevelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'commlevel.label', default: 'Commlevel'), id])
            redirect(action: "show", id: id)
        }
    }
}
