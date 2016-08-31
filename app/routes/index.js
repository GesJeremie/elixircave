import Ember from 'ember';

export default Ember.Route.extend({

  model() {

    return new Ember.RSVP.Promise(function (resolve, reject) {

      let resolveSheet = (function (sheets, tabletop) {
        return Ember.run(function () {
          return Ember.run.schedule('actions', this, function () {
            console.log('received data', sheets);
            return resolve(sheets);
          });
        });
      });

      Tabletop.init({
        key: '1REVgBoYYw0_k5d706_MNzi5zX4PPMyH53-jjOICgWww',
        simpleSheet: true,
        callback: resolveSheet,
        debug: true
      });

    });
  }

});
