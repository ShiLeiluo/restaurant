package service;

import entity.Member;

import java.util.List;

public interface IMemberService {
    List<Member> getAllStus();//查找所有会员
    int updateMember(Member member);//修改会员信息
    int addMember(Member member);//增加会员
    int delMember(String id);//删除会员
    Member findByid(String id);//用id查找会员
    List<Member> findAllbypage(int currentPage, int pageSize);//页码和每页数据  查找
    Long getTotalCount();//查找数据总数
}
