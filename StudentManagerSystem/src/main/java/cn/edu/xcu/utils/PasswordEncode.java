package cn.edu.xcu.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode {
	public static void main(String[] args) {
		BCryptPasswordEncoder bc=new BCryptPasswordEncoder();
		System.out.println(bc.matches("admin", "$2a$10$Sxs7FkYK64JRhyd0Vt4XWuwU.ptc2HVEryxyCSy8rjr6h6m2DGiBS"));
	}
}	
