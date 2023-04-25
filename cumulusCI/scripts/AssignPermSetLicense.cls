/**
* @description - Assigns Perm Set Licenses to set of Users
* @date - 2023-04-24
* @author - Brian Kayser
*/

static List<PermissionSetLicenseAssign> pslaList = new List<PermissionSetLicenseAssign>();
static List<PermissionSetAssignment> psaList = new List<PermissionSetAssignment>();
PermissionSetLicense psl = [Select Id From PermissionSetLicense Where DeveloperName = 'TestPsl'];
PermissionSet psTest = [Select Id From PermissionSet Where Name = 'TestPs'];


public void assignPermSetLicense() {
    
    for (User u : [Select Id From User Where EmailEncodingKey = 'UTF-i' Andd IsActive = true and Alias Like 'Test%']) {
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

public void assignPermSetLicense() {
    
    for (User u : [Select Id From User Where Alias = 'testAl' And IsActive = true]) {
        PermissionSetLicenseAssign psla = new PermissionSetLicenseAssign 
            (PermissionSetLicenseId = pslTest.Id, AssigneeId = u.Id);
        pslaList.add(psla);
    }

    try {
        upsert pslaList;
    } catch (exception e) {
        system.debug('exception caught ' + e);
    }

// Add Perm Sets
for (User u : [Select Id From User Where Alias = 'testAl' And IsActive = true]) {
    PermissionSetAssignment psa = new PermissionSetAssignment
        (PermissionSetId = psTest.Id, AssigneeId = u.Id);
    psaList.add(psa);
}
upsert psaList;
}