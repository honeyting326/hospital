package com.xasxt.hospital.app.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xasxt.hospital.app.bean.User;
import com.xasxt.hospital.app.dao.UserDaoMapper;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDaoMapper userDaoMapper;

	public User login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDaoMapper.login(map);
	}

}
