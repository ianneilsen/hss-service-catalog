package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(TeamserviceController)
@Mock(Teamservice)
class TeamserviceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/teamservice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.teamserviceInstanceList.size() == 0
        assert model.teamserviceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.teamserviceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.teamserviceInstance != null
        assert view == '/teamservice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/teamservice/show/1'
        assert controller.flash.message != null
        assert Teamservice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/teamservice/list'

        populateValidParams(params)
        def teamservice = new Teamservice(params)

        assert teamservice.save() != null

        params.id = teamservice.id

        def model = controller.show()

        assert model.teamserviceInstance == teamservice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/teamservice/list'

        populateValidParams(params)
        def teamservice = new Teamservice(params)

        assert teamservice.save() != null

        params.id = teamservice.id

        def model = controller.edit()

        assert model.teamserviceInstance == teamservice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/teamservice/list'

        response.reset()

        populateValidParams(params)
        def teamservice = new Teamservice(params)

        assert teamservice.save() != null

        // test invalid parameters in update
        params.id = teamservice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/teamservice/edit"
        assert model.teamserviceInstance != null

        teamservice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/teamservice/show/$teamservice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        teamservice.clearErrors()

        populateValidParams(params)
        params.id = teamservice.id
        params.version = -1
        controller.update()

        assert view == "/teamservice/edit"
        assert model.teamserviceInstance != null
        assert model.teamserviceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/teamservice/list'

        response.reset()

        populateValidParams(params)
        def teamservice = new Teamservice(params)

        assert teamservice.save() != null
        assert Teamservice.count() == 1

        params.id = teamservice.id

        controller.delete()

        assert Teamservice.count() == 0
        assert Teamservice.get(teamservice.id) == null
        assert response.redirectedUrl == '/teamservice/list'
    }
}
