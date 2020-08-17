@isTest
public class ParkLocatorTest {
	@isTest
    public static void Testa(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> listReturn = ParkLocator.country('United States');
        System.assert(listReturn.contains('Yellowstone'));
    }
}