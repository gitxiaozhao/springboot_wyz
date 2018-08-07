package com.jk.service.impl;

import com.jk.dao.UserMapper;
import com.jk.model.*;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

    /*查询角色树*/
    @Override
    public List<User> queryUser() {
        List<User> list = userMapper.queryUser();
        return list;
    }

    /*查询用户树*/
    @Override
    public List<Role> queryRole() {
        List<Role> list = userMapper.queryRole();
        return list;
    }

    /*查询权限树*/
    @Override
    public List<Quanxian> queryQuanxian() {
        List<Quanxian> list = userMapper.queryQuanxian();
        return list;
    }

    /*根据用户ID查询对应用户角色*/
    @Override
    public List<UserRole> queryRoleById(Integer userid) {
        List<UserRole> list = userMapper.queryRoleById(userid);
        return list;
    }

    /*根据对应用户角色的ID查询对应权限*/
    @Override
    public List<RoleQuanxian> queryQuanxianByIds(String roleids) {
        List<RoleQuanxian> list = userMapper.queryQuanxianByIds(roleids);

        return list;
    }

    /*给用户赋角色*/
    @Override
    public void updateUserRole(Integer userid, String roleIds) {
        /*首先根据用户ID删除他所有的角色*/
        userMapper.deleteUserRoleById(userid);

        /*然后新增对应的角色*/
        if (roleIds!=null){
            String[] roleIdsArr = roleIds.split(",");

            for (int i=0;i<roleIdsArr.length;i++){
                Integer roleId = Integer.parseInt(roleIdsArr[i]);
                userMapper.addUserRole(userid,roleId);
            }
        }

    }
}
