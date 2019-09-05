package service.impl;

import dao.IDinnerTableDao;
import entity.DinnerTable;
import factory.BeanFactory;
import service.IDinnerTableService;

import java.util.List;

public class DinnerTableService implements IDinnerTableService {

	private IDinnerTableDao dinnerTableDao = BeanFactory.getInstance(
			"dinnerTableDao", IDinnerTableDao.class);


	@Override
	public List<DinnerTable> findByStatus() {
		return dinnerTableDao.findByStatus();
	}

	@Override
	public int updateById(int id) {
		return dinnerTableDao.updateById(id);
	}

	@Override
	public int updById(int id) {
		return dinnerTableDao.updById(id);
	}
}
