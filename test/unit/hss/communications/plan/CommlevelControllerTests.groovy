package hss.communications.plan



import org.junit.*
import grails.test.mixin.*

@TestFor(CommlevelController)
@Mock(Commlevel)
class CommlevelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/commlevel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.commlevelInstanceList.size() == 0
        assert model.commlevelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.commlevelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.commlevelInstance != null
        assert view == '/commlevel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/commlevel/show/1'
        assert controller.flash.message != null
        assert Commlevel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/commlevel/list'

        populateValidParams(params)
        def commlevel = new Commlevel(params)

        assert commlevel.save() != null

        params.id = commlevel.id

        def model = controller.show()

        assert model.commlevelInstance == commlevel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/commlevel/list'

        populateValidParams(params)
        def commlevel = new Commlevel(params)

        assert commlevel.save() != null

        params.id = commlevel.id

        def model = controller.edit()

        assert model.commlevelInstance == commlevel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/commlevel/list'

        response.reset()

        populateValidParams(params)
        def commlevel = new Commlevel(params)

        assert commlevel.save() != null

        // test invalid parameters in update
        params.id = commlevel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/commlevel/edit"
        assert model.commlevelInstance != null

        commlevel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/commlevel/show/$commlevel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        commlevel.clearErrors()

        populateValidParams(params)
        params.id = commlevel.id
        params.version = -1
        controller.update()

        assert view == "/commlevel/edit"
        assert model.commlevelInstance != null
        assert model.commlevelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/commlevel/list'

        response.reset()

        populateValidParams(params)
        def commlevel = new Commlevel(params)

        assert commlevel.save() != null
        assert Commlevel.count() == 1

        params.id = commlevel.id

        controller.delete()

        assert Commlevel.count() == 0
        assert Commlevel.get(commlevel.id) == null
        assert response.redirectedUrl == '/commlevel/list'
    }
}
