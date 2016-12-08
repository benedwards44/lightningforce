/**
* @author Ben Edwards (ben@edwards.nz)
* @date 8th November 2016
* @description Test class for the LightningPageMessagesController
**/
@isTest
private class LightningPageMessagesControllerTest {
	
	/**
    *   @author Ben Edwards (ben@edwards.nz)
    *   @description Very simple test to cover the LightningPageMessagesController
    **/
    @isTest
    static void testLightningPageMessagesController() {

    	// Instantiate the controler
    	LightningPageMessagesController testCon = new LightningPageMessagesController();

    	// Create an error message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Test error message'));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Test error message 2'));

        // Create another error message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Test successful message'));

        // Get the error message map
        Map<String, List<String>> errorMessageMap = testCon.getAllPageMessagesMap();

        // Assert that two errors exist for the appropriate label
        system.assertEquals(
            2,
            errorMessageMap.get(LightningPageMessagesController.severityToThemeMap.get(ApexPages.Severity.ERROR)).size(),
            'There should be 2 ERROR messages.'
        );

        system.assertEquals(
            1,
            errorMessageMap.get(LightningPageMessagesController.severityToThemeMap.get(ApexPages.Severity.CONFIRM)).size(),
            'There should be 1 CONFIRM message.'
        );
    }

}