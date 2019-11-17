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
		//1、让csrf过滤器无效，禁用，否则无法放行
		http.csrf().disable(); 
		http.authorizeRequests()
			    //2、http请求的安全配置：放行页面，js，css，css.map；permitAll放行所有权限
	            .antMatchers(
	            		"/toLogin",
	            		"/**/*.js", 
	            		"/**/*.css",
	            		"/**/*.css.map",
	            		"/**/*.jpg",
	            		"/user/add")
	            		.permitAll().anyRequest().authenticated()
	            //3、拦截器类似作用，hasRole('ROLE_USER')表达式
	            .antMatchers("/**").access("hasRole('ROLE_USER')")                                                              
	        .and()
	        //4、登陆权限
	        .formLogin()
	        	.usernameParameter("username")
	        	.passwordParameter("pwd")
	        	.loginPage("/toLogin")
	        	.loginProcessingUrl("/toLogin")
	        	.defaultSuccessUrl("/index")
	        .and()
	        //5、登出权限
	        .logout().permitAll();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//6、身份认证管理器:告诉从哪里获取认证，获取什么身份
		auth.userDetailsService(iUserService);
	}
	@Bean
	public PasswordEncoder createPasswordEncode() {
		//7、给密码配置密文，bean注解
		return new BCryptPasswordEncoder();
	}
	
}
