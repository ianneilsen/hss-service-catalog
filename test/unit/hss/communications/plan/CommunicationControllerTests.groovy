package hss.communications.plan



import org.junit.*
import grails.test.mixin.*

@TestFor(CommunicationController)
@Mock(Communication)
class CommunicationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/communication/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.communicationInstanceList.size() == 0
        assert model.communicationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.communicationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.communicationInstance != null
        assert view == '/communication/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/communication/show/1'
        assert controller.flash.message != null
        assert Communication.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/communication/list'

        populateValidParams(params)
        def communication = new Communication(params)

        assert communication.save() != null

        params.id = communication.id

        def model = controller.show()

        assert model.communicationInstance == communication
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/communication/list'

        populateValidParams(params)
        def communication = new Communication(params)

        assert communication.save() != null

        params.id = communication.id

        def model = controller.edit()

        assert model.communicationInstance == communication
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/communication/list'

        response.reset()

        populateValidParams(params)
        def communication = new Communication(params)

        assert communication.save() != null

        // test invalid parameters in update
        params.id = communication.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/communication/edit"
        assert model.communicationInstance != null

        communication.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/communication/show/$communication.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        communication.clearErrors()

        populateValidParams(params)
        params.id = communication.id
        params.version = -1
        controller.update()

        assert view == "/communication/edit"
        assert model.communicationInstance != null
        assert model.communicationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/communication/list'

        response.reset()

        populateValidParams(params)
        def communication = new Communication(params)

        assert communication.save() != null
        assert Communication.count() == 1

        params.id = communication.id

        controller.delete()

        assert Communication.count() == 0
        assert Communication.get(communication.id) == null
        assert response.redirectedUrl == '/communication/list'
    }
}
