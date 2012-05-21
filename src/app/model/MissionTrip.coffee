Ext.define 'ManagedMissions.model.MissionTrip',
  extend: 'Ext.data.Model'
  config:
    idProperty: 'missionTripId'
    fields: [
      'MissionTripId'
      'ExpenseAccount'
      'IncomeAccount'
      'PurposeCode'
      'Destination'
      'Country'
      'UpcomingThings'
      'Documents'
      'Links'
      'TotalGoal'
      'AccessReason'
      'Country2LAbbreviation'
      { name: 'DepartureDate', type: 'date', dateFormat: 'MS' }
      { name: 'ReturnDate', type: 'date', dateFormat: 'MS' }
      'TeamBudget'
      'MemberBudget'
      'TotalExpenses'
      'TotalRaised'
      'TripName'
      'TotalBudget'
      'UrlSafeName'
      'BudgetString'
      'ExpensesString'
      'RaisedString'
    ]
  store: 'MissionTrips'
