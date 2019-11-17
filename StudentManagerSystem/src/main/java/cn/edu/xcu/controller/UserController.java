package cn.edu.xcu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.edu.xcu.entity.Score;
import cn.edu.xcu.entity.User;
import cn.edu.xcu.service.IUserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService iUserService;

	@RequestMapping("/add")
	public Map<String, Object> UserAdd(User user) {
		Map<String, Object> result = new HashMap<>();
		User exitUser = null;
		exitUser = iUserService.findExitOne(user.getUsername());
		if (exitUser == null) {
			BCryptPasswordEncoder bc=new BCryptPasswordEncoder();
			user.setPwd(bc.encode(user.getPwd()));
			boolean ret = iUserService.save(user);
			if (ret) {
				result.put("code", 0);
			}
		} else {
			result.put("code", -1);
			result.put("msg", "注册失败，用户名已存在");
		}
		return result;
	}

	@RequestMapping("/del")
	public Map<String, Object> delete(Integer id) {
		boolean result = iUserService.removeById(id);
		Map<String, Object> ret = new HashMap<>();
		if (result) {
			ret.put("code", 1);
			ret.put("msg", "删除成功");
		} else {
			ret.put("code", -1);
			ret.put("msg", "删除失败");
		}
		return ret;
	}

	@RequestMapping("/update")
	public Map<String, Object> update(User user) {
		boolean result = iUserService.updateById(user);
		Map<String, Object> ret = new HashMap<>();
		if (result) {
			ret.put("code", 1);
			ret.put("msg", "编辑成功");
		} else {
			ret.put("code", -1);
			ret.put("msg", "编辑失败");
		}
		return ret;

	}

	@RequestMapping("/findAll")
	public List<User> findAll() {
		return iUserService.list();
	}

	@RequestMapping("/list")
	public IPage<User> list(
			@RequestParam(defaultValue = "-1",required = false)int userid,
			@RequestParam(defaultValue = "1",required = false)int page,
			@RequestParam(defaultValue = "2",required = false)int limit){
		IPage<User> toWhichPage=new Page<>(page,limit);
		QueryWrapper<User> wrapper=new QueryWrapper<>();//写条件类
		if(userid!=-1) {
			wrapper.eq("userid", userid);
		}
		IPage<User> iPage=iUserService.page(toWhichPage,wrapper);
		
		return iPage;
	}
}
