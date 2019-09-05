package service;

import entity.DinnerTable;

import java.util.List;

public interface IDinnerTableService {
	List<DinnerTable> findByStatus();
	int updateById(int id);
	int updById(int id);
}
