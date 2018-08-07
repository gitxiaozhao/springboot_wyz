package com.jk.dao;

import com.jk.model.*;
import org.apache.ibatis.annotations.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

@Mapper
@NoRepositoryBean
public interface UserMapper extends JpaRepository{
    /*查询用户树*/
    @Select("select * from t_user ")
    List<User> queryUser();

    /*查询角色树*/
    @Select("select * from t_role ")
    List<Role> queryRole();

    /*查询权限树*/
    @Select("select * from t_quanxian ")
    List<Quanxian> queryQuanxian();

    /*根据用户ID查询对应用户角色*/
    @Select("select * from user_role ur where ur.uid = #{userid} ")
    List<UserRole> queryRoleById(Integer userid);

    /*根据对应用户角色的ID查询对应权限*/
    @Select("select * from rq where rid in(${roleids}) GROUP BY qid")
    List<RoleQuanxian> queryQuanxianByIds(@Param("roleids")String roleids);

    /*给用户赋角色*/
    @Delete("Delete FROM user_role where uid = #{userid} ")
    void deleteUserRoleById(Integer userid);
    @Insert("insert into user_role(uid,rid) values(#{userid},#{roleId}) ")
    void addUserRole(@Param("userid")Integer userid, @Param("roleId")Integer roleId);
}
