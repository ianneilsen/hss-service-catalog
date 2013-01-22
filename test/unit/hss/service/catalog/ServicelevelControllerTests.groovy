package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicelevelController)
@Mock(Servicelevel)
class ServicelevelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servicelevel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicelevelInstanceList.size() == 0
        assert model.servicelevelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicelevelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicelevelInstance != null
        assert view == '/servicelevel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servicelevel/show/1'
        assert controller.flash.message != null
        assert Servicelevel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servicelevel/list'

        populateValidParams(params)
        def servicelevel = new Servicelevel(params)

        assert servicelevel.save() != null

        params.id = servicelevel.id

        def model = controller.show()

        assert model.servicelevelInstance == servicelevel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servicelevel/list'

        populateValidParams(params)
        def servicelevel = new Servicelevel(params)

        assert servicelevel.save() != null

        params.id = servicelevel.id

        def model = controller.edit()

        assert model.servicelevelInstance == servicelevel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servicelevel/list'

        response.reset()

        populateValidParams(params)
        def servicelevel = new Servicelevel(params)

        assert servicelevel.save() != null

        // test invalid parameters in update
        params.id = servicelevel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servicelevel/edit"
        assert model.servicelevelInstance != null

        servicelevel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servicelevel/show/$servicelevel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servicelevel.clearErrors()

        populateValidParams(params)
        params.id = servicelevel.id
        params.version = -1
        controller.update()

        assert view == "/servicelevel/edit"
        assert model.servicelevelInstance != null
        assert model.servicelevelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servicelevel/list'

        response.reset()

        populateValidParams(params)
        def servicelevel = new Servicelevel(params)

        assert servicelevel.save() != null
        assert Servicelevel.count() == 1

        params.id = servicelevel.id

        controller.delete()

        assert Servicelevel.count() == 0
        assert Servicelevel.get(servicelevel.id) == null
        assert response.redirectedUrl == '/servicelevel/list'
    }
}
