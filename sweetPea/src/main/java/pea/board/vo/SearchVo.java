package pea.board.vo;

public class SearchVo{
	
	private String searchType;
	private String searchValue;
	private int category;
	private int list;
	
	public int getList() {
		return list;
	}
	public void setList(int list) {
		this.list = list;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
}
