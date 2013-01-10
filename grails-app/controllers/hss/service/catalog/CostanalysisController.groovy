package hss.service.catalog

import org.springframework.dao.DataIntegrityViolationException

class CostanalysisController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [costanalysisInstanceList: Costanalysis.list(params), costanalysisInstanceTotal: Costanalysis.count()]
    }

    def create() {
        [costanalysisInstance: new Costanalysis(params)]
    }

    def save() {
        def costanalysisInstance = new Costanalysis(params)
        if (!costanalysisInstance.save(flush: true)) {
            render(view: "create", model: [costanalysisInstance: costanalysisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), costanalysisInstance.id])
        redirect(action: "show", id: costanalysisInstance.id)
    }

    def show(Long id) {
        def costanalysisInstance = Costanalysis.get(id)
        if (!costanalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "list")
            return
        }

        [costanalysisInstance: costanalysisInstance]
    }

    def edit(Long id) {
        def costanalysisInstance = Costanalysis.get(id)
        if (!costanalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "list")
            return
        }

        [costanalysisInstance: costanalysisInstance]
    }

    def update(Long id, Long version) {
        def costanalysisInstance = Costanalysis.get(id)
        if (!costanalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costanalysisInstance.version > version) {
                costanalysisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'costanalysis.label', default: 'Costanalysis')] as Object[],
                        "Another user has updated this Costanalysis while you were editing")
                render(view: "edit", model: [costanalysisInstance: costanalysisInstance])
                return
            }
        }

        costanalysisInstance.properties = params

        if (!costanalysisInstance.save(flush: true)) {
            render(view: "edit", model: [costanalysisInstance: costanalysisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), costanalysisInstance.id])
        redirect(action: "show", id: costanalysisInstance.id)
    }

    def delete(Long id) {
        def costanalysisInstance = Costanalysis.get(id)
        if (!costanalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "list")
            return
        }

        try {
            costanalysisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'costanalysis.label', default: 'Costanalysis'), id])
            redirect(action: "show", id: id)
        }
    }
}
