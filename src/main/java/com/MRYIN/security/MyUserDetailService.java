package com.MRYIN.security;

import com.MRYIN.mapper.UserMapper;
import com.MRYIN.pojo.Permission;
import com.MRYIN.pojo.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MyUserDetailService implements UserDetailsService {

    private Logger logger = Logger.getLogger(MyUserDetailService.class);

    @Autowired
    private UserMapper userMapper ;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User byUsername = userMapper.findByUsername(username);

        //根据用户名查询当前用的所有权限
        List<Permission> permissionByUsername = userMapper.findPermissionByUsername(username);
        /*
         * authorities用来存放所有的权限集合
         * */
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        for(Permission permission : permissionByUsername){
            GrantedAuthority authority = new SimpleGrantedAuthority(permission.getPermTag());
            authorities.add(authority);
            System.out.println(permission);
        }

        //把所有权限的集合赋值给user
        byUsername.setAuthorities(authorities);

        for (GrantedAuthority authority : authorities) {
            System.out.println(authority);
        }

        logger.info("当前用户"+ byUsername);

        return byUsername;
    }
}
