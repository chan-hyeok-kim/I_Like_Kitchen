package com.ham.main.member;
import java.util.List;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.member.RoleDTO;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Long point;
	private List<RoleDTO> roles;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
	public List<RoleDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	

}

	
	


