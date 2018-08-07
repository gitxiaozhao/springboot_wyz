package com.jk.controller;

import com.jk.model.*;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="userController")
public class UserController {

    @Resource
    private UserService userService;


    /*首页页面*/
    @RequestMapping(value="testUser")
    public String testUser(){
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        return "jsp/index";
    }

    /*查询用户树*/
    @RequestMapping(value="queryUser")
    @ResponseBody
    public List<User> queryUser(){
        System.out.println("查询用户树方法");
        List<User> list = userService.queryUser();
        return list;
    }

    /*查询用户树*/
    @RequestMapping(value="queryRole")
    @ResponseBody
    public List<Role> queryRole(){
        System.out.println("查询角色树方法");
        List<Role> list = userService.queryRole();
        return list;
    }

    /*查询权限树*/
    @RequestMapping(value="queryQuanxian")
    @ResponseBody
    public List<Quanxian> queryQuanxian(){
        System.out.println("查询角色树方法");
        List<Quanxian> list = userService.queryQuanxian();
        return list;
    }

    //回显部分---------------------------------------------------------------------------------------------------
    /*根据用户ID查询对应用户角色*/
    @RequestMapping(value="queryRoleById")
    @ResponseBody
    public List<UserRole> queryRoleById(Integer userid){
        List<UserRole> list = userService.queryRoleById(userid);
        return list;
    }

    /*根据对应用户角色的ID查询对应权限*/
    @RequestMapping(value="queryQuanxianByIds")
    @ResponseBody
    public List<RoleQuanxian> queryQuanxianByIds(String roleids){
        List<RoleQuanxian> list = userService.queryQuanxianByIds(roleids);
        return list;
    }

    /*给用户赋角色*/
    @RequestMapping(value="updateUserRole")
    @ResponseBody
    public void updateUserRole(Integer userid,String roleIds){
        userService.updateUserRole(userid,roleIds);

    }

}
