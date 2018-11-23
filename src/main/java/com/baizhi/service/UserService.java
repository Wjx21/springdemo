package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
	User selectOne(User user);
	boolean regist(User user);
}
