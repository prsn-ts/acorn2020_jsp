package test.order.dto;

public class OrderDto {
	//필드
	private int num;
	private int price;
	private String menu;
	private String time;
	
	//기본 생성자
	public OrderDto() {}

	public OrderDto(int num, int price, String menu, String time) {
		super();
		this.num = num;
		this.price = price;
		this.menu = menu;
		this.time = time;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	
}
