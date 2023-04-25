/**
* @description - simple CCI script to create Users
* @date - 2023-04-24
* @author - Brian Kayser
*/

static final String PROFILE_STD = 'Standard User';
static final String PROFILE_SYSADM = 'System Administrator';
static final String TEST_EMAIL = '%%%PARAM_1%%%';
static final String EMAIL_ENCODING_KEY = 'UTF-8';
static List<User> users = new List<User>();
static Integer counter = 0;
Profile su = [Select Id From Profile Where Name = :PROFILE_STD Limit 1];
Profile sa = [Select Id From Profile Where Name = :PROFILE_SYSADM Limit 1];

public void createUsers() {

    // Throw error if email param is not passed in
    System.assert(!String.isBlank(TEST_EMAIL), 'ERROR: must pass in email address parameter');

    userFactory('john.doe@salesforce.com', 'Test', sp);
    userFactory('jane.doe@salesforce.com', 'Tester', sa);

    try {
        Database.upsert(users);
    } catch (exception e) {
        system.debug('exception caught ' + e);
    }
}

/**
 * @description User factory to add unique Users
 * @param UserEmail
 * @param UserLastName
 * @param Profile p (sa for Sys Admin, su for Standard User)
 */
 private static void userFactory(String UserEmail, String UserLastName, Profile p) {
    User usr = new User();
    usr.Alias = 'en_US';
    usr.Email = UserEmail;
    usr.EmailEncodingKey = EMAIL_ENCODING_KEY;
    usr.FirstName = UserLastName;
    usr.LanguageLocaleKey = 'en_US';
    usr.LastName = UserLastName;
    usr.LocaleSidKey = 'en_US';
    usr.ProfileId = p.Id;
    usr.TimeZoneSidKey = UserInfo.getTimeZone().toString();
    usr.Username = UserEmail + '-' + System.now().format('SSssss') + '@' + 'sforce.com';

    users.add(usr);
 }