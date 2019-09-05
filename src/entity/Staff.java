package entity;

public class Staff {
    private Integer id;//员工id
    private String sName;//员工姓名
    private String phone;//电话号码
    private String gender;//员工性别
    private String post;//员工职务

    public Staff() {
    }

    public Staff(String sName, String phone, String gender, String post) {
        this.sName = sName;
        this.phone = phone;
        this.gender = gender;
        this.post = post;
    }

    public Staff(int id, String sName, String phone, String gender, String post) {
        this.id = id;
        this.sName = sName;
        this.phone = phone;
        this.gender = gender;
        this.post = post;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "staff{" +
                "id=" + id +
                ", sName='" + sName + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", post='" + post + '\'' +
                '}';
    }
}
