package cn.edu.xcu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author dcn
 * @since 2019-11-15
 */
@TableName("t_role_permission")
public class RolePermission implements Serializable {

    private static final long serialVersionUID=1L;

    private Integer roleid;

    private String permission;


    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "RolePermission{" +
        "roleid=" + roleid +
        ", permission=" + permission +
        "}";
    }
}
