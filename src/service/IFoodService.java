package service;

import entity.Food;
import entity.Orders;

import java.util.List;

public interface IFoodService {

	List<Food> getAll();
	Long getTotalCount();
	int insert(String foodName,String foodPrice);
	List<Food> findFoodByPage(int currentPage,int pagesize);
	List<Orders> getOrders();
	double count();
	int delete();
	int addFood(Food food);//添加菜品
	int upDate(Food food);//修改菜品
	int deleteFood(int id);//删除菜品
}
