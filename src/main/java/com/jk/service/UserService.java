package com.jk.service;

import com.jk.model.*;

import java.util.List;

public interface UserService {
    /*查询用户树*/
    List<User> queryUser();
    /*查询角色树*/
    List<Role> queryRole();
    /*查询权限树*/
    List<Quanxian> queryQuanxian();
    /*根据用户ID查询对应用户角色*/
    List<UserRole> queryRoleById(Integer userid);
    /*根据对应用户角色的ID查询对应权限*/
    List<RoleQuanxian> queryQuanxianByIds(String roleids);
    /*给用户赋角色*/
    void updateUserRole(Integer userid, String roleIds);
}
