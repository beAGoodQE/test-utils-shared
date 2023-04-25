/**
* @description - Create a list of active Users and set to inactive
* @date - 2023-04-24
* @author - Brian Kayser
*/

List<User> users = new List<User>();

for (User usr : [Select Id From User Where IsActive = true And Alias Like 'Test%']) {
    usr.IsActive = false;
    usr.Alias = 'DNU';
    users.add(usr);
}

try {
    Database.upsert(users);
} catch (exception e) {
    system.debug('exception caught ' + e);
}