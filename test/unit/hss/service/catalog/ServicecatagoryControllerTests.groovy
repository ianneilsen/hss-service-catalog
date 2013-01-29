package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicecatagoryController)
@Mock(Servicecatagory)
class ServicecatagoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servicecatagory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicecatagoryInstanceList.size() == 0
        assert model.servicecatagoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicecatagoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicecatagoryInstance != null
        assert view == '/servicecatagory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servicecatagory/show/1'
        assert controller.flash.message != null
        assert Servicecatagory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecatagory/list'

        populateValidParams(params)
        def servicecatagory = new Servicecatagory(params)

        assert servicecatagory.save() != null

        params.id = servicecatagory.id

        def model = controller.show()

        assert model.servicecatagoryInstance == servicecatagory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecatagory/list'

        populateValidParams(params)
        def servicecatagory = new Servicecatagory(params)

        assert servicecatagory.save() != null

        params.id = servicecatagory.id

        def model = controller.edit()

        assert model.servicecatagoryInstance == servicecatagory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecatagory/list'

        response.reset()

        populateValidParams(params)
        def servicecatagory = new Servicecatagory(params)

        assert servicecatagory.save() != null

        // test invalid parameters in update
        params.id = servicecatagory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servicecatagory/edit"
        assert model.servicecatagoryInstance != null

        servicecatagory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servicecatagory/show/$servicecatagory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servicecatagory.clearErrors()

        populateValidParams(params)
        params.id = servicecatagory.id
        params.version = -1
        controller.update()

        assert view == "/servicecatagory/edit"
        assert model.servicecatagoryInstance != null
        assert model.servicecatagoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servicecatagory/list'

        response.reset()

        populateValidParams(params)
        def servicecatagory = new Servicecatagory(params)

        assert servicecatagory.save() != null
        assert Servicecatagory.count() == 1

        params.id = servicecatagory.id

        controller.delete()

        assert Servicecatagory.count() == 0
        assert Servicecatagory.get(servicecatagory.id) == null
        assert response.redirectedUrl == '/servicecatagory/list'
    }
}
