import Ember from 'ember';

export default Ember.Route.extend({

    keen: Ember.inject.service(),

    model() {
        return this.get('keen').count('click-apply', 'this_7_days');
    }

});