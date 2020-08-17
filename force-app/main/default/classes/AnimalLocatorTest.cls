@isTest
public class AnimalLocatorTest {
    @isTest
    public static void Testa(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        System.assert(AnimalLocator.getAnimalNameById(1) != null);
    }
}