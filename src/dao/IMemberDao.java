package dao;

import entity.Member;

import java.util.List;

public interface IMemberDao {
    List<Member> getAllStus();//查找所有会员
    int updateMember(Member member);//修改会员信息
    int addMember(Member member);//增加会员
    int delMember(String id);//删除会员
    Member findByid(String id);//用id查找会员
    //int currentPage当前页数,int pageSize页面大小
    List<Member> getAllStusbypage(int currentPage, int pageSize);
    Long getTotalCount();//表单总数据

}
