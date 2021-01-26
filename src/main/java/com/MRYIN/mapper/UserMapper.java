package com.MRYIN.mapper;

import com.MRYIN.pojo.Permission;
import com.MRYIN.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    User findByUsername(@Param("username") String username);

    List<Permission> findPermissionByUsername(@Param("username") String username);

    User loginByUsernameAndPassword(@Param("username") String username, @Param("password") String password);


    List<User> queryAllUser();

    int addUser(User user);

    int deleteUser(@Param("username") String username);

    int updateUser(User user);

    User queryAllUserByUsername(@Param("username") String username);


    int updatePassword(User user);

    List<User> getLayuiTable();

}
