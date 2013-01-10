package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicecompetitorController)
@Mock(Servicecompetitor)
class ServicecompetitorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servicecompetitor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicecompetitorInstanceList.size() == 0
        assert model.servicecompetitorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicecompetitorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicecompetitorInstance != null
        assert view == '/servicecompetitor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servicecompetitor/show/1'
        assert controller.flash.message != null
        assert Servicecompetitor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecompetitor/list'

        populateValidParams(params)
        def servicecompetitor = new Servicecompetitor(params)

        assert servicecompetitor.save() != null

        params.id = servicecompetitor.id

        def model = controller.show()

        assert model.servicecompetitorInstance == servicecompetitor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecompetitor/list'

        populateValidParams(params)
        def servicecompetitor = new Servicecompetitor(params)

        assert servicecompetitor.save() != null

        params.id = servicecompetitor.id

        def model = controller.edit()

        assert model.servicecompetitorInstance == servicecompetitor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecompetitor/list'

        response.reset()

        populateValidParams(params)
        def servicecompetitor = new Servicecompetitor(params)

        assert servicecompetitor.save() != null

        // test invalid parameters in update
        params.id = servicecompetitor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servicecompetitor/edit"
        assert model.servicecompetitorInstance != null

        servicecompetitor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servicecompetitor/show/$servicecompetitor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servicecompetitor.clearErrors()

        populateValidParams(params)
        params.id = servicecompetitor.id
        params.version = -1
        controller.update()

        assert view == "/servicecompetitor/edit"
        assert model.servicecompetitorInstance != null
        assert model.servicecompetitorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servicecompetitor/list'

        response.reset()

        populateValidParams(params)
        def servicecompetitor = new Servicecompetitor(params)

        assert servicecompetitor.save() != null
        assert Servicecompetitor.count() == 1

        params.id = servicecompetitor.id

        controller.delete()

        assert Servicecompetitor.count() == 0
        assert Servicecompetitor.get(servicecompetitor.id) == null
        assert response.redirectedUrl == '/servicecompetitor/list'
    }
}
