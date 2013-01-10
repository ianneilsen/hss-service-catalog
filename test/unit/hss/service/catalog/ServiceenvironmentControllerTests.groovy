package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServiceenvironmentController)
@Mock(Serviceenvironment)
class ServiceenvironmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/serviceenvironment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.serviceenvironmentInstanceList.size() == 0
        assert model.serviceenvironmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.serviceenvironmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.serviceenvironmentInstance != null
        assert view == '/serviceenvironment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/serviceenvironment/show/1'
        assert controller.flash.message != null
        assert Serviceenvironment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceenvironment/list'

        populateValidParams(params)
        def serviceenvironment = new Serviceenvironment(params)

        assert serviceenvironment.save() != null

        params.id = serviceenvironment.id

        def model = controller.show()

        assert model.serviceenvironmentInstance == serviceenvironment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceenvironment/list'

        populateValidParams(params)
        def serviceenvironment = new Serviceenvironment(params)

        assert serviceenvironment.save() != null

        params.id = serviceenvironment.id

        def model = controller.edit()

        assert model.serviceenvironmentInstance == serviceenvironment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceenvironment/list'

        response.reset()

        populateValidParams(params)
        def serviceenvironment = new Serviceenvironment(params)

        assert serviceenvironment.save() != null

        // test invalid parameters in update
        params.id = serviceenvironment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/serviceenvironment/edit"
        assert model.serviceenvironmentInstance != null

        serviceenvironment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/serviceenvironment/show/$serviceenvironment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        serviceenvironment.clearErrors()

        populateValidParams(params)
        params.id = serviceenvironment.id
        params.version = -1
        controller.update()

        assert view == "/serviceenvironment/edit"
        assert model.serviceenvironmentInstance != null
        assert model.serviceenvironmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/serviceenvironment/list'

        response.reset()

        populateValidParams(params)
        def serviceenvironment = new Serviceenvironment(params)

        assert serviceenvironment.save() != null
        assert Serviceenvironment.count() == 1

        params.id = serviceenvironment.id

        controller.delete()

        assert Serviceenvironment.count() == 0
        assert Serviceenvironment.get(serviceenvironment.id) == null
        assert response.redirectedUrl == '/serviceenvironment/list'
    }
}
