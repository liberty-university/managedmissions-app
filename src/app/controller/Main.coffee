Ext.define 'ManagedMissions.controller.Main',
  extend: 'Ext.app.Controller',
  config:
    routes:
      '': 'index'
  index: ->
    @redirectTo('mission_trips')
