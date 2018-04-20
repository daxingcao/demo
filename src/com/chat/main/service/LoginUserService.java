package com.chat.main.service;

import com.chat.main.entity.LoginUser;

public interface LoginUserService {

    int deleteByPrimaryKey(Integer id);

    int insert(LoginUser record);

    int insertSelective(LoginUser record);

    LoginUser selectByPrimaryKey(Integer id);
    
    /**
     * 用户登录验证
     * @param userName
     * @param password
     * @return
     */
    public LoginUser loginValid(String userName,String password);

    int updateByPrimaryKeySelective(LoginUser record);

    int updateByPrimaryKey(LoginUser record);
}
