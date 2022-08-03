package pea.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pea.board.vo.ItemVo;

@Repository
public class ItemDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.ItemMapper";
	
	// 아이템 이름 중복 체크 
	public int itemNameCheck(String name) {
		String itemNameCheck = sqlSession.selectOne(namespace+".itemNameCheck",name);
		System.out.println(itemNameCheck);
		if(itemNameCheck==null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	// 아이템 등록
	public int itemWrite(ItemVo vo) {
		return sqlSession.insert(namespace+".itemInsert", vo);
	}
	
	// 아이템 내림차순
	public List<ItemVo> itemSelectAll(){
		
		return sqlSession.selectList(namespace+".itemList");
		
	}
	
	// 아이템 인기상품순
	public List<ItemVo> itemListCount(){
		
		return sqlSession.selectList(namespace+".itemListCount");
		
	}
	// 아이템 가격 내림차순
	public List<ItemVo> itemListDesc(){
		
		return sqlSession.selectList(namespace+".itemListDesc");
		
	}
	// 아이템 가격 오름차순
	public List<ItemVo> itemListAsc(){
		
		return sqlSession.selectList(namespace+".itemListAsc");
		
	}
	// 아이템 신상품순
	public List<ItemVo> itemListNew(){
		
		return sqlSession.selectList(namespace+".itemListNew");
		
	}
	
	// 아이템 신상품순 Limit 5개
	public List<ItemVo> itemListNewLimit(){
		
		return sqlSession.selectList(namespace+".itemListNewLimit");
		
	}
	
	public List<ItemVo> itemApproval(){
		return sqlSession.selectList(namespace+".itemApproval");
	}
	
}
