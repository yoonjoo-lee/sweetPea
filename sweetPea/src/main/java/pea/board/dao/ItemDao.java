package pea.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String namespace = "pea.board.mapper.ItemMapper";
	
	
	public int itemNameCheck(String name) {
		String itemNameCheck = sqlSession.selectOne(namespace+".itemNameCheck",name);
		System.out.println(itemNameCheck);
		if(itemNameCheck==null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	
	
}
