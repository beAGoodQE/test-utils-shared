/**
* @description - Assign UserId from alias to employee for testing
* @date - 2023-04-25
* @author - Brian Kayser
*/

final String alias = '%%%PARAM_1%%%%';
User currUser = [Select Id From User Where IsActive = true And Alias = :alias];
final String empNumber = '%%%PARAM_2%%%';
Employee currEmployee = [Select Id From Employee Where EmployeeNumber = :empNumber];

currEmp.UserId = currUser.Id;

List<Employee> employees = new List<Employee>();
employees.add(currEmployee);

try {
    Database.upsert(employees);
} catch (exception e) {
    system.debug('exception caught ' + e);
}