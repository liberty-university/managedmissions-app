// Generated by CoffeeScript 1.3.1
(function() {

  Ext.define('ManagedMissions.view.MissionTripsList', {
    extend: 'Ext.List',
    id: 'missionTripsList',
    config: {
      title: 'Mission Trips',
      store: 'MissionTrips',
      disableSelection: true,
      onItemDisclosure: true,
      emptyText: 'You don\'t have any trips, yet.',
      itemTpl: '{TripName}'
    }
  });

}).call(this);
