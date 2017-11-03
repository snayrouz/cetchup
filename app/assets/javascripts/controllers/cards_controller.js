Cetchup.CardsController = Ember.ArrayController.extend({
  needs: ['list'],
  actions: {
    addCard: function() {
      var cards = this.get('model'),
        list = cards.owner,
        cardTitle = this.get('cardTitle'),
        cardAttrs = { this: cardTitle, list: list },
        card = this.store.createRecord('card', cardAttrs);

      // clear the input
      this.set('cardTitle', '');

      // persist
      card.save().then(function() {
        // save
      }, function() {
        // delete
        card.deleteRecord();
      });
    }
  },

  resortCards: function(cardParams, cardArray, listId) {
    var controller = this;
    var sortCardsURL = '/api/cards/sort';
    this.listId = listId;
    this.beginPropertyChanges();
    cardArray.forEach($.proxy(function(card, idx) {
      var store = this.store;
      var listId = this.listId;
      var cardId = card.replace('card_', '');

      store.update('card', { id: cardId,
                             list: listId,
                             position: idx + 1 });
    }, this));
    this.endPropertyChanges();

    var list = this.get('model.owner');
    list.save();
    }
  }
);
