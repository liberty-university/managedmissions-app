// Generated by CoffeeScript 1.3.1
(function() {

  Ext.define('ManagedMissions.controller.Main', {
    extend: 'Ext.app.Controller',
    config: {
      routes: {
        '': 'index'
      }
    },
    index: function() {
      return this.redirectTo('mission_trips');
    }
  });

}).call(this);