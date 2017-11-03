Cetchup.CardView = Ember.View.extend({
  templateName: 'card',
  classNames: ['card'],
  attributeBindings: ['data-position'],
  'data-position': function() {
    var card = this.get('controller').get('model');

    return 'card_' + card.id;
  }.property()
});
