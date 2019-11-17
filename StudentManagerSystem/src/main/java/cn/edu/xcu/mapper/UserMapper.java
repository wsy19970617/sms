package cn.edu.xcu.mapper;

import cn.edu.xcu.entity.User;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
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
public interface UserMapper extends BaseMapper<User> {
	@Select("select * from t_user where username=#{username}")
	@Results({
		@Result(column="id",property="id"),
		@Result(many=@Many(select="cn.edu.xcu.mapper.RoleMapper.findByUserId"),column="id",property="roles")
	})
	User findByName(String username);
	@Select("select t_user.username from t_user where username=#{username}")
	User findExitOne(String name);
}
