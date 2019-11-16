package cn.edu.xcu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import cn.edu.xcu.entity.Score;
import cn.edu.xcu.service.IScoreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@Controller
@RequestMapping("/score")
public class ScoreController {
	@Autowired
	private IScoreService iScoreService;
	@RequestMapping("/list")
	@ResponseBody
	public IPage<Score> list(
			@RequestParam(defaultValue = "1",required = false)int page,
			@RequestParam(defaultValue = "2",required = false)int limit){
		IPage<Score> toWhichPage=new Page<>(page,limit);
		IPage<Score> iPage=iScoreService.page(toWhichPage);
		return iPage;
	}
}

