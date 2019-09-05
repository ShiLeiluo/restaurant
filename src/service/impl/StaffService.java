package service.impl;

import dao.IStaffDao;
import factory.BeanFactory;
import entity.Staff;
import service.IStaffService;

import java.util.List;

public class StaffService implements IStaffService {
    IStaffDao staffDao;
    public StaffService(){
        staffDao= BeanFactory.getInstance("staffdao",IStaffDao.class);
    }
    @Override
    public int saveStaff(Staff staff) {
        return staffDao.saveStaff(staff);
    }

    @Override
    public int deleteStaff(int id) {
        return staffDao.deleteStaff(id);
    }

    @Override
    public int updateStaff(Staff staff) {
        return staffDao.updateStaff(staff);
    }

    @Override
    public List<Staff> getAllStaff() {
        return staffDao.getAllStaff();
    }

    @Override
    public Staff findById(int id) {
        return staffDao.findById(id);
    }

    @Override
    public List<Staff> findAllbypage(int currentPage, int pageSize) {
        return staffDao.getAllStusbypage(currentPage,pageSize);
    }

    @Override
    public Long getTotalCount() {
        return staffDao.getTotalCount();
    }
}
