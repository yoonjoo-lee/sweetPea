package pea.board.service;

import java.util.List;

import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
import pea.board.vo.SearchVo;

public interface MainBoardService {

	int write(MainBoardVo vo); //게시물 작성
	List<MainBoardVo> list(SearchVo searchVo); //게시물 리스트 조회
	MainBoardVo view(int bidx); //각 게시물 조회 
	public int countBoard(int category); //게시물 총 갯수
	int modify(MainBoardVo vo); //게시물 수정
	int delete(int bidx); //게시물 삭제
	
	int writeReply(MainCommentVo vo); //댓글 작성
	List<MainCommentVo> selectComment(MainCommentVo vo); //댓글 리스트 조회
	int modifyReply(MainCommentVo vo); //댓글 수정
	int deleteReply(int cidx); //댓글 삭제

}
