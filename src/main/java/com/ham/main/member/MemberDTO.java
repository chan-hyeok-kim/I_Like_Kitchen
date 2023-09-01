package com.ham.main.member;
import java.util.List;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.member.RoleDTO;
import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Long point;
	private List<RoleDTO> roles;
	

}

	
	


