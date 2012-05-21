Ext.define 'ManagedMissions.view.LoginFormPanel'
  extend: 'Ext.form.Panel'
  id: 'loginFormPanel'
  requires: [
    'Ext.form.FieldSet'
    'Ext.field.Email'
    'Ext.field.Password'
    'Ext.Button'
  ]
  config:
    fullscreen: true
    layout: 'vbox'
    items: [
      {
        xtype: 'fieldset'
        title: 'Login'
        items: [
          {
            xtype: 'emailfield'
            name: 'username'
            label: 'Email'
          }
          {
            xtype: 'passwordfield'
            name: 'password'
            label: 'Password'
          }
        ]
      }
      {
        xtype: 'button'
        id: 'loginButton'
        text: 'Login'
        ui: 'confirm'
      }
    ]
