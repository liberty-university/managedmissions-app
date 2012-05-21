Ext.define 'ManagedMissions.store.Members'
  extend: 'Ext.data.Store'
  requires: [
    'Ext.data.proxy.JsonP'
    'Ext.data.reader.Json'
  ]
  config:
    model: 'ManagedMissions.model.Member'
    proxy:
      type: 'jsonp'
      url: 'https://managedmissions-proxy.herokuapp.com/api/person'
      extraParams:
        details: true
      model: 'ManagedMissions.model.Member'
      reader:
        type: 'json'
        rootProperty: 'data'
