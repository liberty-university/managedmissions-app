// Generated by CoffeeScript 1.3.1
(function() {

  Ext.define('ManagedMissions.model.Member', {
    extend: 'Ext.data.Model',
    config: {
      idProperty: 'personId',
      fields: ['Id', 'FirstName', 'MiddleName', 'LastName', 'Address1', 'Address2', 'City', 'State', 'PostalCode', 'PhoneNumber', 'EmailAddress', 'BirthDate', 'TShirtSize', 'PassportName', 'PassportNumber', 'PassportIssuedDate', 'PassportExpirationDate', 'PassportIssuingCountry', 'NationalityCountry', 'PrimaryEmergencyContactName', 'PrimaryEmergencyContactIsParent', 'PrimaryEmergencyContactEmailAddress', 'PrimaryEmergencyContactPhoneNumber', 'SecondaryEmergencyContactName', 'SecondaryEmergencyContactIsParent', 'SecondaryEmergencyContactEmailAddress', 'SecondaryEmergencyContactPhoneNumber', 'DietRestrictions', 'Allergies', 'Medications', 'Notes', 'OtherConsiderations']
    },
    store: 'Members'
  });

}).call(this);
