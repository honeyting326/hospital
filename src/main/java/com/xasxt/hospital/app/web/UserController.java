package com.xasxt.hospital.app.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
	
	@RequestMapping("login")
	public String login(String uname,String account) {
		UsernamePasswordToken  token=new UsernamePasswordToken(uname, account);
		Subject subject=SecurityUtils.getSubject();
		if (!subject.isAuthenticated()) {
			try {
				subject.login(token);
			} catch (UnknownAccountException e) {
				return "0";
			}catch (IncorrectCredentialsException e) {
				return "-1";
			}catch (AuthenticationException  e) {
				return "-2";
			}
		}
		return "1";
		
	}

}
