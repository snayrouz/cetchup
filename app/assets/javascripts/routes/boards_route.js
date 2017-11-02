Cetchup.BoardsRoute = Ember.Route.extend({
    2
  model: function() {
      3
    return this.store.findAll('board');
      4
    }
    5
  }
);
