Ext.define 'ManagedMissions.view.MissionTripMemberDetailsContainer',
  extend: 'Ext.Container'
  id: 'missionTripMemberDetailsContainer'
  config:
    listeners:
      updatedata: (component, data, eOpts) ->
        @config.title = "#{data.FirstName} #{data.LastName}"
    tpl: '<p>Email: <tpl if="EmailAddress"><a href="mailto:{EmailAddress}">{EmailAddress}</a></tpl></p><p>Phone Number: <tpl if="PhoneNumber"><a href="tel://{[values.PhoneNumber.replace(/[^\\d]/g, \'\')]}">{PhoneNumber}</a></tpl></p>'
