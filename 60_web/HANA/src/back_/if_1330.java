package back_;

import java.util.HashMap;
import java.util.Map;

public class if_1330 {
	
//	Map<Integer, Coffee> map = new HashMap<>();
//	
//	{
//		map.put(1, new Coffee("아메리카노", 3000));
//		map.put(2, new Coffee("카페모카", 2500));
//		
//	}
	
	Map<Integer, Coffee> map = getMenu();
	
	
	private Map<Integer, Coffee> getMenu() {
		Map<Integer, Coffee> map = new HashMap<>();
		map.put(1, new Coffee("아메리카노", 3000));
		map.put(2, new Coffee("카페모카", 2500));
		return map;
	}
	
	
	

	public static void main(String[] args) {
				
		
		
		
		int number = 1;
		
//		Coffee coffee = map.get(number);
//		
//		System.out.println(coffee.name);
//		System.out.println(coffee.price);
	}
}

class Coffee {
	String name;
	int price;
	
	public Coffee(String name, int price) {
		this.name = name;
		this.price = price;
	}
}
// 1번 : 아메리카노, 3000
// 2번 : 카페모카, 2500