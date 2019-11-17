package cn.edu.xcu.mapper;

import cn.edu.xcu.entity.Score;

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
public interface ScoreMapper extends BaseMapper<Score> {
    @Select("select * from t_score where userid=${userid}")   
	Score findScoreById(int userid);
}
