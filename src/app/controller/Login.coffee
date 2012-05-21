Ext.define 'ManagedMissions.controller.Login',
  extend: 'Ext.app.Controller',
  requires: [
    'Ext.data.JsonP'
    'Ext.MessageBox'
  ]
  config:
    routes:
      'login': 'new'
    refs:
      mainContainer: '#mainContainer'
      loginFormPanel: '#loginFormPanel'
      loginButton: '#loginButton'
    control:
      loginButton:
        tap: 'onLoginButtonTap'
  new: ->
    loginFormPanel = @getLoginFormPanel() || Ext.create('ManagedMissions.view.LoginFormPanel')
    Ext.Viewport.setActiveItem(loginFormPanel)
  onLoginButtonTap: (button, event, options) ->
    data = @getLoginFormPanel().getValues()
    Ext.data.JsonP.request
      url: 'https://managedmissions-proxy.herokuapp.com/api/auth/logon'
      params: data
      scope: this
      success: (data) ->
        if data.success
          @redirectTo('mission_trips')
        else
          # Login failure
          Ext.Msg.alert('Authentication Error', 'We were unable to log you in. Please check your email and password or try again in a few minutes.', Ext.emptyFn)
      failure: (errorType) ->
        # Request failure
        Ext.Msg.alert('Authentication Error', 'We were unable to log you in. Please check your network connection or try again in a few minutes.', Ext.emptyFn)
