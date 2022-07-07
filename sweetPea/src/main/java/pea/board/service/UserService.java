package pea.board.service;

import pea.board.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	UserVo idCheck(UserVo vo);
	int idCheck2(String id);
	int inserUser(UserVo vo);
}
