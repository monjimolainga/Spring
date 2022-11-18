package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	// 회원정보는 고유하므로 >> 마지막 회원번호 조회
	public int selectMaxUserNum() {
		return template.getMapper(UserMapper.class).selectMaxUserNum();
	}

	// 회원정보 입력 (추가)
	public void insertUser(User user) {
		template.getMapper(UserMapper.class).insertUser(user);
	}

	// 회원정보 조회
	public User selectUser(String id) {
		return template.getMapper(UserMapper.class).selectUser(id);
	}

}
