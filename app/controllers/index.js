export default Ember.Controller.extend({

  classified: Ember.computed('model', function () {
    return this.get('model').toArray().reverse()
  })

});
