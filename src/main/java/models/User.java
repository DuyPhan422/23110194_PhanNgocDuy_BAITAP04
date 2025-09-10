package models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "Users") 
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(name = "username", nullable = false, length = 100, unique = true)
    private String userName;

    @Column(name = "fullname", length = 150)
    private String fullName;

    @Column(name = "password", nullable = false, length = 100)
    private String passWord;

    @Column(length = 255)
    private String avatar;

    @Column(name = "roleid", nullable = false)
    private int roleid;

    @Column(length = 20)
    private String phone;

    @Column(name = "createdDate", nullable = false)
    private LocalDateTime createdDate;

    public User() {}

    public User(int id, String email, String userName, String fullName,
                String passWord, String avatar, int roleid,
                String phone, LocalDateTime createdDate) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.passWord = passWord;
        this.avatar = avatar;
        this.roleid = roleid;
        this.phone = phone;
        this.createdDate = createdDate;
    }

    // 🔽 Getter & Setter

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPassWord() { return passWord; }
    public void setPassWord(String passWord) { this.passWord = passWord; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public int getRoleid() { return roleid; }
    public void setRoleid(int roleid) { this.roleid = roleid; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }
}