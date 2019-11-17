package cn.edu.xcu.service;

import cn.edu.xcu.entity.Score;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
public interface IScoreService extends IService<Score> {
      Score findScoreByUserId(int userid);
}
