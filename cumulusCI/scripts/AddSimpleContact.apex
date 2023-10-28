Contact cont = new Contact();
cont.FirstName = 'Jonah';
cont.LastName = 'Lamu';

try {
    insert cont;
    System.debug('Contact created successfully with ID: ' + cont.Id);
} catch (Exception e) {
    System.debug('Error creating Contact: ' + e.getMessage());
}
