Ext.define 'ManagedMissions.view.MissionTripTabPanel',
  extend: 'Ext.tab.Panel'
  id: 'missionTripTabPanel'
  requires: [
    'Ext.List'
    'Ext.Container'
  ]
  config:
    listeners:
      updatedata: (component, data, eOpts) ->
        @config.title = data.TripName
        meetings = data.UpcomingThings
          .filter (object) ->
            object.Type == 'Meeting'
          .map (object) ->
            object.Date = Ext.util.Format.date(Ext.Date.parse(object.Date, 'MS'), 'm/d/Y')
            object
        @getItems().getByKey('missionTripMeetingsContainer').setData(meetings)
        tasksGoals = _.flatten(data.UpcomingThings
          .filter (object) ->
            object.Type == 'TaskGroup' or object.Type == 'FinancialGoal'
          .map (object) ->
            object.Date = Ext.util.Format.date(Ext.Date.parse(object.Date, 'MS'), 'm/d/Y')
            if object.Type == 'TaskGroup'
              object.Tasks.map (task) ->
                task.Type = 'Task'
                task.Date = object.Date
                task
            else
              object
        )
        @getItems().getByKey('missionTripTasksGoalsContainer').setData(tasksGoals)
        @getItems().getByKey('missionTripBudgetsContainer').setData(data)
    tabBarPosition: 'bottom'
    items: [
      {
        id: 'missionTripMembersList'
        xtype: 'list'
        itemTpl: '<tpl for=".">{FirstName}</tpl>'
        disableSelection: true
        onItemDisclosure: true
        store: 'Members'
        title: 'Team'
        iconCls: 'team'
      }
      {
        id: 'missionTripMeetingsContainer'
        xtype: 'list'
        itemTpl: '<p>{Description}</p><p>{Date}</p>'
        title: 'Meetings'
        iconCls: 'time'
      }
      {
        id: 'missionTripTasksGoalsContainer'
        xtype: 'list'
        itemTpl: '<p><tpl if="Type == \'FinancialGoal\'">Goal: {Description}<tpl elseif="Type == \'Task\'">{Description}</tpl></p><p>{Date}</p>'
        title: 'Tasks & Goals'
        iconCls: 'compose'
      }
      {
        id: 'missionTripBudgetsContainer'
        xtype: 'container'
        tpl: '<p>Team Budget: ${TeamBudget}</p><p>Member Budget: ${MemberBudget}</p><p>Total Expenses: ${TotalExpenses}</p><p>Total Raised: ${TotalRaised}</p><p>Total Budget: ${TotalBudget}</p>'
        title: 'Budget'
        iconCls: 'cashier'
      }
    ]
