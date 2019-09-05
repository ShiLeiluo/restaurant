import dao.IFoodDao;
import dao.impl.FoodDao;
import org.junit.Test;

public class test1 {
    @Test
    public void getAll(){
        IFoodDao iFoodDao=new FoodDao();
//        iFoodDao.getAll();
        iFoodDao.getTotalCount();
    }
}
