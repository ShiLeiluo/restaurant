package entity;

public class Food {

	private int id;
	private String foodName;
	private int remainFood;
	private double price;
	private double mprice;
	private String img;
	
	public Food(){}
	public Food(int id, String foodName, int remainFood, double price, double mprice) {
		this.id = id;
		this.foodName = foodName;
		this.remainFood = remainFood;
		this.price = price;
		this.mprice = mprice;
	}

	public Food(String foodName, int remainFood, double price, double mprice, String img) {
		this.foodName = foodName;
		this.remainFood = remainFood;
		this.price = price;
		this.mprice = mprice;
		this.img = img;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getRemainFood() {
		return remainFood;
	}

	public void setRemainFood(int remainFood) {
		this.remainFood = remainFood;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getMprice() {
		return mprice;
	}

	public void setMprice(double mprice) {
		this.mprice = mprice;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}

