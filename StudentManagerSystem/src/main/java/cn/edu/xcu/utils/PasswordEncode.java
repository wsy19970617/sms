package cn.edu.xcu.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode {
	public static void main(String[] args) {
		BCryptPasswordEncoder bc=new BCryptPasswordEncoder();
<<<<<<< HEAD
		System.out.println(bc.encode("admin"));
=======
		System.out.println(bc.encode("zhangsan"));
>>>>>>> branch 'master' of https://github.com/wsy19970617/sms
	}
}	
