/**
* @description - Use REST API to add Community Members By Profile
* @date - 2023-04-24
*/

static final String API_VERSION = 'v57.0';
static final String CMMTY_NAME = 'Test Community';
static final String S_OBJECT = 'NetworkMemberGroup'; // This could be use with other sobjects
static final String TESTING_PROFILE = 'Standard User'

Network currNetwork = [Select Id From Network Where Name = :CMMTY_NAME];
Profile prof = [Select Id From Profile Where Name = :TESTING_PROFILE];

