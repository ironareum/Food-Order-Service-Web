package kr.co.softsoldesk.beans;

public class ReviewPageBean {
	
	private int min; //최소 페이지번호 
	private int max; //최대페이지 번호 
	private int prePage; //이전 
	private int nextPage; //다음 
	private int pageCnt;//전체페이지 갯수 
	private int currentPage; //현재글 번호 
	
	// 전체글갯수, 현재글번호, 페이지별 글목록 갯수, 페이지버튼 갯수 
	public ReviewPageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		//현재페이지 번호 
		this.currentPage = currentPage;
		
		System.out.println("BEAN- contentCnt: "+ contentCnt);
		System.out.println("BEAN- currentPage: "+ currentPage);
		System.out.println("BEAN- contentPageCnt: "+ contentPageCnt);
		System.out.println("BEAN- paginationCnt: "+ paginationCnt);
		
		
		//전체페이지 갯수 
		pageCnt = contentCnt / contentPageCnt;
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		
		
		min = ((currentPage-1) /contentPageCnt) * contentPageCnt +1; 
		max = min + paginationCnt -1;
		
		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prePage = min -1;
		nextPage = max +1;
		
		if(nextPage >pageCnt) {
			nextPage = pageCnt;
		}
		
	}
	
	
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	
	
	
}
