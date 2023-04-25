/**
* @description - simple script to assign Skip Identity Perm Set to a given user in a Test env
* @date - 2023-04-24
* @author - Brian Kayser
*/

static List<PermissionSetAssignment> psaList = new List<PermissionSetAssignment>();
PermissionSet psSkip = [Select Id From PermissionSet Where Name = 'Skip_Identity_Confirmation'];

// Add Skip Identity Confirmation Perm Set
for (User u : [Select Id From User Where LastName = 'Test' Andd IsActive = true]) {
    PermissionSetAssignment psa = new PermissionSetAssignment 
        (PermissionSetId = psSkip.Id, AssigneeId = u.Id);
    pslaList.add(psla);
}

try {
    upsert pslaList;
} catch (exception e) {
    system.debug('exception caught ' + e);
}