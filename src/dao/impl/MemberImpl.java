package dao.impl;

import dao.IMemberDao;
import entity.Member;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3POUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberImpl implements IMemberDao {

    QueryRunner qr;


    public MemberImpl(){

        qr=new QueryRunner(C3POUtil.getDs());
    }
    @Override
    public List<Member> getAllStus() {
        String select_sql="select * from member";
        List<Member>members=new ArrayList<>();
        try {
            members=qr.query(select_sql,new BeanListHandler<Member>(Member.class));
            //System.out.println(users);
//            for(Member member:members){
//                System.out.println(member);
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return members;
    }

    @Override
    public int updateMember(Member member) {
        int result=0;
        String update_sql="update member set memberName=?,phone=?,gender=? where id=?";
        try {
            result=qr.update(update_sql,new Object[]{member.memberName,member.Phone,member.gender,member.id});
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(result>0?"修改成功":"修改失败");
        return result;
    }

    @Override
    public int addMember(Member member) {
        String insert_sql="INSERT INTO member(id,memberName,phone,gender) value (?,?,?,?)";
        int result=0;
        try {
            result=qr.update(insert_sql,new Object[]{member.id,member.memberName,member.Phone,member.gender});

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int delMember(String id) {
        String insert_sql="delete from member where id=?";
        int result=0;
        try {
            result=qr.update(insert_sql,new Object[]{id});

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Member findByid(String id) {
        String select_sql="select * from member where id=?";
        Member member = null;
        try {
          member =  qr.query(select_sql,new BeanHandler<Member>(Member.class),id);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }

    @Override
    public List<Member> getAllStusbypage(int currentPage, int pageSize) {
        String sql="select * from member limit ?,?";
        List<Member>members=new ArrayList<>();
        try {
            members=qr.query(sql,new BeanListHandler<Member>(Member.class),(currentPage-1)*pageSize,pageSize);
            for(Member member:members){
                System.out.println(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return members;
    }

    @Override
    public Long getTotalCount() {
        String select_sql="select count(*) from member";
        Long count=0l;
        try {
            count=(Long) qr.query(select_sql,new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
