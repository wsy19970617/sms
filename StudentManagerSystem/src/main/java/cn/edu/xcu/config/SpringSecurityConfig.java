package cn.edu.xcu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import cn.edu.xcu.service.IUserService;
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private IUserService iUserService;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//这个必须放行,否则进不到主页面
		http.csrf().disable(); 
		http
	        .authorizeRequests()                                                                
	            .antMatchers("/toLogin","/**/*.js", "/**/*.css", "/**/*.css.map","/user/add").permitAll()                  
	           .antMatchers("/**").access("hasRole('ROLE_USER')")                                                              
	            .and()
	        .formLogin().usernameParameter("username").passwordParameter("pwd").loginPage("/toLogin")
	        .defaultSuccessUrl("/index")
	        .permitAll();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(iUserService);
	}
	@Bean
	public PasswordEncoder createPasswordEncode() {
		return new BCryptPasswordEncoder();
	}
	
}
