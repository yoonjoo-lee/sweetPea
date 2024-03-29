package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.MainBoardVo;
import pea.board.vo.MainCommentVo;
import pea.board.vo.MessageVo;
import pea.board.vo.ReportVo;
import pea.board.vo.SearchVo;
import pea.board.vo.UserVo;

@Repository
public class MainBoardDao {

	@Autowired
	SqlSession sqlSession;
	
	//메인 보드
	public int write(MainBoardVo vo) {
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.write", vo);
	}
	
	public List<MainBoardVo> selectAll(SearchVo searchVo) {
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectAll", searchVo);
	}
	
	public MainBoardVo view(MainBoardVo vo) {
		return sqlSession.selectOne("pea.board.mapper.MainBoardMapper.view", vo);
	}
	
	public int countBoard(int category) {
		return sqlSession.selectOne("pea.board.mapper.MainBoardMapper.countBoard", category);
	}
	
	public int modify(MainBoardVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.modify", vo);
	}
	
	public int delete(int bidx) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.delete", bidx);
	}
	
	//댓글
	public int writeReply(MainCommentVo vo) {
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.writeReply", vo);
	}
	
	public List<MainCommentVo> selectComment(MainCommentVo vo){
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectComment",vo);
	}
	
	public int modifyReply(MainCommentVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.modifyReply", vo);
	}
	
	public int deleteReply(int cidx) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.deleteReply", cidx);
	}
	
	//신고
	public int writeReport(ReportVo vo) {
		int result =  sqlSession.insert("pea.board.mapper.MainBoardMapper.writeReport", vo);
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.writeReport2", vo);
	}
	
	public int reportstate(ReportVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.reportstate", vo);
	}
	
	public int withdrawal(ReportVo vo) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.withdrawal", vo);
	}
	
	public int warningtroll(MessageVo vo) {
		return sqlSession.insert("pea.board.mapper.MainBoardMapper.warningtroll",vo);
	}
	
	public List<UserVo> selectAlluser(){
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectAlluser");
	}
	
	public List<UserVo> selectAlldeleteuser(){
		return sqlSession.selectList("pea.board.mapper.MainBoardMapper.selectAlldeleteuser");
	}
	
	public int delUser(int uidx) {
		return sqlSession.update("pea.board.mapper.MainBoardMapper.delUser",uidx);
	}
}
