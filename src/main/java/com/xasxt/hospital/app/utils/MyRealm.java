package com.xasxt.hospital.app.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.xasxt.hospital.app.bean.Role;
import com.xasxt.hospital.app.bean.User;
import com.xasxt.hospital.app.service.UserService;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		SimpleAuthenticationInfo  info=null;
		Map<String,Object>map =new HashMap<String, Object>();
		map.put("uname", (String)token.getPrincipal());
		User user=login(map);
		if(user!=null) {
			info=new SimpleAuthenticationInfo(user.getUname(),user.getAccount(),getName());
		}
		return info;
	
	
	}
	
	private User login(Map<String,Object>map) {
		return userService.login(map);
	}
	@Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        SimpleAuthorizationInfo  info=new SimpleAuthorizationInfo();
        Map<String,Object>map =new HashMap<String, Object>();
        map.put("uname", (String)principal.getPrimaryPrincipal());
        User user=login(map);
        List<String>rolesNames=new ArrayList<String>();
        List<Role>list=user.getListRole();
        for(Role r:list) {
            rolesNames.add(r.getRname());
        }
        info.addRoles(rolesNames);
        
        return info;
    }

	

}
