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
	int delId(UserVo vo);
	int userEmailCheck(UserVo vo);
	int idxModify(UserVo vo);
	int profileUpload(UserVo vo);
	
	UserVo selectId(UserVo vo);
	UserVo selectMy(UserVo vo);
}
