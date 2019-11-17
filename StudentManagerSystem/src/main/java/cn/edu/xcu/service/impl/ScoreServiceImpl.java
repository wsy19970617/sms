package cn.edu.xcu.service.impl;

import cn.edu.xcu.entity.Score;
import cn.edu.xcu.mapper.ScoreMapper;
import cn.edu.xcu.service.IScoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
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
public class ScoreServiceImpl extends ServiceImpl<ScoreMapper, Score> implements IScoreService {
	@Override
	public Score findScoreByUserId(int userid) {
		Score score=getBaseMapper().findScoreById(userid);
		return score;
	}

}
