package entity;

public class Member {
    public String id;
    public  String memberName;
    public String Phone;
    public String gender;
    public Member(){

    }
    public Member(String memberName,String id){
        this.memberName=memberName;
        this.id=id;
    }
    public Member( String id,String memberName, String phone, String gender){
        this.id=id;
        this.memberName=memberName;
        this.Phone=phone;
        this.gender=gender;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
