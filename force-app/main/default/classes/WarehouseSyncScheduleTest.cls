@isTest
public class WarehouseSyncScheduleTest {
	@isTest
    public static void Testa(){
        WarehouseSyncSchedule sh1 = new WarehouseSyncSchedule();      
 		String sch = '0 0 23 * * ?';
        system.schedule('Test check', sch, sh1);
    }
}