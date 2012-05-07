// Generated by CoffeeScript 1.3.1
(function() {

  Ext.define('ManagedMissions.view.MissionTripTabPanel', {
    extend: 'Ext.tab.Panel',
    id: 'missionTripTabPanel',
    requires: ['Ext.List', 'Ext.Container'],
    config: {
      listeners: {
        updatedata: function(component, data, eOpts) {
          var meetings, tasksGoals;
          this.config.title = data.TripName;
          meetings = data.UpcomingThings.filter(function(object) {
            return object.Type === 'Meeting';
          }).map(function(object) {
            object.Date = Ext.util.Format.date(Ext.Date.parse(object.Date, 'MS'), 'm/d/Y');
            return object;
          });
          this.getItems().getByKey('missionTripMeetingsContainer').setData(meetings);
          tasksGoals = _.flatten(data.UpcomingThings.filter(function(object) {
            return object.Type === 'TaskGroup' || object.Type === 'FinancialGoal';
          }).map(function(object) {
            object.Date = Ext.util.Format.date(Ext.Date.parse(object.Date, 'MS'), 'm/d/Y');
            if (object.Type === 'TaskGroup') {
              return object.Tasks.map(function(task) {
                task.Type = 'Task';
                task.Date = object.Date;
                return task;
              });
            } else {
              return object;
            }
          }));
          this.getItems().getByKey('missionTripTasksGoalsContainer').setData(tasksGoals);
          return this.getItems().getByKey('missionTripBudgetsContainer').setData(data);
        }
      },
      tabBarPosition: 'bottom',
      items: [
        {
          id: 'missionTripMembersList',
          xtype: 'list',
          itemTpl: '<tpl for=".">{FirstName}</tpl>',
          disableSelection: true,
          onItemDisclosure: true,
          store: 'Members',
          title: 'Team',
          iconCls: 'team'
        }, {
          id: 'missionTripMeetingsContainer',
          xtype: 'list',
          itemTpl: '{Date}<br />{Description}',
          title: 'Meetings',
          iconCls: 'time'
        }, {
          id: 'missionTripTasksGoalsContainer',
          xtype: 'list',
          itemTpl: '{Date}<br /><tpl if="Type == \'FinancialGoal\'">Goal: {Description}<tpl elseif="Type == \'Task\'">{Description}</tpl>',
          title: 'Tasks & Goals',
          iconCls: 'compose'
        }, {
          id: 'missionTripBudgetsContainer',
          xtype: 'container',
          tpl: '<p>Total Goal: ${TotalGoal}</p><p>Team Budget: ${TeamBudget}</p><p>Member Budget: ${MemberBudget}</p><p>Total Budget: ${TotalBudget}</p><p>Total Expenses: ${TotalExpenses}</p><p>TotalRaised: ${TotalRaised}</p><p>Total Budget: ${TotalBudget}</p>',
          title: 'Budget',
          iconCls: 'cashier'
        }
      ]
    }
  });

}).call(this);
