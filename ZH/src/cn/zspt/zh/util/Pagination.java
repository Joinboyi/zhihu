package cn.zspt.zh.util;

public class Pagination {
	int totalRowsAmount; // 总行数
	boolean rowsAmountSet; // 是否设置过totalRowsAmount
	int pageSize = 2; // 每页行数
	int currentPage = 1; // 当前页码
	int nextPage;
	int previousPage;
	int totalPages; // 总页数
	boolean hasNext; // 是否有下一页
	boolean hasPrevious; // 是否有前一页
	String description;
	int pageStartRow;
	int pageEndRow;

	public Pagination(int totalRows) {
		setTotalRowsAmount(totalRows);
	}

	public Pagination() {
	}

	/**
	 * @param i
	 *            设定总行数
	 */
	public void setTotalRowsAmount(int i) {
		if (!this.rowsAmountSet) {
			totalRowsAmount = i;
			totalPages = totalRowsAmount / pageSize + 1;
			setCurrentPage(1);
			this.rowsAmountSet = true;
		}

	}

	/**
	 * @param i
	 * 
	 *            当前页
	 * 
	 */
	public void setCurrentPage(int i) {
		if(i>totalPages) 
			currentPage=totalPages;
		else if(i<1) 
			currentPage=1;
		else
			currentPage = i;
		nextPage = currentPage + 1;
		previousPage = currentPage - 1;
		// 计算当前页开始行和结束行
		if (currentPage * pageSize <= totalRowsAmount) {
			pageEndRow = currentPage * pageSize-1;
			pageStartRow = pageEndRow - pageSize+1;

		} else {
			pageEndRow = totalRowsAmount-1;
			pageStartRow = pageSize * (totalPages - 1) ;
		}

		// 是否存在前页和后页

		if (nextPage > totalPages) {
			hasNext = false;
		} else {
			hasNext = true;
		}
		if (previousPage == 0) {
			hasPrevious = false;
		} else {
			hasPrevious = true;
		}
		;
		System.out.println(this.description());
	}

	/**
	 * @return
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @return
	 */
	public boolean isHasNext() {
		return hasNext;
	}

	/**
	 * @return
	 */
	public boolean isHasPrevious() {
		return hasPrevious;
	}

	/**
	 * @return
	 */
	public int getNextPage() {
		return nextPage;
	}

	/**
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @return
	 */
	public int getPreviousPage() {
		return previousPage;
	}

	/**
	 * @return
	 */
	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * @return
	 */
	public int getTotalRowsAmount() {
		return totalRowsAmount;
	}

	/**
	 * @param b
	 */
	public void setHasNext(boolean b) {
		hasNext = b;
	}

	/**
	 * @param b
	 */
	public void setHasPrevious(boolean b) {
		hasPrevious = b;
	}

	/**
	 * @param i
	 */
	public void setNextPage(int i) {
		nextPage = i;
	}

	/**
	 * @param i
	 */
	public void setPageSize(int i) {
		pageSize = i;
	}

	/**
	 * @param i
	 */
	public void setPreviousPage(int i) {
		previousPage = i;
	}

	/**
	 * @param i
	 */
	public void setTotalPages(int i) {
		totalPages = i;
	}

	/**
	 * @return
	 */
	public int getPageEndRow() {
		return pageEndRow;
	}

	/**
	 * @return
	 */
	public int getPageStartRow() {
		return pageStartRow;
	}

	public String getDescription() {
		String description = "Total:" + this.getTotalRowsAmount() + " items "
				+ this.getTotalPages() + " pages";
		// this.currentPage+" Previous "+this.hasPrevious +
		// " Next:"+this.hasNext+
		// " start row:"+this.pageStartRow+
		// " end row:"+this.pageEndRow;
		return description;
	}

	public String description() {
		String description = "Total:" + this.getTotalRowsAmount() + " items "
				+ this.getTotalPages() + " pages,Current page:"
				+ this.currentPage + " Previous " + this.hasPrevious + " Next:"
				+ this.hasNext + " start row:" + this.pageStartRow
				+ " end row:" + this.pageEndRow;
		return description;
	}

	public static void main(String args[]) {
		Pagination pc = new Pagination(33);
		System.out.println(pc.getDescription());
		// pc.setCurrentPage(2);
		// System.out.println(pc.description());
		// pc.setCurrentPage(3);
		// System.out.println(pc.description());
	}
}
