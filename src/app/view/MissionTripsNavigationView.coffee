Ext.define 'ManagedMissions.view.MissionTripsNavigationView',
  extend: 'Ext.navigation.View'
  id: 'missionTripsNavigationView'

  requires: [
    'ManagedMissions.view.MissionTripsList'
  ]

  config:
    items: [
      { xclass: 'ManagedMissions.view.MissionTripsList' }
    ]
