package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServiceuserController)
@Mock(Serviceuser)
class ServiceuserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/serviceuser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.serviceuserInstanceList.size() == 0
        assert model.serviceuserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.serviceuserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.serviceuserInstance != null
        assert view == '/serviceuser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/serviceuser/show/1'
        assert controller.flash.message != null
        assert Serviceuser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceuser/list'

        populateValidParams(params)
        def serviceuser = new Serviceuser(params)

        assert serviceuser.save() != null

        params.id = serviceuser.id

        def model = controller.show()

        assert model.serviceuserInstance == serviceuser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceuser/list'

        populateValidParams(params)
        def serviceuser = new Serviceuser(params)

        assert serviceuser.save() != null

        params.id = serviceuser.id

        def model = controller.edit()

        assert model.serviceuserInstance == serviceuser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/serviceuser/list'

        response.reset()

        populateValidParams(params)
        def serviceuser = new Serviceuser(params)

        assert serviceuser.save() != null

        // test invalid parameters in update
        params.id = serviceuser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/serviceuser/edit"
        assert model.serviceuserInstance != null

        serviceuser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/serviceuser/show/$serviceuser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        serviceuser.clearErrors()

        populateValidParams(params)
        params.id = serviceuser.id
        params.version = -1
        controller.update()

        assert view == "/serviceuser/edit"
        assert model.serviceuserInstance != null
        assert model.serviceuserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/serviceuser/list'

        response.reset()

        populateValidParams(params)
        def serviceuser = new Serviceuser(params)

        assert serviceuser.save() != null
        assert Serviceuser.count() == 1

        params.id = serviceuser.id

        controller.delete()

        assert Serviceuser.count() == 0
        assert Serviceuser.get(serviceuser.id) == null
        assert response.redirectedUrl == '/serviceuser/list'
    }
}
