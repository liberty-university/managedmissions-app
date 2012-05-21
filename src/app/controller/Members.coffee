Ext.define 'ManagedMissions.controller.Members',
  extend: 'Ext.app.Controller',
  config:
    refs:
      missionTripsNavigationView: '#missionTripsNavigationView'
      missionTripTabPanel: '#missionTripTabPanel'
      missionTripMembersList: '#missionTripMembersList'
      missionTripMemberDetailsContainer: '#missionTripMemberDetailsContainer'
    control:
      missionTripTabPanel:
        updatedata: 'onMissionTripTabPanelUpdateData'
      missionTripMembersList:
        disclose: 'onMissionTripMembersListDisclose'
  onMissionTripTabPanelUpdateData: (component, data, eOpts) ->
    # This only seems to get called once.
  onMissionTripMembersListDisclose: (list, record, target, index, e, eOpts) ->
    missionTripsNavigationView = @getMissionTripsNavigationView()

    missionTripMemberDetailsContainer = @getMissionTripMemberDetailsContainer() || Ext.create('ManagedMissions.view.MissionTripMemberDetailsContainer')
    missionTripMemberDetailsContainer.setRecord(record)
    missionTripsNavigationView.push(missionTripMemberDetailsContainer)
