package service.impl;

import dao.IMemberDao;
import entity.Member;
import factory.BeanFactory;
import service.IMemberService;

import java.util.List;

public class MemberService implements IMemberService {
    IMemberDao memberDao;
    public MemberService() {
        memberDao= BeanFactory.getInstance("memberdao", IMemberDao.class);
    }
    @Override
    public List<Member> getAllStus() {
        return memberDao.getAllStus();
    }

    @Override
    public int updateMember(Member member) {
        return memberDao.updateMember(member);
    }

    @Override
    public int addMember(Member member) {
        return memberDao.addMember(member);
    }

    @Override
    public int delMember(String id) {
        return memberDao.delMember(id);
    }

    @Override
    public Member findByid(String id) {
        return memberDao.findByid(id);
    }

    @Override
    public List<Member> findAllbypage(int currentPage, int pageSize) {
        return memberDao.getAllStusbypage(currentPage,pageSize);
    }

    @Override
    public Long getTotalCount() {
        return memberDao.getTotalCount();
    }
}
