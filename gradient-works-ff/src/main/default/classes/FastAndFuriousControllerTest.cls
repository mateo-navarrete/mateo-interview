/**
 * @description       : tests the functionality of the FastAndFuriousController
 * @author            : mateo navarrete
 * @group             : interviewees
 * @last modified on  : 04-12-2022
 * @last modified by  : mateo navarrete
**/
@IsTest
public class FastAndFuriousControllerTest {
    
    @IsTest
    private static void getMappedResponsePositiveTest(){
        Test.setMock(HttpCalloutMock.class, new MockCalloutService());
        string methodType = 'GET';
        string endpoint = 'https://api.gradientworks.dev/ff/';
        Map<string, object> res = FastAndFuriousController.getMappedResponse('movies');
        string actualValue = JSON.serialize(res);
        string expectedValue = '{"movies":[{"id": 1,"title": "The Fast and the Furious","release_date": "2001-06-22T00:00:00Z","opening_revenue": "40,089,015"}]}';
        System.assertEquals(actualValue.contains('The Fast and the Furious'), expectedValue.contains('The Fast and the Furious'));
    }

    @IsTest
    private static void getMappedResponseNegativeTest(){
        List<Exception> catchErrs = new List<Exception>();
        
        Test.startTest();
        try {
            //TODO
        } catch (Exception e) {
            catchErrs.add(e);
        }
        Test.stopTest();

        for (Exception e: catchErrs){
            System.assertEquals('System.AuraHandledException', e.getTypeName());
        }
    }

}
