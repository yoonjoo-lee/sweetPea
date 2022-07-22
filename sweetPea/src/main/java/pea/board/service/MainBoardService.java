package pea.board.service;

import java.util.List;

import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
import pea.board.vo.MessageVo;
import pea.board.vo.ReportVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

public interface MainBoardService {

	//메인보드
	int write(MainBoardVo vo); //게시물 작성
	List<MainBoardVo> list(SearchVo searchVo); //게시물 리스트 조회
	MainBoardVo view(MainBoardVo vo); //각 게시물 조회 
	public int countBoard(int category); //게시물 총 갯수
	int modify(MainBoardVo vo); //게시물 수정
	int delete(int bidx); //게시물 삭제
	
	//메인보드 댓글
	int writeReply(MainCommentVo vo); //댓글 작성
	List<MainCommentVo> selectComment(MainCommentVo vo); //댓글 리스트 조회
	int modifyReply(MainCommentVo vo); //댓글 수정
	int deleteReply(int cidx); //댓글 삭제
	
	//신고
	int writeReport(ReportVo vo); //신고 게시문 작성
	int reportstate(ReportVo vo); //신고 상태 변경
	int withdrawal(ReportVo vo); //회원 탈퇴 (신고 접수)
	int warningtroll(MessageVo vo); //회원 경고 (트롤에게)
	
	List<UserVo> selectAlluser(); //회원 정보 리스트
	List<UserVo> selectAlldeleteuser(); //탈퇴 회원 정보 리스트
	

}
