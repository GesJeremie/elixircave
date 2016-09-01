import Ember from 'ember';

export default Ember.Route.extend({

  model() {
    //return this.store.findAll('post');
    return [{ title: "Phoenix dev", company: "Github", content: "Random Text", location: "Bordeaux - France" }];
  }

});
