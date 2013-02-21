package hss.communications.plan



import org.junit.*
import grails.test.mixin.*

@TestFor(CommunicationplanController)
@Mock(Communicationplan)
class CommunicationplanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/communicationplan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.communicationplanInstanceList.size() == 0
        assert model.communicationplanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.communicationplanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.communicationplanInstance != null
        assert view == '/communicationplan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/communicationplan/show/1'
        assert controller.flash.message != null
        assert Communicationplan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationplan/list'

        populateValidParams(params)
        def communicationplan = new Communicationplan(params)

        assert communicationplan.save() != null

        params.id = communicationplan.id

        def model = controller.show()

        assert model.communicationplanInstance == communicationplan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationplan/list'

        populateValidParams(params)
        def communicationplan = new Communicationplan(params)

        assert communicationplan.save() != null

        params.id = communicationplan.id

        def model = controller.edit()

        assert model.communicationplanInstance == communicationplan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationplan/list'

        response.reset()

        populateValidParams(params)
        def communicationplan = new Communicationplan(params)

        assert communicationplan.save() != null

        // test invalid parameters in update
        params.id = communicationplan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/communicationplan/edit"
        assert model.communicationplanInstance != null

        communicationplan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/communicationplan/show/$communicationplan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        communicationplan.clearErrors()

        populateValidParams(params)
        params.id = communicationplan.id
        params.version = -1
        controller.update()

        assert view == "/communicationplan/edit"
        assert model.communicationplanInstance != null
        assert model.communicationplanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/communicationplan/list'

        response.reset()

        populateValidParams(params)
        def communicationplan = new Communicationplan(params)

        assert communicationplan.save() != null
        assert Communicationplan.count() == 1

        params.id = communicationplan.id

        controller.delete()

        assert Communicationplan.count() == 0
        assert Communicationplan.get(communicationplan.id) == null
        assert response.redirectedUrl == '/communicationplan/list'
    }
}
