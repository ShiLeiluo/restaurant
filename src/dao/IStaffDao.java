package dao;

import entity.Staff;

import java.util.List;

public interface IStaffDao {
    int saveStaff(Staff staff);
    int deleteStaff(int id);
    int updateStaff(Staff staff);
    List<Staff> getAllStaff();
    Staff findById(int id);
    //int currentPage当前页数,int pageSize页面大小
    List<Staff> getAllStusbypage(int currentPage, int pageSize);
    Long getTotalCount();//表单总数据
}
