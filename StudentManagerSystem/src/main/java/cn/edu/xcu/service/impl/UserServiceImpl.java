package cn.edu.xcu.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.edu.xcu.entity.Role;
import cn.edu.xcu.entity.User;
import cn.edu.xcu.mapper.UserMapper;
import cn.edu.xcu.service.IUserService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user=getBaseMapper().findByName(username);
		Set<GrantedAuthority> authorities=new HashSet<>();
		for(Role r:user.getRoles()){
			authorities.add(new SimpleGrantedAuthority(r.getName()));
		}
		return new org.springframework.security.core.userdetails.User(username, user.getPwd(), authorities);
	}

	@Override
	public User findExitOne(String username) {
		User user=getBaseMapper().findExitOne(username);
		return user;
	}
	
}
