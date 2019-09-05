package dao.impl;

import dao.IDinnerTableDao;
import entity.DinnerTable;
import org.apache.commons.dbutils.QueryRunner;
import utils.C3POUtil;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.ArrayList;
import java.util.List;

public class DinnerTableDao implements IDinnerTableDao{
	QueryRunner qr;

	public DinnerTableDao(){
		qr=new QueryRunner(C3POUtil.getDs());
	}
	@Override
	public List<DinnerTable> findByStatus() {
		String sql = "select * from dinnerTable where tableStatus=?";
		List<DinnerTable> tables=new ArrayList<>();
		try {
			tables= qr.query(sql, new BeanListHandler<>(DinnerTable.class), 0);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return tables;
	}

	@Override
	public int updateById(int id) {
		String sql = "update dinnerTable set tableStatus=1 where id=?";
		int result=0;
		try {
			result=qr.update(sql,new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public int updById(int id) {
		String sql = "update dinnerTable set tableStatus=0 where id=?";
		int result=0;
		try {
			result=qr.update(sql,new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return result;
	}


}
