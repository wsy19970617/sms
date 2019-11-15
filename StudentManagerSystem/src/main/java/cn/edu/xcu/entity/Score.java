package cn.edu.xcu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@TableName("t_score")
public class Score implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer userid;

    private Integer gradeid;

    private Integer english;

    private Integer politics;

    private Integer major1;

    private Integer major2;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGradeid() {
        return gradeid;
    }

    public void setGradeid(Integer gradeid) {
        this.gradeid = gradeid;
    }

    public Integer getEnglish() {
        return english;
    }

    public void setEnglish(Integer english) {
        this.english = english;
    }

    public Integer getPolitics() {
        return politics;
    }

    public void setPolitics(Integer politics) {
        this.politics = politics;
    }

    public Integer getMajor1() {
        return major1;
    }

    public void setMajor1(Integer major1) {
        this.major1 = major1;
    }

    public Integer getMajor2() {
        return major2;
    }

    public void setMajor2(Integer major2) {
        this.major2 = major2;
    }

    @Override
    public String toString() {
        return "Score{" +
        "id=" + id +
        ", userid=" + userid +
        ", gradeid=" + gradeid +
        ", english=" + english +
        ", politics=" + politics +
        ", major1=" + major1 +
        ", major2=" + major2 +
        "}";
    }
}
