package cn.edu.xcu.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode {
	public static void main(String[] args) {
		BCryptPasswordEncoder bc=new BCryptPasswordEncoder();
		System.out.println(bc.encode("admin"));
	}
}	
