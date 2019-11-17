package cn.edu.xcu.mapper;

import cn.edu.xcu.entity.Role;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
public interface RoleMapper extends BaseMapper<Role> {
	@Select("select * from t_role where id in(select roleid from t_user_role where userid=#{userid})")
	List<Role> findByUserId(int userid);
}
