package service.impl;

import dao.IFoodDao;
import entity.Food;
import entity.Orders;
import factory.BeanFactory;
import service.IFoodService;

import java.util.List;

public class FoodService implements IFoodService {

	private IFoodDao foodDao = BeanFactory.getInstance("foodDao", IFoodDao.class);

	@Override
	public List<Food> getAll() {
		return foodDao.getAll();
	}

	@Override
	public Long getTotalCount() {
		return foodDao.getTotalCount();
	}

	@Override
	public int insert(String foodName,String foodPrice) {
		return foodDao.insert(foodName,foodPrice);
	}

	@Override
	public List<Food> findFoodByPage(int currentPage, int pagesize) {
		return foodDao.findFoodByPage(currentPage,pagesize);
	}

	@Override
	public List<Orders> getOrders() {
		return foodDao.getOrders();
	}

	@Override
	public double count() {
		return foodDao.count();
	}

	@Override
	public int delete() {
		return foodDao.delete();
	}
	@Override
	public int addFood(Food food) {
		return foodDao.addFood(food);
	}

	@Override
	public int upDate(Food food) {
		return foodDao.upDate(food);
	}

	@Override
	public int deleteFood(int id) {
		return foodDao.deleteFood(id);
	}

}
