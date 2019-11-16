package cn.edu.xcu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.edu.xcu.entity.User;
import cn.edu.xcu.service.IUserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@RestController
public class UserController {
	@Autowired
	private IUserService iUserService;
	@RequestMapping("/add")
	public String UserAdd(User user) {
		boolean ret=iUserService.save(user);
		if(ret) {
			return "/main";
		}else {
	        return "redirect:/add";	
		}
	
	}
	
	@RequestMapping("/del")
	public Map<String,Object> delete(Integer id){
		boolean result=iUserService.removeById(id);
		Map<String,Object> ret=new HashMap<>();
		if(result){
			ret.put("code",1);
			ret.put("msg","删除成功");
			}else{
				ret.put("code",-1);
				ret.put("msg","删除失败");
				}
		return ret;
		}
	@RequestMapping("/update")
	public Map<String,Object> update(User user){
		boolean result=iUserService.updateById(user);
		Map<String,Object> ret=new HashMap<>();
		if(result){
			ret.put("code",1);
			ret.put("msg","编辑成功");
			}else{
				ret.put("code",-1);
				ret.put("msg","编辑失败");
		}
		return ret;
		
	}
	
	
	@RequestMapping("/findAll")
	public List<User> findAll(){
		return iUserService.list();
	}
}

