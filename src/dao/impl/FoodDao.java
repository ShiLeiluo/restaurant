package dao.impl;

import dao.IFoodDao;
import entity.Food;
import entity.Orders;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3POUtil;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDao implements IFoodDao{
    QueryRunner qr;
    public FoodDao(){
        qr=new QueryRunner(C3POUtil.getDs());
    }

	@Override
	public List<Food> getAll() {
		String sql = "select * from food";
		List<Food> foods=new ArrayList<>();
		try {
			foods= qr.query(sql, new BeanListHandler<>(Food.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foods;
	}

	@Override
	public Long getTotalCount() {
		String select_sql="select count(*) from food";
		Long count=0l;
		try {
			count= (long) qr.query(select_sql,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}


	@Override
	public int insert(String foodName,String foodPrice) {
		String insert_sql="insert into orders(foodName,foodPrice) value (?,?)";
		int result=0;
		try {
			result=qr.update(insert_sql,new Object[]{foodName,foodPrice});
			System.out.println(result>0?"插入成功":"插入失败");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Food delete(int id) {
		return null;
	}

	@Override
	public List<Food> findFoodByPage(int currentPage, int pagesize) {
		String select_sql="select * from food limit ?,?";
		List<Food>foods=new ArrayList<>();
		try {
			foods= qr.query(select_sql,new BeanListHandler<>(Food.class),new Object[]{(currentPage-1)*pagesize,pagesize});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foods;
	}

	@Override
	public List<Orders> getOrders() {
		String sql = "select * from orders";
		List<Orders> foods=new ArrayList<>();
		try {
			foods= qr.query(sql, new BeanListHandler<>(Orders.class));
//			for (Food food:foods){
//				System.out.println("aaaaaaaaaaa"+food);
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foods;
	}

	@Override
	public double count() {
		String sql = "SELECT sum(foodPrice) FROM orders";
		double sum=0;
		try {
			sum=(double)qr.query(sql,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	@Override
	public int delete() {
		String sql="delete from orders where 1=1";
		int result=0;
		try {
			result=qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}



	@Override
	public int addFood(Food food) {
		int result=0;
		String insert_sql="insert into food(foodName,remainFood,price,mprice,img) value (?,?,?,?,?)";
		try {
			result=qr.update(insert_sql,new Object[]{food.getFoodName(),food.getRemainFood(),food.getPrice(),food.getMprice(),food.getImg()});
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int upDate(Food food) {
		int result=0;
		String sql_update="update food set foodName=?,remainFood=?,price=?,mprice=? where id=?";
		try {
			result=qr.update(sql_update,new Object[]{food.getFoodName(),food.getRemainFood(),food.getPrice(),food.getMprice(),food.getId()});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteFood(int id) {
		int result=0;
		String sql_delete="delete from food where id=?";
		try {
			result=qr.update(sql_delete,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}




















