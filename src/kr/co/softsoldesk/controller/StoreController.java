package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.ReviewContentBean;
import kr.co.softsoldesk.beans.ReviewPageBean;
import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.service.CartService;
import kr.co.softsoldesk.service.MenuService;
import kr.co.softsoldesk.service.ReviewService;
import kr.co.softsoldesk.service.StoreService;

@Controller
@RequestMapping("/shop")
public class StoreController {

	@Autowired
	// ShopService shopService;
	StoreService marketService;
	@Autowired
	MenuService menuService;
	@Autowired
	ReviewService reviewService;
	
	@Resource(name="loginCustBean")
	private CustomerBean loginCustBean;
	
	@Autowired
	CartService cartService;
	

	
	@Resource(name = "currentStore")
	private StoreBean currentStore;

	@GetMapping("/main")
	public String main(@ModelAttribute("searchMarketBean") StoreBean searchMarketBean, Model model) {
		// 랜딩페이지에서 검색키워드 받기
		String keyword = searchMarketBean.getSearchKeyword();
		//랜딩페이지에서 검색한 키워드가 있으면
		if (!keyword.isEmpty()) {
			// 이름으로 찾기
			List<StoreBean> marketInfosByName = marketService.getStoreInfoByName(keyword);
			if (marketInfosByName.size() != 0) {
				//System.out.println("이름으로 검색: " +keyword);
				for (StoreBean market : marketInfosByName) {
					//System.out.println("검색한 휴게소 이름: " + market.getStore_name());
				}
				//검색한 키워드 띄우기
				model.addAttribute("keyword_name", keyword);
				return "shop/main";
			} else {
				// 노선으로 찾기
				List<StoreBean> marketInfosByHighrail = marketService.getStoreInfoByHighway(keyword);
				if (marketInfosByHighrail.size() != 0) {
					//System.out.println("노선으로 검색: " +keyword);
					for (StoreBean market : marketInfosByHighrail) {
						//System.out.println("검색한 휴게소 이름: " + market.getStore_name());
					}
		
					return "shop/main";
				}
			}
		} else {
			//랜딩페이지에서 검색한 키워드가 없으면
			//System.out.println("검색한 키워드가 없어요 :( ");
			model.addAttribute("keyword_name", "휴게소 또는 노선명을 입력하세요.");
		}
		return "shop/main";
	}

	@GetMapping("/proc")
	public String proc(@ModelAttribute("searchMarketBean") StoreBean searchMarketBean, Model model) {
		// 검색키워드 받기
		String keyword = searchMarketBean.getSearchKeyword();

				
		System.out.println("검색한 키워드: "+ keyword);
		List<StoreBean> marketInfos = marketService.getStoreInfoByName("안성휴게소(부산방향)");
		marketInfos.add(marketService.getOneStoreInfoByName("서울만남의광장(부산방향)"));
		model.addAttribute("marketInfos",  marketInfos);
		model.addAttribute("keyword_name", keyword);
		
		
//		//랜딩페이지에서 검색한 키워드가 있으면
//		if (!keyword.isEmpty()) {
//			if (marketInfos.size() != 0) {

//				model.addAttribute("marketInfos", marketInfos);
//				
//				return "shop/main";
//			} 
//		}

//	
		
		return "shop/main"; // 추후에 만들기
	}

	@GetMapping("/ea")
	public String ea(@RequestParam("market_name") String market_name,
			@RequestParam(value="tabID", defaultValue = "1") int tabID,
			@RequestParam(value="page", defaultValue = "1") int page,
			Model model) {

		//로그인이 되어 있으면, 
				if(loginCustBean.isCust_login()==true) {
					//세션에 스토어빈 이름 등록
					currentStore.setStore_name(market_name);

				}
		
		// 클릭한 휴게소
		String marketName = market_name;
		model.addAttribute("market_name", marketName);
		model.addAttribute("cust_id", loginCustBean.getCust_id());
		//현재탭
		int tab_ID = tabID;
		model.addAttribute("tabID", tab_ID);
		
		System.out.println("클릭한 휴게소 -> 상세정보로 이동: " + marketName);
		
		//=========== shop_header 상단 휴게소 정보 부분 ============
		// 휴게소정보
		StoreBean oneMarketInfo = marketService.getOneStoreInfoByName(marketName);
		model.addAttribute("oneMarketInfo", oneMarketInfo);
		//System.out.println("클릭한 휴게소 이름:" + oneMarketInfo.getStore_name());
	
		//=========== ea_menu 메뉴 페이지 부분 ============
		// 베스트메뉴
		List<MenuBean> bestMenuList = menuService.getBestMenues(marketName);
		for (MenuBean bestMenu : bestMenuList) {
			bestMenu.setCategory_name("인기메뉴");
			//System.out.println("베스트 메뉴: " + bestMenu.getMenu_name());
			//System.out.println("메뉴 이미지명: " + bestMenu.getMenu_img());
		}

		// 한식메뉴
		List<MenuBean> koreanMenuList = menuService.getKoreanMenues(marketName);
		for (MenuBean koreanMenu : koreanMenuList) {
			koreanMenu.setCategory_name("한식메뉴");
			//System.out.println(koreanMenu.getCategory_name()+": " + koreanMenu.getMenu_name());
		}
		
		// 양식메뉴
		List<MenuBean> westernMenuList = menuService.getWesternMenues(marketName);
		for (MenuBean westernMenu : westernMenuList) {
			westernMenu.setCategory_name("양식메뉴");
			//System.out.println(westernMenu.getCategory_name() +" : " + westernMenu.getMenu_name());
		}
		
		// 중식메뉴
		List<MenuBean> chineseMenuList = menuService.getChineseMenues(marketName);
		for (MenuBean chineseMenu : chineseMenuList) {
			chineseMenu.setCategory_name("중식메뉴");
			//System.out.println(chineseMenu.getCategory_name() +" : " + chineseMenu.getMenu_name());
		}
		
		// 신메뉴
		List<MenuBean> newMenuList = menuService.getNewMenues(marketName);
		for (MenuBean NewMenu : newMenuList) {
			NewMenu.setCategory_name("신메뉴");
			//System.out.println(NewMenu.getCategory_name() +" : " + NewMenu.getMenu_name());
		}

		ArrayList<List<MenuBean>> marketMenus = new ArrayList<>();
		if(bestMenuList.size()>0) {
			marketMenus.add(bestMenuList);
		}
		if(koreanMenuList.size()>0) {
			marketMenus.add(koreanMenuList);
		}
		if(westernMenuList.size()>0) {
			marketMenus.add(westernMenuList);
		}
		if(chineseMenuList.size()>0) {
			marketMenus.add(chineseMenuList);
		}
		if(newMenuList.size()>0) {
			marketMenus.add(newMenuList);
		}		
		
		model.addAttribute("marketMenus", marketMenus);
		for(List<MenuBean> bean: marketMenus) {
			String categoryName =bean.get(0).getCategory_name();
			//System.out.println("카테고리 명: "+categoryName);
//			for(MenuBean menu : bean) {
//				System.out.println("카테고리 네임!! : "+menu.getCategory_name());
//				
//			}
		}
		
		//=========== 리뷰 페이지 부분 ============
		//해당 휴게소 store_id 
		int store_id=oneMarketInfo.getStore_id();
		int reviewCount = marketService.getReviewCount(store_id);
		System.out.println(store_id +"스토어 번호");
		model.addAttribute("reviewCount", reviewCount);
//		System.out.println("store_id: "+store_id);

		//해당 휴게소 리뷰 컨텐츠  
		List<ReviewContentBean> storedReviewList =reviewService.getAllReviews(store_id, page);
		model.addAttribute("storedReviewList",storedReviewList);

		//리뷰 총갯수 
		ReviewPageBean pageBean =reviewService.getReviewCnt(store_id, page);
		model.addAttribute("pageBean", pageBean);

//		System.out.println("bean에 찍힌 이전페이지: "+ pageBean.getPrePage());
//		System.out.println("bean에 찍힌 현재페이지: "+ pageBean.getCurrentPage());
//		System.out.println("bean에 찍힌 min: "+ pageBean.getMin());
//		System.out.println("bean에 찍힌 max: "+ pageBean.getMax());

		return "shop/ea";
	}
	
//	@GetMapping("ea/menu/cart")
//	public String addToCart(@RequestParam("menu_name") String menu_name,
//							@RequestParam("menu_price") int menu_price,
//							Model model){
//		
//		MenuBean tempMenuItem = new MenuBean();
//		tempMenuItem.setMenu_name(menu_name);
//		tempMenuItem.setMenu_price(menu_price);
//		model.addAttribute("tempMenuItem", tempMenuItem);
//		return "shop/ea";
//	}
	
	//주문표 내용 때려박기
	@ResponseBody
	@RequestMapping(value = "/cart", method = {RequestMethod.GET, RequestMethod.POST})
	public String addMenuList(@RequestParam Map<String, Object> menu) {
		
		
		String menu_name = (String)menu.get("menu_name");
		int menu_price = Integer.parseInt((String)menu.get("menu_price"));
		int menu_count = Integer.parseInt((String)menu.get("menu_count"));
		int store_id = Integer.parseInt((String)menu.get("stord_id"));
		
		System.out.println(menu_name);
		System.out.println(menu_price);
		System.out.println(menu_count);
		
		MyCartBean cartBean = new MyCartBean();
		
		//스토어 아이디까지 넘어간다
		cartBean.setMenu_name(menu_name);
		cartBean.setMenu_price(menu_price);
		cartBean.setMenu_count(menu_count);
		cartBean.setStore_id(store_id);
		
		
		cartService.insertCart(cartBean);
		
	
		
		return "success";
		//return "Customer/test";
	}
	
	
}
