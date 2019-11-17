package cn.edu.xcu.service;

import cn.edu.xcu.entity.User;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
public interface IUserService extends IService<User>,UserDetailsService {
	public User findExitOne(String username);
}
