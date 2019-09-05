package service;

import entity.Staff;

import java.util.List;

public interface IStaffService {
    int saveStaff(Staff staff);
    int deleteStaff(int id);
    int updateStaff(Staff staff);
    List<Staff> getAllStaff();
    Staff findById(int id);
    List<Staff> findAllbypage(int currentPage, int pageSize);//页码和每页数据  查找
    Long getTotalCount();//查找数据总数
}
