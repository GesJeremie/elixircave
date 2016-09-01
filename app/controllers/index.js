export default Ember.Controller.extend({

  subscribeText: 'Subscribe',

  classified: Ember.computed('model', function () {
    return this.get('model').toArray().reverse()
  }),

  isFormValid: Ember.computed('email', 'firstname', 'lastname', function () {

    if (!this.get('email') || !this.get('firstname') || !this.get('lastname')) {
      return false;
    }

    if (!this.get('email').includes('@')) {
      return false;
    }

    return true;
  }),

  disabledButton: Ember.computed('isFormValid', function () {
    if (this.get('isFormValid')) {
      return null;
    }

    return true;
  }),

  actions: {
    toggleShow(post) {
      post.toggleProperty('visible');
    },

    subscribe() {

      this.set('subscribeText', 'Loading ...');

      let request = $.get('https://hooks.zapier.com/hooks/catch/1645102/6bhfip/', {
        data: {
          email: this.get('email'),
          firstname: this.get('firstname'),
          lastname: this.get('lastname')
        },
        xhrFields: { withCredentials: true }
      });

      request.done((response) => {
        this.set('subscribeText', 'Done!');
        this.setProperties({
          email: null,
          firstname: null,
          lastname: null
        });

        Ember.run.later(this, () => {
          this.set('subscribeText', 'Subscribe')
        }, 1000);
      });


    }
  }

});
