package pea.board.service;

import pea.board.vo.UserVo;

public interface UserService {
	UserVo login(UserVo vo);
	int idCheck(String id);
	int inserUser(UserVo vo);
	String idExistCheck(UserVo vo);
	int pwdExistCheck(UserVo vo);
	int changePwd(UserVo vo);
	UserVo userIdx(int uidx);
	int pwdCheck(UserVo vo);
	int delId(int uidx);
	int userEmailCheck(UserVo vo);
	int idxModify(UserVo vo);
}
