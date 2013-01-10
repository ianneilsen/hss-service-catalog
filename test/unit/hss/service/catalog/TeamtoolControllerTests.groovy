package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(TeamtoolController)
@Mock(Teamtool)
class TeamtoolControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/teamtool/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.teamtoolInstanceList.size() == 0
        assert model.teamtoolInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.teamtoolInstance != null
    }

    void testSave() {
        controller.save()

        assert model.teamtoolInstance != null
        assert view == '/teamtool/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/teamtool/show/1'
        assert controller.flash.message != null
        assert Teamtool.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/teamtool/list'

        populateValidParams(params)
        def teamtool = new Teamtool(params)

        assert teamtool.save() != null

        params.id = teamtool.id

        def model = controller.show()

        assert model.teamtoolInstance == teamtool
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/teamtool/list'

        populateValidParams(params)
        def teamtool = new Teamtool(params)

        assert teamtool.save() != null

        params.id = teamtool.id

        def model = controller.edit()

        assert model.teamtoolInstance == teamtool
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/teamtool/list'

        response.reset()

        populateValidParams(params)
        def teamtool = new Teamtool(params)

        assert teamtool.save() != null

        // test invalid parameters in update
        params.id = teamtool.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/teamtool/edit"
        assert model.teamtoolInstance != null

        teamtool.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/teamtool/show/$teamtool.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        teamtool.clearErrors()

        populateValidParams(params)
        params.id = teamtool.id
        params.version = -1
        controller.update()

        assert view == "/teamtool/edit"
        assert model.teamtoolInstance != null
        assert model.teamtoolInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/teamtool/list'

        response.reset()

        populateValidParams(params)
        def teamtool = new Teamtool(params)

        assert teamtool.save() != null
        assert Teamtool.count() == 1

        params.id = teamtool.id

        controller.delete()

        assert Teamtool.count() == 0
        assert Teamtool.get(teamtool.id) == null
        assert response.redirectedUrl == '/teamtool/list'
    }
}
