Ext.define 'ManagedMissions.view.MissionTripsList',
  extend: 'Ext.List'
  id: 'missionTripsList'
  config:
    title: 'Mission Trips'
    store: 'MissionTrips'
    disableSelection: true
    onItemDisclosure: true
    emptyText: 'You don\'t have any trips, yet.',
    itemTpl: '{TripName}',
