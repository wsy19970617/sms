package cn.edu.xcu.service.impl;

import cn.edu.xcu.entity.User;
import cn.edu.xcu.mapper.UserMapper;
import cn.edu.xcu.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
