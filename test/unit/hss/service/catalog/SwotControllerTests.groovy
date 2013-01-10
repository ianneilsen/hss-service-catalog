package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(SwotController)
@Mock(Swot)
class SwotControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/swot/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.swotInstanceList.size() == 0
        assert model.swotInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.swotInstance != null
    }

    void testSave() {
        controller.save()

        assert model.swotInstance != null
        assert view == '/swot/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/swot/show/1'
        assert controller.flash.message != null
        assert Swot.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/swot/list'

        populateValidParams(params)
        def swot = new Swot(params)

        assert swot.save() != null

        params.id = swot.id

        def model = controller.show()

        assert model.swotInstance == swot
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/swot/list'

        populateValidParams(params)
        def swot = new Swot(params)

        assert swot.save() != null

        params.id = swot.id

        def model = controller.edit()

        assert model.swotInstance == swot
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/swot/list'

        response.reset()

        populateValidParams(params)
        def swot = new Swot(params)

        assert swot.save() != null

        // test invalid parameters in update
        params.id = swot.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/swot/edit"
        assert model.swotInstance != null

        swot.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/swot/show/$swot.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        swot.clearErrors()

        populateValidParams(params)
        params.id = swot.id
        params.version = -1
        controller.update()

        assert view == "/swot/edit"
        assert model.swotInstance != null
        assert model.swotInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/swot/list'

        response.reset()

        populateValidParams(params)
        def swot = new Swot(params)

        assert swot.save() != null
        assert Swot.count() == 1

        params.id = swot.id

        controller.delete()

        assert Swot.count() == 0
        assert Swot.get(swot.id) == null
        assert response.redirectedUrl == '/swot/list'
    }
}
