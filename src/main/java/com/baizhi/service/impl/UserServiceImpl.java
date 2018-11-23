package com.baizhi.service.impl;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public User selectOne(User user) {
		return userDao.selectOne(user);
	}
	@Override
	public boolean regist(User user) {
		try {
			userDao.insert(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
