package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicecategoryController)
@Mock(Servicecategory)
class ServicecategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servicecategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicecategoryInstanceList.size() == 0
        assert model.servicecategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicecategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicecategoryInstance != null
        assert view == '/servicecategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servicecategory/show/1'
        assert controller.flash.message != null
        assert Servicecategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecategory/list'

        populateValidParams(params)
        def servicecategory = new Servicecategory(params)

        assert servicecategory.save() != null

        params.id = servicecategory.id

        def model = controller.show()

        assert model.servicecategoryInstance == servicecategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecategory/list'

        populateValidParams(params)
        def servicecategory = new Servicecategory(params)

        assert servicecategory.save() != null

        params.id = servicecategory.id

        def model = controller.edit()

        assert model.servicecategoryInstance == servicecategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servicecategory/list'

        response.reset()

        populateValidParams(params)
        def servicecategory = new Servicecategory(params)

        assert servicecategory.save() != null

        // test invalid parameters in update
        params.id = servicecategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servicecategory/edit"
        assert model.servicecategoryInstance != null

        servicecategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servicecategory/show/$servicecategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servicecategory.clearErrors()

        populateValidParams(params)
        params.id = servicecategory.id
        params.version = -1
        controller.update()

        assert view == "/servicecategory/edit"
        assert model.servicecategoryInstance != null
        assert model.servicecategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servicecategory/list'

        response.reset()

        populateValidParams(params)
        def servicecategory = new Servicecategory(params)

        assert servicecategory.save() != null
        assert Servicecategory.count() == 1

        params.id = servicecategory.id

        controller.delete()

        assert Servicecategory.count() == 0
        assert Servicecategory.get(servicecategory.id) == null
        assert response.redirectedUrl == '/servicecategory/list'
    }
}
