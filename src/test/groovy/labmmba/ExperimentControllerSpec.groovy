package labmmba

import grails.test.mixin.*
import spock.lang.*

@TestFor(ExperimentController)
@Mock(Experiment)
class ExperimentControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.experimentList
            model.experimentCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.experiment!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def experiment = new Experiment()
            experiment.validate()
            controller.save(experiment)

        then:"The create view is rendered again with the correct model"
            model.experiment!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            experiment = new Experiment(params)

            controller.save(experiment)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/experiment/show/1'
            controller.flash.message != null
            Experiment.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def experiment = new Experiment(params)
            controller.show(experiment)

        then:"A model is populated containing the domain instance"
            model.experiment == experiment
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def experiment = new Experiment(params)
            controller.edit(experiment)

        then:"A model is populated containing the domain instance"
            model.experiment == experiment
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/experiment/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def experiment = new Experiment()
            experiment.validate()
            controller.update(experiment)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.experiment == experiment

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            experiment = new Experiment(params).save(flush: true)
            controller.update(experiment)

        then:"A redirect is issued to the show action"
            experiment != null
            response.redirectedUrl == "/experiment/show/$experiment.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/experiment/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def experiment = new Experiment(params).save(flush: true)

        then:"It exists"
            Experiment.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(experiment)

        then:"The instance is deleted"
            Experiment.count() == 0
            response.redirectedUrl == '/experiment/index'
            flash.message != null
    }
}
