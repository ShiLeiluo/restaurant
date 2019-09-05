package dao.impl;

import dao.IStaffDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import entity.Staff;
import utils.C3POUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffDaoImpl implements IStaffDao {
    QueryRunner qr;
    public StaffDaoImpl(){
        qr=new QueryRunner(C3POUtil.getDs());
    }

    @Override
    public int saveStaff(Staff staff) {
        String insert_Sql="insert into staff(id,sName,phone,gender,post) values(?,?,?,?,?)";
        try {
            int result=qr.update(insert_Sql,new Object[] {staff.getId(),staff.getsName(),staff.getPhone(),staff.getGender(),staff.getPost()});
            System.out.println(result>0?"插入成功":"插入失败");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //
        }
        return 0;
    }

    @Override
    public int deleteStaff(int id) {
        String delete_sql="delete from staff where id=?";
        int result=0;
        try {
            result= qr.update(delete_sql,new Object[]{id});
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int updateStaff(Staff staff) {
        String update_sql="update staff set sName=?,phone=?,gender=?,post=? where id=?";
        int result=0;
        try {
            result=qr.update(update_sql,new Object[]{staff.getsName(),staff.getPhone(),staff.getGender(),staff.getPost(),staff.getId()});
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Staff> getAllStaff() {
        String select_sql="select * from staff";
        List<Staff> staffs=new ArrayList<>();
        try {
            staffs=qr.query(select_sql,new BeanListHandler<Staff>(Staff.class));
            //System.out.println(staffs);
//            for(Staff staff:staffs){
//                System.out.println(staff);
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }

    @Override
    public Staff findById(int id) {
        String select_sql="select *  from staff where id=?";
        Staff staff=null;
        try {
            staff=qr.query(select_sql,new BeanHandler<Staff>(Staff.class),id);
            System.out.println(staff);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staff;
    }

    @Override
    public List<Staff> getAllStusbypage(int currentPage, int pageSize) {
        String sql="select * from staff limit ?,?";
        List<Staff> staffs=new ArrayList<>();
        try {
            staffs=qr.query(sql,new BeanListHandler<Staff>(Staff.class),(currentPage-1)*pageSize,pageSize);
            for(Staff staff:staffs){
                System.out.println(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }

    @Override
    public Long getTotalCount() {
        String select_sql="select count(*) from staff";
        Long count=0l;
        try {
            count=(Long) qr.query(select_sql,new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
