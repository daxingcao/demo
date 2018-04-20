package com.chat.main.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.chat.main.entity.LoginUser;
@Component
public interface LoginUserMapper {

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
    public LoginUser loginValid(@Param("userName")String userName,@Param("password")String password);

    int updateByPrimaryKeySelective(LoginUser record);

    int updateByPrimaryKey(LoginUser record);
}