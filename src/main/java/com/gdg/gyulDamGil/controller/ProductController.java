package com.gdg.gyulDamGil.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.origin.SystemEnvironmentOrigin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gdg.gyulDamGil.dao.BookmarkDAO;
import com.gdg.gyulDamGil.dao.ProductDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.service.CartService;
import com.gdg.gyulDamGil.service.OrderService;
import com.gdg.gyulDamGil.vo.BookmarkVO;
import com.gdg.gyulDamGil.vo.CartVO;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.OrderList;
import com.gdg.gyulDamGil.vo.OrderVO;
import com.gdg.gyulDamGil.vo.ProductList;
import com.gdg.gyulDamGil.vo.ProductVO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private SellerDAO sellerDAO;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private BookmarkDAO bookmarkDAO;

	@GetMapping("/jejugamgyulList/{categoryId}")
	public String jejugamgyulList(Model model, @PathVariable("categoryId") int categoryId
			, HttpServletRequest request) {
		System.out.println("ProductController의 jejugamgyul메소드 실행");
		
		List<ProductVO> selectJejuGamgyulList = productDAO.selectJejuGamgyulList(categoryId);

		for (ProductVO vo : selectJejuGamgyulList) {

//			이미지 경로 변환
			File file = new File(productDAO.selectById(vo.getId()).getMainImageUrl());
			String fileName = file.getName(); // 파일명만 추출
			String relativePath = "/upload/" + fileName;
			log.info("이미지 상대 경로: " + relativePath);
			vo.setMainImageUrl(relativePath);
		}

		model.addAttribute("selectJejuGamgyulList", selectJejuGamgyulList);
		model.addAttribute("categoryId", categoryId);
		System.out.println(selectJejuGamgyulList);

		return "product/jejugamgyulList";
	}

	@GetMapping("/jejugamgyulDetail/{id}")
	public String jejugamgyulDetail(Model model, @PathVariable("id")  int id, HttpServletRequest req) {
		System.out.println("ProductController의 jejugamgyulDetail메소드 실행");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		HttpSession session = req.getSession(false);
		// System.out.println("ProductController의 jejugamgyulDetail메소드 실행::::::" + session);
		if (null != session   && null != session.getAttribute("id")) { 
			int consumerId = (int) session.getAttribute("id"); // 구매자의 아이디
			param.put("consumerId", consumerId);
		}
		ProductVO selectGamgyulDetail = productDAO.selectGamgyulDetail(param);
		//		이미지 경로 변환
		File file = new File(productDAO.selectById(id).getMainImageUrl());
		String fileName = file.getName(); // 파일명만 추출
		String relativePath = "/upload/" + fileName;
		log.info("이미지 상대 경로: "+ relativePath);
		selectGamgyulDetail.setMainImageUrl(relativePath);
		
		model.addAttribute("selectGamgyulDetail", selectGamgyulDetail); 

		
		return "product/jejugamgyulDetail";
	}

	@GetMapping("/farmDetail/{sellerId}")
	public String farmDetail(Model model, @PathVariable("sellerId") int sellerId, HttpServletRequest req) {
		System.out.println("ProductController의 farmDetail메소드 실행:::: sellerId" + sellerId);

		BookmarkVO bookmarkVO = new BookmarkVO();

//		HttpSession session = req.getSession(false);
//		if (session != null && (int) session.getAttribute("userType") == 1) { 
//			int consumerId = (int) session.getAttribute("id"); // 구매자의 아이디
//			bookmarkVO.setConsumerId(consumerId);
//		}
		
//		int consumerId = 0;
//		try {
//			bookmarkVO = new BookmarkVO();
//			consumerId = (int) req.getSession().getAttribute("id");
//			bookmarkVO.setConsumerId(consumerId);
//		} catch (Exception e) {
//			return "/consumer/login_2";
//		}
		
		SellerVO selectFarmDetail = sellerDAO.selectFarmDetail(sellerId);
		model.addAttribute("selectFarmDetail", selectFarmDetail);

		return "product/farmDetail";
	}

	@GetMapping("/bookmark")
	public String favorites(Model model, HttpServletRequest req) {
		System.out.println("ProductController의 favorites메소드 실행");
		BookmarkVO bookmarkVO = null;
		int consumerId = 0;
		try {
			bookmarkVO = new BookmarkVO();
			consumerId = (int) req.getSession().getAttribute("id");
			bookmarkVO.setConsumerId(consumerId);
			List<BookmarkVO> selectBookMarkList = bookmarkDAO.selectBookMarkList(bookmarkVO);
			model.addAttribute("selectBookMarkList", selectBookMarkList);
		} catch (Exception e) {
			return "/consumer/login_2";
		}

		// TODO 세션에서 추출할것!!

		return "bookmark/bookmark";
	}
	
	@GetMapping("/bookMarkProductDelete/{id}")
	public String bookMarkProductDelete( @PathVariable("id") int id, Model model, HttpServletRequest req) {
		System.out.println("ProductController클래스의 bookMarkProductDelete메소드 실행:::::id::::" + id);
		BookmarkVO bookmarkVO = null;
		int consumerId = 0;
		Map<String, Object> param = new HashMap<String, Object>();
		try {
			bookmarkVO = new BookmarkVO();
			consumerId = (int) req.getSession().getAttribute("id");
			param.put("consumerId", consumerId); 
		} catch (Exception e) {
			return "/consumer/login_2";
		}
		
		param.put("id", id);
		bookmarkDAO.bookMarkProductDelete(param); 
		
		
		return "redirect:/bookmark";
	}
	
	
	@GetMapping("/bookMarkFarmDelete/{sellerId}")
	public String bookMarkFarmDelete( @PathVariable("sellerId") int sellerId, Model model, HttpServletRequest req) {
		System.out.println("ProductController클래스의 bookMarkFarmDelete메소드 실행:::::sellerId::::" + sellerId);
		BookmarkVO bookmarkVO = null;
		int consumerId = 0;
		Map<String, Object> param = new HashMap<String, Object>();
		try {
			bookmarkVO = new BookmarkVO();
			consumerId = (int) req.getSession().getAttribute("id");
			param.put("consumerId", consumerId);
		} catch (Exception e) {
			return "/consumer/login_2";
		}
		param.put("sellerId", sellerId);
		bookmarkDAO.bookMarkFarmDelete(param); 
		
		return "redirect:/bookmark";
	}

	@GetMapping("/cartPage")
	public String cartList(Model model, HttpServletRequest req) {
		System.out.println("ProductController의 cartList메소드 실행");
		
		CartVO cartVO = null;
		int consumerId = 0;
		
		try {
			cartVO = new CartVO();
			consumerId = (int) req.getSession().getAttribute("id");
			cartVO.setConsumerId(consumerId);
		} catch (Exception e) {
			return "/consumer/login_2";
		}
		
		ProductVO productVO = new ProductVO();
		List<ProductVO> selectImg = productDAO.selectImg(productVO); 
		model.addAttribute("selectImg", selectImg);
		
		List<CartVO> selectcartList = cartService.selectcartList(cartVO);
		model.addAttribute("selectcartList", selectcartList);

		return "cart/cartPage";
	}
	
//	CartVO param = new CartVO();
//	HttpSession session = req.getSession(false);
//	if (null != session   && null != session.getAttribute("id")) {
//		int consumerId = (int) session.getAttribute("id");
//		param.setConsumerId(consumerId);
//	} 

	@PostMapping("/orderPage")
	public String orderPage(@RequestParam String cartIds, Model model, HttpServletRequest request) {
		System.out.println("ProductController의 orderPage메소드 실행");

		System.out.println("orderPage:::::cartIds::::::::" + cartIds);
		log.info("userType: " + request.getAttribute("userType"));
		log.info("userId: " + request.getAttribute("id"));
		String result = "/";

//		로그인 여부 확인
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("userType") != null) {
			int userType = (int) session.getAttribute("userType");

//			구매자 로그인이면
			if (userType == 1) {
				int consumerId = (int) session.getAttribute("id");

//		===================== 수빈이가 코딩한 파트 ==========================
//				List<OrderVO> selectOrderList = orderService.selectOrderList(orderVO);
				List<CartVO> selectCartListByIds = cartService.selectCartListByIds(cartIds);

				model.addAttribute("selectCartListByIds", selectCartListByIds);
				System.out.println(selectCartListByIds);
				log.info("selectCartListByIds: {}", selectCartListByIds);

				ConsumerVO consumerVO = new ConsumerVO();
				
				
				session = request.getSession(false);
				if (session != null && (int) session.getAttribute("userType") == 1) {
					consumerId = (int) session.getAttribute("id");
					consumerVO.setId(consumerId);
				}

				ConsumerVO info = cartService.selectConsumerList(consumerVO.getId());
				model.addAttribute("Consumerinfo", info);
				log.info("Consumerinfo: {}", info);

				model.addAttribute("cartIds", cartIds);

				result = "order/orderPage"; // return 을 result String 안에 넣음
//		===================== 수빈이가 코딩한 파트 ==========================

//			판매자 로그인이면 -> 결제를 막아야하지 않나?
			} else if (userType == 2) {
				int sellerId = (int) session.getAttribute("id");
				result = "/"; // 홈으로 돌려보낸다.
			}

//		로그인이 안되었다면 로그인 페이지로 보낸다.
		} else {
			result = "/consumer/login_2";
		}
		return result;
	}

	@PostMapping("/detailToOrderPage")
	public String detailToOrderPage(@RequestParam Map<String, Object> param, Model model, HttpServletRequest request) {
		System.out.println("ProductController의 detailToOrderPage메소드 실행");

		
		log.info("userType: " + request.getAttribute("userType"));
		log.info("userId: " + request.getAttribute("id"));
		String result = "/";
//		로그인 여부 확인
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("userType") != null) {
			int userType = (int) session.getAttribute("userType");
//			구매자 로그인이면
			if (userType == 1) {
				int consumerId = (int) session.getAttribute("id");

//		===================== 수빈이가 코딩한 파트 ==========================
				// System.out.println("detailToOrderPage:::::id::::::::" + id);
				System.out.println("detailToOrderPage:::::param::::::::" + param);
				System.out.println("detailToOrderPage:::::count::::::::" + param.get("count"));

				model.addAttribute("productVO", param);
				param.put("title", param.get("title"));
				System.out.println(param.put("title", param.get("title")));

				model.addAttribute("productVO", param);

				ConsumerVO consumerVO = new ConsumerVO();
				
				
				session = request.getSession(false);
				if (session != null && (int) session.getAttribute("userType") == 1) {
					consumerId = (int) session.getAttribute("id");
					consumerVO.setId(consumerId);
				}
				
				
				
				ConsumerVO info = cartService.selectConsumerList(consumerVO.getId());
				model.addAttribute("Consumerinfo", info);

				result = "order/detailToOrder"; // return 을 result String 안에 넣음
//		===================== 수빈이가 코딩한 파트 ==========================

//			판매자 로그인이면 -> 결제를 막아야하지 않나?
			} else if (userType == 2) {
				int sellerId = (int) session.getAttribute("id");
				result = "redirect:/"; // 홈으로 돌려보낸다.
			}

//		로그인이 안되었다면 로그인 페이지로 보낸다.
		} else {
			result = "/consumer/login_2";
		}

		return result;
	}

	@GetMapping("/orderOKPage")
	public String orderOKPage(Model model, @RequestParam String orderIds, 
			@RequestParam Map<String, Object> param, HttpServletRequest req) { 
		System.out.println("ProductController의 orderOKPage메소드 실행");

		
		List<OrderVO> orderOK = orderService.selectOrderList(orderIds);
		System.out.println("orderOK: " + orderOK);
		model.addAttribute("orderOK", orderOK);

//		model.addAttribute("orderOK1", param);

		ConsumerVO consumerVO = new ConsumerVO();
		HttpSession session = req.getSession(false);
		if (session != null && (int) session.getAttribute("userType") == 1) {
			int consumerId = (int) session.getAttribute("id");
			consumerVO.setId(consumerId);
		}
		ConsumerVO info = cartService.selectConsumerList(consumerVO.getId());
		model.addAttribute("Consumerinfo", info);
		log.info("Consumerinfo: {}", info);

		return "order/orderOKPage";
	}

//	============ 예린 : 판매자 입장에서 상품 관리 =====================
//	판매자-내 상품 보기
	@GetMapping("/sellerList")
	public String sellerList(HttpServletRequest request, Model model) {
		log.info("ProductController 클래스의 sellerList() 메소드 실행");
		String result = "/";

//		로그인 여부 확인
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("userType") != null) {
			int userType = (int) session.getAttribute("userType");
			log.info("userType: " + session.getAttribute("userType"));
			
//			로그인 상태인 경우
			if (userType == 2) {
				int sellerId = (int) session.getAttribute("id");
				
//				판매자의 모든 상품 리스트
//				List<ProductVO> productList = productDAO.selectListBySellerId(sellerId);
				
//				페이징 작업
				int pageSize = 10;
				int currentPage;
				int totalCount = productDAO.selectCountBySellerId(sellerId); // 판매자의 판매 상품 총 개수
				
				try {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
					currentPage = (currentPage < 1) ? 1 : currentPage;
					currentPage = (currentPage > totalCount) ? totalCount : currentPage;
				} catch (NumberFormatException e) {
					currentPage = 1;
				}
				
				model.addAttribute("count", productDAO.selectCountBySellerId(sellerId)); // 판매 상품 총 개수
				model.addAttribute("status0", productDAO.selectCountByStatus(sellerId, 0)); // 임시저장 총 개수
				model.addAttribute("status1", productDAO.selectCountByStatus(sellerId, 1)); // 등록완료 총 개수
				
				ProductList productList = new ProductList(pageSize, totalCount, currentPage);
				HashMap<String, Integer> hmap = new HashMap<String, Integer>();
				hmap.put("startNo", productList.getStartNo());
				hmap.put("pageSize", productList.getPageSize());
				hmap.put("sellerId", sellerId);
				// 판매자가 등록한 상품을 페이지 개수만큼 역순으로 불러옴
				productList.setProductListForOnePage((ArrayList<ProductVO>) productDAO.selectPageListBySellerId(hmap));
				
//				product 이미지 경로 변환
				for (ProductVO pvo : productList.getProductListForOnePage()) {
					File file = new File(pvo.getMainImageUrl());
					String fileName = file.getName(); // 파일명만 추출
					String relativePath = "/upload/" + fileName;
					log.info("이미지 상대 경로: " + relativePath);
					pvo.setMainImageUrl(relativePath);
				}
				
				System.out.println(productList.getProductListForOnePage()); // 디비에 있는 주문 목록을 가져옴
				model.addAttribute("productList", productList);
				model.addAttribute("currentPage", currentPage);
				
				result = "/product/sellerList_2";
			}
		} else {
			result = "/seller/login_2";
		}
		return result;
	}
	
	@RequestMapping("/sellerList")
	public String sellerListPage(Model model, HttpServletRequest request) {
		log.info("ProductController 클래스의 sellerListPage() 메소드 실행");
		HttpSession session = request.getSession(false);
		int pageSize = 10;
		int sellerId =(int) session.getAttribute("id");
		int currentPage;
		
		int totalCount = productDAO.selectCountBySellerId(sellerId); // 판매자의 판매 상품 총 개수
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			currentPage = (currentPage < 1) ? 1 : currentPage;
			currentPage = (currentPage > totalCount) ? totalCount : currentPage;
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		
		ProductList productList = new ProductList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", productList.getStartNo());
		hmap.put("pageSize", productList.getPageSize());
		hmap.put("sellerId", sellerId);
		// 판매자가 등록한 상품을 페이지 개수만큼 역순으로 불러옴
		productList.setProductListForOnePage((ArrayList<ProductVO>) productDAO.selectPageListBySellerId(hmap));
		
//		product 이미지 경로 변환
		for (ProductVO pvo : productList.getProductListForOnePage()) {
			File file = new File(pvo.getMainImageUrl());
			String fileName = file.getName(); // 파일명만 추출
			String relativePath = "/upload/" + fileName;
			log.info("이미지 상대 경로: " + relativePath);
			pvo.setMainImageUrl(relativePath);
		}
		
		System.out.println(productList.getProductListForOnePage()); // 디비에 있는 주문 목록을 가져옴
		model.addAttribute("productList", productList);
		model.addAttribute("currentPage", currentPage);
		
		return "/product/sellerList_2";
	}	
	
//	이미지 파일 경로 url로 변환하는 메소드: MultipartFile 객체를 인수로 받아 저장경로(String)을 리턴하는 메소드
	public String imageToUrl(String uploadDir, MultipartFile file) throws IllegalStateException, IOException {
		log.info("uploadDir: " + uploadDir);
		File uploadFolder = new File(uploadDir);
		if (!uploadFolder.exists()) {
			uploadFolder.mkdirs(); // 폴더가 없으면 생성
		}

		// 고유한 파일명 생성 후 저장
		String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
		String filePath = uploadDir + fileName;
		log.info("fileName: " + fileName);
		log.info("filePath: " + filePath);
		file.transferTo(new File(filePath));

		return filePath;
	}

//	판매자-상품등록 
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, Model model) {
		log.info("ProductController 클래스의 insert() 메소드 실행");

//		로그인 여부 확인
		HttpSession session = request.getSession(false);
		if (session != null) {
			model.addAttribute("sellerId", request.getSession(false).getAttribute("sellerId"));
			return "/product/insert_2";
		} else {
			return "/seller/login_2";
		}
	}

//	/product/insert_2.jsp 에서 이미지파일과 productVO 초기화에 필요한 정보를 input 받아 객체를 1건 생성하고 
//	ProductDAO 의 insert() 메소드를 통해 DB의 product 테이블에 저장한다.
	@PostMapping("/insertOK")
	public String insertOK(@RequestParam("mainImage") MultipartFile file, HttpServletRequest request,
			@ModelAttribute ProductVO productVO, Model model) {
		log.info("ProductController 클래스의 insertOK() 메소드 실행");

		if (file.isEmpty()) {

		}

		try {
			// 프로젝트 내부 `upload` 폴더 경로 가져오기
			String filePath = imageToUrl(request.getServletContext().getRealPath("/upload/"), file);

			// ProductVO 객체에 이미지 경로 저장
			ProductVO vo = productVO;
			vo.setMainImageUrl(filePath);

			// 저장상태 저장
			log.info("status: " + vo.getStatus());
			if (vo.getStatus() > 0) {
				vo.setStatus(1);
			}

			// DB 저장
			productDAO.insert(vo);
			log.info("상품 1건 등록: " + vo);

			return "redirect:/sellerList";

		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("fail", "이미지 저장 실패");
			return "/product/insert_2";
		}
	}

//	판매자-상품1건 보기 : show
	@RequestMapping("/show/{id}")
	public String show(@PathVariable int id, Model model) {
		log.info("ProductController 클래스의 show() 메소드 실행");
		log.info("id: " + id);

//		이미지 경로 변환
		File file = new File(productDAO.selectById(id).getMainImageUrl());
		String fileName = file.getName(); // 파일명만 추출
		String relativePath = "/upload/" + fileName;
		log.info("이미지 상대 경로: " + relativePath);

		model.addAttribute("productVO", productDAO.selectById(id));
		model.addAttribute("cid", productDAO.selectById(id).getCategoryId());
		model.addAttribute("mainImageUrl", relativePath);

		return "/product/show_2";
	}

//	판매자-상품1건 수정 : update
	@RequestMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		log.info("ProductController 클래스의 update() 메소드 실행");

//		이미지 경로 변환
		File file = new File(productDAO.selectById(id).getMainImageUrl());
		String fileName = file.getName(); // 파일명만 추출
		String relativePath = "/upload/" + fileName;
		log.info("이미지 상대 경로: " + relativePath);

		model.addAttribute("vo", productDAO.selectById(id));
		model.addAttribute("cid", productDAO.selectById(id).getCategoryId());
		model.addAttribute("mainImageUrl", relativePath);

		return "/product/update_2";
	}

	@RequestMapping("/updateOK")
	public String updateOK(ProductVO productVO, @RequestParam("mainImage") MultipartFile file, 
			HttpServletRequest request, Model model) {
		log.info("ProductController 클래스의 updateOK() 메소드 실행");
		ProductVO vo = productVO;
		
//		if (vo.getMainImageUrl() == null) {
//			vo.setMainImageUrl(productDAO.selectById(vo.getId()).getMainImageUrl());
//		}
		
		if (file.isEmpty()) {

		}

		try {
			// 프로젝트 내부 `upload` 폴더 경로 가져오기
			String filePath = imageToUrl(request.getServletContext().getRealPath("/upload/"), file);

			// ProductVO 객체에 이미지 경로 저장
			vo.setMainImageUrl(filePath);
			log.info("수정된 categoryId: " + vo.getCategoryId());
			log.info("수정된 mainImageUrl: " + vo.getMainImageUrl());
		
			productDAO.update(vo);
			log.info("상품 1건 수정: " + vo);
			return "redirect:/show/" + vo.getId();
			
		}catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("fail", "이미지 저장 실패");
			return "/product/update_2";
		}
	}

//	판매자-상품1건 삭제
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id, HttpServletRequest request) {
		log.info("ProductController 클래스의 delete() 메소드 실행");

		// 이미지 파일 삭제 (upload 폴더에 있는 파일 삭제)
		String absolutePath = productDAO.selectById(id).getMainImageUrl(); // DB에 저장된 절대 경로
		if (absolutePath != null && !absolutePath.isEmpty()) {
			File file = new File(absolutePath);
			if (file.exists()) {
				file.delete(); // 이미지 파일 삭제
			}
		}

		productDAO.delete(id);
		return "redirect:/sellerList";
	}

//	이것은 git 업로드를 기원하며
//	아무말이나 지껄이며 카드찍고 돌아오지않는 너를 기다려~~~~ 
//	(규현목소리) 아무튼 제발제발 hunk야 나와라~~ 나와라요!~~~!!!

}
