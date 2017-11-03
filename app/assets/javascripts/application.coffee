#= require jquery
#= require jquery_ujs
#= require ./environment
#= require ember
#= require ember-data
#= require active-model-adapter
#= require_self
#= require ./cetchup

# for more details see: http://emberjs.com/guides/application/
window.Cetchup = Ember.Application.create({
  rootElement: "#ember-app"
 }
);
