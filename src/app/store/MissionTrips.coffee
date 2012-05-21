Ext.define 'ManagedMissions.store.MissionTrips'
  extend: 'Ext.data.Store'
  requires: [
    'Ext.data.proxy.JsonP'
    'Ext.data.reader.Json'
  ]
  config:
    model: 'ManagedMissions.model.MissionTrip'
    proxy:
      type: 'jsonp'
      url: 'https://managedmissions-proxy.herokuapp.com/api/missiontrip'
      extraParams:
        details: true
      model: 'ManagedMissions.model.MissionTrip'
      reader:
        type: 'json'
        rootProperty: 'data'
