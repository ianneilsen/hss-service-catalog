package hss.service.catalog



import org.junit.*
import grails.test.mixin.*

@TestFor(ServicebenefitController)
@Mock(Servicebenefit)
class ServicebenefitControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/servicebenefit/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.servicebenefitInstanceList.size() == 0
        assert model.servicebenefitInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.servicebenefitInstance != null
    }

    void testSave() {
        controller.save()

        assert model.servicebenefitInstance != null
        assert view == '/servicebenefit/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/servicebenefit/show/1'
        assert controller.flash.message != null
        assert Servicebenefit.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/servicebenefit/list'

        populateValidParams(params)
        def servicebenefit = new Servicebenefit(params)

        assert servicebenefit.save() != null

        params.id = servicebenefit.id

        def model = controller.show()

        assert model.servicebenefitInstance == servicebenefit
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/servicebenefit/list'

        populateValidParams(params)
        def servicebenefit = new Servicebenefit(params)

        assert servicebenefit.save() != null

        params.id = servicebenefit.id

        def model = controller.edit()

        assert model.servicebenefitInstance == servicebenefit
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/servicebenefit/list'

        response.reset()

        populateValidParams(params)
        def servicebenefit = new Servicebenefit(params)

        assert servicebenefit.save() != null

        // test invalid parameters in update
        params.id = servicebenefit.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/servicebenefit/edit"
        assert model.servicebenefitInstance != null

        servicebenefit.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/servicebenefit/show/$servicebenefit.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        servicebenefit.clearErrors()

        populateValidParams(params)
        params.id = servicebenefit.id
        params.version = -1
        controller.update()

        assert view == "/servicebenefit/edit"
        assert model.servicebenefitInstance != null
        assert model.servicebenefitInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/servicebenefit/list'

        response.reset()

        populateValidParams(params)
        def servicebenefit = new Servicebenefit(params)

        assert servicebenefit.save() != null
        assert Servicebenefit.count() == 1

        params.id = servicebenefit.id

        controller.delete()

        assert Servicebenefit.count() == 0
        assert Servicebenefit.get(servicebenefit.id) == null
        assert response.redirectedUrl == '/servicebenefit/list'
    }
}
