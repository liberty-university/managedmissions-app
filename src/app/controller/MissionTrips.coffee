Ext.define 'ManagedMissions.controller.MissionTrips',
  extend: 'Ext.app.Controller',
  config:
    routes:
      'mission_trips': 'index'
    refs:
      missionTripsNavigationView: '#missionTripsNavigationView'
      missionTripsList: '#missionTripsList'
      missionTripTabPanel: '#missionTripTabPanel'
      missionTripDetailsDataView: '#missionTripDetailsDataView'
      missionTripMembersDataView: '#missionTripMembersDataView'
      missionTripMeetingsDataView: '#missionTripMeetingsDataView'
      missionTripTasksGoalsDataView: '#missionTripTasksGoalsDataView'
      missionTripBudgetsDataView: '#missionTripBudgetsDataView'
    control:
      missionTripsList:
        disclose: 'onMissionTripsListDisclose'
  init: ->
    store = Ext.getStore('MissionTrips')
    store.on('load', @onMissionTripsLoad, this)
  index: ->
    store = Ext.getStore('MissionTrips')
    store.load() unless store.isLoaded()
    missionTripsNavigationView = @getMissionTripsNavigationView() || Ext.create('ManagedMissions.view.MissionTripsNavigationView')
    Ext.Viewport.setActiveItem(missionTripsNavigationView)
  onMissionTripsLoad: (store, results, success) ->
    unless success
      store = Ext.getStore('MissionTrips')
      store.loaded = false
      @redirectTo('login')
  onMissionTripsListDisclose: (list, record, target, index, e, eOpts) ->
    missionTripsNavigationView = @getMissionTripsNavigationView() || Ext.create('ManagedMissions.view.MissionTripsNavigationView')
    Ext.Viewport.setActiveItem(missionTripsNavigationView)

    missionTripTabPanel = @getMissionTripTabPanel() || Ext.create('ManagedMissions.view.MissionTripTabPanel')
    missionTripTabPanel.setRecord(record)

    # This should be in ManagedMissions.controller.Members#onMissionTripTabPanelUpdateData, but the events aren't firing properly.
    store = Ext.getStore('Members')
    proxy = store.getProxy()
    unless proxy.config.extraParams.missionTripId == record.data.MissionTripId
      proxy.config.extraParams.missionTripId = record.data.MissionTripId
      store.clearData()
      store.load()

    missionTripsNavigationView.push(missionTripTabPanel)
