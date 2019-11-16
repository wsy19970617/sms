package cn.edu.xcu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.xcu.entity.Grade;
import cn.edu.xcu.service.IGradeService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@Controller
@RequestMapping("/grade")
public class GradeController {

	@Autowired
	private IGradeService iGradeService;

	@RequestMapping("/findAll")
	@ResponseBody
	public List<Grade> findAll() {
		return iGradeService.list();
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String addGrade(Grade grade) {
		boolean result = iGradeService.save(grade);
		if (result) {
			return "/main";
		} else {
			return "redirect:/add";
		}
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public Map<String, Object> delete(Integer id) {
		Map<String, Object> ret = new HashMap<>();
		boolean result = iGradeService.removeById(id);
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
	@ResponseBody
	public Map<String, Object> update(Grade grade){
		Map<String, Object> ret = new HashMap<>();
		boolean result = iGradeService.saveOrUpdate(grade);//依然根据id进行判断修改或添加
		if (result) {
			ret.put("code", 0);
			ret.put("msg", "更新成功");
		} else {
			ret.put("code", -1);
			ret.put("msg", "更新失败");
		}
		return ret;
	}
}

