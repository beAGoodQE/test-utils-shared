/**
* @description - Assigns Perm Sets and Groups
* @date - 2023-04-24
* @author - Brian Kayser
*/

static List<PermissionSetLicenseAssign> pslaList = new List<PermissionSetLicenseAssign>();
static List<PermissionSetAssignment> psgList = new List<PermissionSetAssignment>();
PermissionSetLicense psl = [Select Id From PermissionSetLicense Where DeveloperName = 'TestPsl'];
PermissionSetGroup psg = [Select Id From PermissionSetGroup Where Name = 'TestGroup'];

public void assignPermSetLicense() {
    
    for (User u : [Select Id From User Where Alias Like 'Test%' And IsActive = true]) {
        PermissionSetLicenseAssign psla = new PermissionSetLicenseAssign 
            (PermissionSetLicenseId = psl.Id, AssigneeId = u.Id);
        pslaList.add(psla);
    }

    try {
        upsert pslaList;
    } catch (exception e) {
        system.debug('exception caught ' + e);
    }
}

public void assignPermSetGroup() {
    
    for (User usr : [Select Id From User Where Alias Like 'Test%' And IsActive = true]) {
        PermissionSetAssignment psa = new PermissionSetAssignment 
            (PermissionSetGroupId = psg.Id, AssigneeId = usr.Id);
        psgList.add(psla);
    }

    try {
        upsert psgList;
    } catch (exception e) {
        system.debug('exception caught ' + e);
    }
}