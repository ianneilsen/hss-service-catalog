package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(CostanalysisController)
@Mock(Costanalysis)
class CostanalysisControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/costanalysis/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.costanalysisInstanceList.size() == 0
        assert model.costanalysisInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.costanalysisInstance != null
    }

    void testSave() {
        controller.save()

        assert model.costanalysisInstance != null
        assert view == '/costanalysis/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/costanalysis/show/1'
        assert controller.flash.message != null
        assert Costanalysis.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/costanalysis/list'

        populateValidParams(params)
        def costanalysis = new Costanalysis(params)

        assert costanalysis.save() != null

        params.id = costanalysis.id

        def model = controller.show()

        assert model.costanalysisInstance == costanalysis
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/costanalysis/list'

        populateValidParams(params)
        def costanalysis = new Costanalysis(params)

        assert costanalysis.save() != null

        params.id = costanalysis.id

        def model = controller.edit()

        assert model.costanalysisInstance == costanalysis
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/costanalysis/list'

        response.reset()

        populateValidParams(params)
        def costanalysis = new Costanalysis(params)

        assert costanalysis.save() != null

        // test invalid parameters in update
        params.id = costanalysis.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/costanalysis/edit"
        assert model.costanalysisInstance != null

        costanalysis.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/costanalysis/show/$costanalysis.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        costanalysis.clearErrors()

        populateValidParams(params)
        params.id = costanalysis.id
        params.version = -1
        controller.update()

        assert view == "/costanalysis/edit"
        assert model.costanalysisInstance != null
        assert model.costanalysisInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/costanalysis/list'

        response.reset()

        populateValidParams(params)
        def costanalysis = new Costanalysis(params)

        assert costanalysis.save() != null
        assert Costanalysis.count() == 1

        params.id = costanalysis.id

        controller.delete()

        assert Costanalysis.count() == 0
        assert Costanalysis.get(costanalysis.id) == null
        assert response.redirectedUrl == '/costanalysis/list'
    }
}
