package dao;

import entity.DinnerTable;

import java.util.List;

public interface IDinnerTableDao {
	List<DinnerTable> findByStatus();
	int updateById(int id);
	int updById(int id);
}
