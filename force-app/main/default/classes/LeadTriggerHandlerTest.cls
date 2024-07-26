/**
 * @description       :
 * @author            : admillican08@gmail.com
 * @group             :
 * @last modified on  : 07-26-2024
 * @last modified by  : admillican08@gmail.com
 **/
@isTest
class LeadTriggerHandlerTest {
  // In a "real" environment, I would use a TestDataFactory class
  // and the TestSetup method would be much smaller, calling on
  // utility classes to make and populate data.
  @TestSetup
  private static void makeData() {
    LeadTriggerHandler.setisDisabled(true);
    Account testAcct1 = new Account(
      name = 'Acme Corporation',
      AccountNumber = '001'
    );
    Account testAcct2 = new Account(
      name = 'Globex, Inc.',
      AccountNumber = '002'
    );
    Account testAcct3 = new Account(name = 'Initech', AccountNumber = '003');
    Account testAcct4 = new Account(
      name = 'New Company',
      AccountNumber = '004'
    );
    Account testAcct5 = new Account(
      name = 'Twenty Seven Global',
      AccountNumber = '005'
    );
    List<Account> acctLst = new List<Account>{
      testAcct1,
      testAcct2,
      testAcct3,
      testAcct4,
      testAcct5
    };
    insert acctLst;

    List<Lead> ldLst = new List<Lead>();

    Lead lead1 = new Lead(
      Firstname = 'Jaxon',
      Lastname = 'Blaze',
      Title = 'Corporate Web Planner',
      Company = 'Acme Corporation',
      Email = 'jblaze@acme.com',
      Leadsource = 'Partner'
    );
    ldLst.add(lead1);
    Lead lead2 = new Lead(
      Firstname = 'Willow',
      Lastname = 'Everheart',
      Title = 'Head Operations Engineer',
      Company = 'Globex, Inc.',
      Industry = 'Chemicals',
      Phone = '843-838-9062',
      Leadsource = 'Website'
    );
    ldLst.add(lead2);
    Lead lead3 = new Lead(
      Firstname = 'Maximilian',
      Lastname = 'Storm',
      Title = 'VP of National Branding',
      Company = 'New Company',
      Phone = '309-543-4473',
      Email = 'mstorm@newcompany.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead3);
    Lead lead4 = new Lead(
      Firstname = 'Silas',
      Lastname = 'Beaumont',
      Title = 'Assistant Customer Functionality Specialist Executive',
      Company = 'Twenty Seven Global',
      Industry = 'Technology',
      Email = 'silas.beaumont@twentysevenglobal.com',
      Leadsource = 'Trade Show'
    );
    ldLst.add(lead4);
    Lead lead5 = new Lead(
      Firstname = 'Aurora',
      Lastname = 'Silverhawk',
      Title = 'Manager of Corporate Quality',
      Company = 'Initech',
      Industry = 'Technology',
      Email = 'asilverhawk@initech.com',
      Leadsource = 'Website',
      Phone = '202-244-2097'
    );
    ldLst.add(lead5);
    Lead lead6 = new Lead(
      Firstname = 'Zara',
      Lastname = 'Von Brock',
      Title = 'CEO',
      Company = 'Globex, Inc.',
      Industry = 'Chemicals',
      Phone = '262-728-8850',
      Email = 'z.vonbrock@globexinc.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead6);
    Lead lead7 = new Lead(
      Firstname = 'Remy',
      Lastname = 'Nightshade',
      Title = 'Deputy Director of Marketing Synergy',
      Company = 'Acme Corporation',
      Leadsource = 'Partner',
      Email = 'rnightshade@acme.com'
    );
    ldLst.add(lead7);
    Lead lead8 = new Lead(
      Firstname = 'Finnegan',
      Lastname = 'Blackwood',
      Title = 'Head of Department for Dynamic Tactics',
      Company = 'New Company',
      Phone = '936-636-2321',
      Leadsource = 'Website',
      Email = 'fblackwood@newcompany.com'
    );
    ldLst.add(lead8);
    Lead lead9 = new Lead(
      Firstname = 'Cleo',
      Lastname = 'Ember',
      Title = 'Global Solutions Mgr',
      Company = 'Initech',
      Industry = 'Technology',
      Email = 'cember@initech.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead9);
    Lead lead10 = new Lead(
      Firstname = 'Corbin',
      Lastname = 'Ashwhistle',
      Title = 'Assistant Intranet Officer',
      Email = 'c.ashwhistle@globexinc.com',
      Company = 'Globex, Inc.',
      Industry = 'Chemicals',
      Phone = '908-412-9706',
      Leadsource = 'Website'
    );
    ldLst.add(lead10);
    Lead lead11 = new Lead(
      Firstname = 'Ava',
      Lastname = 'Sinclair',
      Title = 'Regional Intranet Executive',
      Company = 'Initech',
      Industry = 'Technology',
      Email = 'asinclair@initech.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead11);
    Lead lead12 = new Lead(
      Firstname = 'Talinn',
      Lastname = 'Grimsby',
      Title = 'Chief Synergist',
      Company = 'Twenty Seven Global',
      Email = 'talinn.grimsby@twentysevenglobal.com',
      Leadsource = 'Trade Show'
    );
    ldLst.add(lead12);
    Lead lead13 = new Lead(
      Firstname = 'Briar',
      Lastname = 'Sterling',
      Title = 'V.P. of Legacy Optimization',
      Company = 'Acme Corporation',
      Email = 'bsterling@acme.com',
      Leadsource = 'Partner'
    );
    ldLst.add(lead13);
    Lead lead14 = new Lead(
      Firstname = 'Zephyr',
      Lastname = 'Wilde',
      Title = 'Vice President of Infrastructure',
      Company = 'Twenty Seven Global',
      Industry = 'Technology',
      Email = 'zephyr.wilde@twentysevenglobal.com',
      Leadsource = 'Trade Show'
    );
    ldLst.add(lead14);
    Lead lead15 = new Lead(
      Firstname = 'Tamsin',
      Lastname = 'Waverly',
      Title = 'Jr Quality Designer',
      Company = 'New Company',
      Email = 'twaverly@newcompany.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead15);
    insert ldLst;
  }

  @isTest
  private static void testHandleTitleNormalization() {
    // Disabling the trigger so as to test the
    // method in isolation
    LeadTriggerHandler.setisDisabled(true);
    List<Lead> ldLst = [
      SELECT Id, Title, LastName
      FROM Lead
      WHERE Title != NULL AND CreatedDate = TODAY
      LIMIT 15
    ];
    Test.startTest();
    LeadTriggerHandler.handleTitleNormalization(ldLst);
    update ldLst;
    Test.stopTest();
    Assert.areEqual(
      5,
      [SELECT COUNT() FROM Lead WHERE Title = 'Executive'],
      'Count of Executive titles not as expected.'
    );
    Assert.areEqual(
      3,
      [SELECT COUNT() FROM Lead WHERE Title = 'Vice President'],
      'Count of Vice President titles not as expected.'
    );
    Assert.areEqual(
      3,
      [SELECT COUNT() FROM Lead WHERE Title = 'Manager'],
      'Count of Manager titles not as expected.'
    );
    Assert.areEqual(
      3,
      [SELECT COUNT() FROM Lead WHERE Title = 'Assistant'],
      'Count of Assistant titles not as expected.'
    );
    Assert.areEqual(
      'Executive',
      [SELECT Title FROM Lead WHERE LastName = 'Beaumont' LIMIT 1].Title,
      'Title of Beaumont not as expected'
    );
    Assert.areEqual(
      'Manager',
      [SELECT Title FROM Lead WHERE LastName = 'Ember' LIMIT 1].Title,
      'Title of Ember not as expected'
    );
    Assert.areEqual(
      'Executive',
      [SELECT Title FROM Lead WHERE LastName = 'Von Brock' LIMIT 1].Title,
      'Title of Von Brock not as expected'
    );

    Assert.areEqual(
      'Vice President',
      [SELECT Title FROM Lead WHERE LastName = 'Wilde' LIMIT 1].Title,
      'Title of Wilde not as expected'
    );
    Assert.areEqual(
      'Assistant',
      [SELECT Title FROM Lead WHERE LastName = 'Waverly' LIMIT 1].Title,
      'Title of Waverly not as expected'
    );
    Assert.areEqual(
      'Corporate Web Planner',
      [SELECT Title FROM Lead WHERE LastName = 'Blaze' LIMIT 1].Title,
      'Title of Blaze not as expected'
    );
  }

  @isTest
  private static void testHandleAutoLeadScoring() {
    // Disabling the trigger so as to test the method
    // in isolation
    LeadTriggerHandler.setisDisabled(true);
    List<Lead> ldLst = [
      SELECT Id, Lead_Score__c, Phone, Email, LeadSource, Industry, LastName
      FROM Lead
      WHERE CreatedDate = TODAY
      LIMIT 15
    ];
    Test.startTest();
    LeadTriggerHandler.handleAutoLeadScoring(ldLst);
    update ldLst;
    Test.stopTest();
    Assert.areEqual(
      0,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Blaze'].Lead_Score__c,
      'LeadScore of Blaze not as expected.'
    );
    Assert.areEqual(
      5,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Everheart']
      .Lead_Score__c,
      'LeadScore of Everheart not as expected.'
    );
    Assert.areEqual(
      10,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Beaumont']
      .Lead_Score__c,
      'LeadScore of Beaumont not as expected.'
    );
    Assert.areEqual(
      18,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Silverhawk']
      .Lead_Score__c,
      'LeadScore of Silverhawk not as expected.'
    );
    Assert.areEqual(
      8,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Blackwood']
      .Lead_Score__c,
      'LeadScore of Blackwood not as expected.'
    );
    Assert.areEqual(
      13,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Sinclair']
      .Lead_Score__c,
      'LeadScore of Sinclair not as expected.'
    );
    Assert.areEqual(
      3,
      [SELECT Lead_Score__c FROM Lead WHERE LastName = 'Waverly'].Lead_Score__c,
      'LeadScore of Waverly not as expected.'
    );
    Assert.areEqual(
      0,
      [
        SELECT COUNT()
        FROM Lead
        WHERE CreatedDate = TODAY AND Lead_Score__c > 18
      ],
      'One or more Leads has a Lead Score over 18'
    );
  }

  @isTest
  private static void testHandleLeadAutoConvert() {
    // Disabling the trigger so as to test
    // the method in isolation
    LeadTriggerHandler.setisDisabled(true);
    ContactTriggerHandler.setisDisabled(true);
    List<Account> acctLst = [
      SELECT Id, Name
      FROM Account
      WHERE AccountNumber LIKE '00%'
      LIMIT 5
    ];
    Map<Id, Lead> ldMap = new Map<Id, Lead>(
      [
        SELECT
          Id,
          FirstName,
          LastName,
          Title,
          Company,
          Email,
          Phone,
          IsConverted
        FROM Lead
        WHERE CreatedDate = TODAY
        ORDER BY LastName
        LIMIT 15
      ]
    );
    // This is the list of five leads that should be converted
    // as we will create a single contact for each first
    List<Contact> conLst = new List<Contact>();
    for (Account acct : acctLst) {
      for (Lead ld : ldMap.values()) {
        if (ld.Company.equals(acct.Name)) {
          Contact con = new Contact(
            FirstName = ld.FirstName,
            LastName = ld.LastName,
            Phone = ld.Phone,
            Title = ld.Title,
            AccountId = acct.Id,
            Email = ld.Email
          );
          conLst.add(con);
          break;
        }
      }
    }
    insert conLst;
    // This is a list of leads that will not be converted
    // as we will create two contacts for each first
    List<Contact> conLst2 = new List<Contact>();
    List<Lead> ldLst2 = [
      SELECT Id, FirstName, LastName, Title, Company, Email, Phone, IsConverted
      FROM Lead
      WHERE CreatedDate = TODAY
      ORDER BY LastName DESC
      LIMIT 15
    ];
    for (Account acct : acctLst) {
      for (Lead ld : ldLst2) {
        if (ld.Company.equals(acct.Name)) {
          Contact con = new Contact(
            FirstName = ld.FirstName,
            LastName = ld.LastName,
            Phone = ld.Phone,
            Title = ld.Title,
            AccountId = acct.Id,
            Email = ld.Email
          );
          conLst2.add(con);
          break;
        }
      }
    }
    insert conLst2;
    List<Contact> conLst3 = new List<Contact>();
    for (Contact con : conLst2) {
      Contact clonedCon = con.clone(false, true, true, true);
      conLst3.add(clonedCon);
    }
    insert conLst3;
    // The remaining five leads will also not be converted
    // as they have no corresponding contact record

    Test.startTest();
    List<Database.LeadConvertResult> lcrs = LeadTriggerHandler.handleLeadAutoConvert(
      null,
      ldMap
    );
    Test.stopTest();

    Assert.areEqual(
      5,
      lcrs.size(),
      'Size of converted leads list results not as expected'
    );
    conLst = [
      SELECT Id, LastName
      FROM Contact
      WHERE Id IN :conLst
      ORDER BY LastName
    ];
    // checking that the list of leads we expected
    // would be converted was converted
    for (Integer i = 0; i < lcrs.size(); i++) {
      Assert.areEqual(
        conLst[i].LastName,
        ldMap.get(lcrs[i].getLeadId()).LastName,
        'Contact Last Name and Converted Lead Last Name are not identical'
      );
    }
  }
  @isTest
  private static void testLeadTrigger() {
    // As the individual methods have had all pathways tested
    // in the other tests (except the update pathway for the AutoConversion method),
    // they won't be test exhaustively here. The update pathway for the HandleAutoConvert
    // method will be tested in this test method

    LeadTriggerHandler.setisDisabled(false);
    ContactTriggerHandler.setisDisabled(true);
    // Creating brand new test data for
    // this method so as to test the insert
    // triggers

    List<Lead> ldLst = new List<Lead>();

    Lead lead1 = new Lead(
      Firstname = 'Livia',
      Lastname = 'Everly',
      Title = 'Manager of Human Programs',
      Company = 'Initech',
      Industry = 'Technology',
      Leadsource = 'Website',
      Phone = '814-583-7177',
      Email = 'placeholder@now.placeholder.com'
    );
    ldLst.add(lead1);

    Lead lead2 = new Lead(
      Firstname = 'Ayla',
      Lastname = 'Fogg-Jenson',
      Title = 'Chief Identity Supervisor',
      Company = 'Globex, Inc.',
      Phone = '626-336-4184',
      Email = 'a.foggjenson@now.globexinc.com',
      Leadsource = 'Website'
    );
    ldLst.add(lead2);

    Lead lead3 = new Lead(
      Firstname = 'Jasper',
      Lastname = 'Riversong',
      Title = 'V.P. of Legacy Markets',
      Company = 'Twenty Seven Global',
      Leadsource = 'Technology',
      Email = 'jasper.riversong@now.twentysevenglobal.com'
    );
    ldLst.add(lead3);

    Lead lead4 = new Lead(
      Firstname = 'Ryder',
      Lastname = 'Stormbridge',
      Title = 'Jr Product Mobility Engineer',
      Company = 'New Company',
      Phone = '540-436-8678',
      Email = 'rstormbridge@now.newcompany.com',
      Leadsource = 'Trade Show'
    );
    ldLst.add(lead4);

    Lead lead5 = new Lead(
      Firstname = 'Goddard',
      Lastname = 'Winterbottom',
      Title = 'International Configuration Consultant',
      Company = 'Acme Corporation',
      Leadsource = 'Partner',
      Email = 'placeholder@now.placeholder.com'
    );
    ldLst.add(lead5);

    List<Account> acctLst = [
      SELECT Id, Name
      FROM Account
      WHERE AccountNumber LIKE '00%'
      LIMIT 5
    ];

    List<Contact> conLst = new List<Contact>();
    for (Account acct : acctLst) {
      for (Lead ld : ldLst) {
        if (ld.Company.equals(acct.Name) && !ld.Email.contains('placeholder')) {
          Contact con = new Contact(
            FirstName = ld.FirstName,
            LastName = ld.LastName,
            Phone = ld.Phone,
            Title = ld.Title,
            AccountId = acct.Id,
            Email = ld.Email
          );
          conLst.add(con);
          break;
        }
      }
    }
    //Testing the before update triggers
    Test.startTest();
    insert conLst;
    insert ldLst;
    Test.stopTest();
    List<Lead> ldLst2 = [
      SELECT
        Id,
        FirstName,
        LastName,
        Title,
        Email,
        Phone,
        Lead_Score__c,
        Company,
        IsConverted
      FROM Lead
      WHERE CreatedDate = TODAY AND Email LIKE '%@now%'
      ORDER BY LastName
      LIMIT 5
    ];
    for (Lead ld : ldLst2) {
      System.debug(
        '**Lead processed: ' + ld.Id + ' , ' + ld.FirstName + ' ' + ld.LastName
      );
    }
    Assert.areEqual(
      'Manager',
      ldLst2[0].Title,
      'Title of first ldLst2 entry not as expected'
    );
    Assert.areEqual(
      'Assistant',
      ldLst2[3].Title,
      'Title of fourth ldLst2 entry not as expected'
    );
    Assert.areEqual(
      'International Configuration Consultant',
      ldLst2[4].Title,
      'Title of fifth ldLst2 entry not as expected'
    );
    Assert.areEqual(
      18,
      ldLst2[0].Lead_Score__c,
      'Lead score of first ldLst2 entry not as expected'
    );
    Assert.areEqual(
      8,
      ldLst2[1].Lead_Score__c,
      'Lead score of second ldLst2 entry not as expected'
    );
    Assert.areEqual(
      0,
      ldLst2[4].Lead_Score__c,
      'Lead score of fifth ldLst2 entry not as expected'
    );
    Assert.isTrue(
      ldLst2[1].isConverted,
      'Second ldLst2 entry not converted as expected'
    );
    Assert.isTrue(
      ldLst2[3].isConverted,
      'Fourth ldLst2 entry not converted as expected'
    );
    conLst = [
      SELECT Id, FirstName, LastName, Email
      FROM Contact
      WHERE Id IN :conLst
      ORDER BY LastName
      LIMIT 5
    ];
    // Updating two to change emails to test the After Update trigger
    for (Account acct : acctLst) {
      for (Lead ld : ldLst) {
        if (ld.Company.equals(acct.Name) && ld.Email.contains('placeholder')) {
          Contact con = new Contact(
            FirstName = ld.FirstName,
            LastName = ld.LastName,
            Phone = ld.Phone,
            Title = ld.Title,
            AccountId = acct.Id,
            Email = ld.Email
          );
          conLst.add(con);
          break;
        }
      }
    }
    conLst[0].Email = 'leverly@initech.com';
    ldLst2[0].Email = 'leverly@initech.com';
    conLst[4].Email = 'gwinterbottom@acme.com';
    ldLst2[4].Email = 'gwinterbottom@acme.com';

    upsert conLst;
    System.debug('**Performing update');
    update ldLst2;
    // Requerying to get data change
    ldLst2 = [
      SELECT Id, isConverted
      FROM Lead
      WHERE Id IN :ldLst2
      ORDER BY LastName
      LIMIT 5
    ];
    Assert.isTrue(
      ldLst2[0].isConverted,
      'First ldLst2 entry not converted as expected'
    );
    Assert.isTrue(
      ldLst2[4].isConverted,
      'Fifth ldLst2 entry not converted as expected'
    );
  }
}
