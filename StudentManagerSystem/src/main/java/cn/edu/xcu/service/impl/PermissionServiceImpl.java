package cn.edu.xcu.service.impl;

import cn.edu.xcu.entity.Permission;
import cn.edu.xcu.mapper.PermissionMapper;
import cn.edu.xcu.service.IPermissionService;
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
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

}
