package com.MRYIN.serviceImpl;

import com.MRYIN.mapper.UserMapper;
import com.MRYIN.pojo.Permission;
import com.MRYIN.pojo.User;
import com.MRYIN.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper ;

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }

    @Override
    public List<Permission> findPermissionByUsername(String username) {
        return userMapper.findPermissionByUsername(username);
    }

    @Override
    public User loginByUsernameAndPassword(String username, String password) {
        return userMapper.loginByUsernameAndPassword(username , password);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(String username) {
        return userMapper.deleteUser(username);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User queryAllUserByUsername(String username) {
        return userMapper.queryAllUserByUsername(username);
    }

    @Override
    public int updatePassword(User user) {
        return userMapper.updatePassword(user);
    }

    @Override
    public List<User> getLayuiTable() {
        return userMapper.getLayuiTable();
    }


}
