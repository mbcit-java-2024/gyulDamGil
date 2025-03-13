package com.gdg.gyulDamGil.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdg.gyulDamGil.dao.ConsumerDAO;
import com.gdg.gyulDamGil.dao.SellerDAO;
import com.gdg.gyulDamGil.vo.ConsumerVO;
import com.gdg.gyulDamGil.vo.SellerVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController_2 {

	@Autowired
	private ConsumerDAO consumerDao;
	
	@Autowired
	private SellerDAO sellerDao;
	
//	========== <로그인/로그아웃> =============
	
//	로그인 요청을 받아서 userType에 따라 로그인 페이지로 보내준다.
	@RequestMapping("/login/{i}")
	public String login(@PathVariable int i) {
		log.info("LoginController 컨트롤러의 login() 메소드 실행");
		String viewpage ="";
		if (i == 1) {
			viewpage = "/consumer/login_2";
		}else if (i == 2) {
			viewpage = "/seller/login_2";
		}
		return viewpage;
	}
	
//	user = consumer 혹은 seller
//	login : 로그인 시도 페이지의 '로그인'버튼을 누르면 입력된 userType 과 id와 password를 비교해서 로그인 완료/실패 여부를 판단하고
//	로그인 성공시: 로그인 완료 후 로그인 전까지 보던 페이지 (previous)정보와 userVO 정보를 가지고 userLogin controller요청
//	로그인 실패시: 실패 이유와 함께 로그인 시도 페이지로 되돌아간다.
	@PostMapping("/loginCheck/{i}")
	public String loginCheck(@PathVariable int i, HttpServletRequest request, Model model, RedirectAttributes attributes) {
		log.info("LoginController 컨트롤러의 loginCheck() 메소드 실행");
		log.info("userId: " + request.getParameter("userId"));
		log.info("password: " + request.getParameter("password"));
		log.info("user: " + i);
		String uid = request.getParameter("userId");
		String pw = request.getParameter("password");
		String result;
		if (i == 1) {
			int check = consumerDao.selectCountByUserId(uid);
			log.info("userCheck: "+ check);
			ConsumerVO cvo = consumerDao.selectByUserId(uid);
			if (check == 1 && cvo.getPassword().equals(pw)) {
//			로그인 성공
				attributes.addAttribute("consumerId", cvo.getId());
				attributes.addAttribute("previous", "redirect:/");
				result = "redirect:/consumerLogin";
			} else if (check == 1 && !cvo.getPassword().equals(pw)) {
//			로그인 실패: 비밀번호 불일치
				model.addAttribute("result", 1);
				model.addAttribute("id", request.getParameter("userId"));
				result = "/consumer/login_2";
				log.info("result: 1");
			} else {
//			로그인 실패: 계정 비존재
				model.addAttribute("result", 0);
				result = "/consumer/login_2";
				log.info("result: 0");
			}
		} else if (i == 2) {
			int check = sellerDao.selectCountByUserId(uid);
			log.info("userCheck: "+ check);
			SellerVO svo = sellerDao.selectByUserId(uid);
			if (check == 1 && svo.getPassword().equals(pw)) {
				log.info("svo: "+ svo);
				attributes.addAttribute("sellerId", svo.getId());
				attributes.addAttribute("previous", "redirect:/");
				log.info("여기까지 넘어옴");
				result = "redirect:/sellerLogin";
			} else if (check == 1 && !svo.getPassword().equals(pw)) {
				model.addAttribute("result", 1);
				result = "/seller/login_2";
			} else {
				model.addAttribute("result", 0);
				result = "/seller/login_2";
			}
		} else {
			result ="redirect:/login/"+i;
		}
		
		return result;
	}

//	consumer login : 로그인 완료된 
	@RequestMapping("/consumerLogin")
	public String consumerLogin(@RequestParam("consumerId")int cid, 
			@RequestParam("previous")String previous, HttpServletRequest request) {
		log.info("LoginController 컨트롤러의 consumerLogin() 메소드 실행");
		log.info("consumerId: "+ cid);
		ConsumerVO vo = consumerDao.selectById(cid);
		HttpSession session = request.getSession();
		session.setAttribute("id", vo.getId());
		session.setAttribute("userVO", vo);
		session.setAttribute("userType", 1);
		session.setMaxInactiveInterval(1800);
		
		return previous;
	}
	
//	seller login
	@RequestMapping("/sellerLogin")
	public String sellerLogin(@RequestParam("sellerId")int sid, 
			@RequestParam("previous")String previous,HttpServletRequest request) {
		log.info("LoginController 컨트롤러의 consumerLogin() 메소드 실행");
		log.info("sellerId: "+ sid);
		SellerVO vo = sellerDao.selectById(sid);
		HttpSession session = request.getSession();
		session.setAttribute("id", vo.getId());
		session.setAttribute("userVO", vo);
		session.setAttribute("userType", 2);
		session.setMaxInactiveInterval(1800);
		
		return previous;
	}	
		
//	logout
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
//	========== <회원가입> ===========
	@RequestMapping("/signIn/{i}")
	public String signIn(@PathVariable int i) {
		log.info("LoginController 컨트롤러의 signIn() 메소드 실행");
		String viewpage ="";
		if (i == 1) {
			viewpage = "/consumer/signIn_2";
		}else if (i == 2) {
			viewpage = "/seller/signIn_2";
		}
		return viewpage;
	}

//	conumser 회원가입
	@PostMapping("/consumerSignIn")
	public String consumerSignIn(ConsumerVO consumerVO) {
		log.info("LoginController 컨트롤러의 consumerSignIn() 메소드 실행");
		ConsumerVO vo = consumerVO;
		log.info("구매자 회원 1건 저장: " + vo);
		consumerDao.insert(vo);
		
		return "/consumer/signInOK_2";
	}

//	seller 회원가입
	@PostMapping("/sellerSignIn")
	public String sellerSignIn(SellerVO sellerVO) {
		log.info("LoginController 컨트롤러의 sellerSignIn() 메소드 실행");
		SellerVO vo = sellerVO;
		log.info("판매자 회원 1건 저장: " + vo);
		sellerDao.insert(vo);
		
		return "/seller/signInOK_2";
	}
	
//	userId 중복검사
	@PostMapping("/idCheck/{i}")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userid, @PathVariable int i) {
		log.info("LoginController 컨트롤러의 idCheck() 메소드 실행");
		log.info("userid: " + userid);
		List<String> ids;
		if (i == 1) {
			ids = consumerDao.getUserIds();
		}else {
			ids = sellerDao.getUserIds();
		}
		int result = 0;
	    if (ids.indexOf(userid) >= 0) {
	    	result = 1;
	    } else {
	    }
		return result;
	}
	
//	farmName 중복검사
	@PostMapping("/farmNameCheck")
	@ResponseBody
	public int farmNameCheck(@RequestParam("farmName") String farmName) {
		log.info("LoginController 컨트롤러의 farmNameCheck() 메소드 실행");
		log.info("farmName: " + farmName);
		List<String> farmNames = sellerDao.getFarmNames();
		int result = 0;
		if (farmNames.indexOf(farmName) >= 0) {
			result = 1;
		} else {
		}
		return result;
	}
	
//	=========== <개인정보 수정 및 삭제> =============
//	개인정보 보기
	@RequestMapping("/myInfo")
	public String myInfo(HttpServletRequest request) {
		log.info("LoginController 컨트롤러의 myInfo() 메소드");
		HttpSession session = request.getSession(false);
		String result="";
		if (session != null) {
			int userType = (int) session.getAttribute("userType");
			if (userType == 1) {
				result = "/consumer/myInfo_2";
			}else if (userType ==2){
				result = "/seller/myInfo_2";
			}else {
			}
		}else {
			result = "redirect:/login/1";
		}
		return result;
	}
	
//	개인정보 수정
	@RequestMapping("/updateInfo")
	public String updateInfo(HttpServletRequest request) {
		log.info("LoginController 컨트롤러의 updateInfo() 메소드");
		HttpSession session = request.getSession(false);
		String result="";
		if (session != null) {
			int userType = (int) session.getAttribute("userType");
			if (userType == 1) {
				result = "/consumer/update_2";
			}else if (userType ==2){
				result = "/seller/update_2";
			}else {
				result = "redirect:/login/1";
			}
		} else {
			result = "redirect:/login/1";
		}
		return result;
	}
	
//	consumer 개인정보 수정
	@PostMapping("/updateOK_/1")
	public String updateOK1(HttpServletRequest request, ConsumerVO consumerVO, RedirectAttributes attributes) {
		log.info("LoginController 컨트롤러의 updateOK1() 메소드");
		HttpSession session = request.getSession(false);
		String result="";
		if (session != null) {
			ConsumerVO vo = consumerVO;
			consumerDao.update(vo);
			attributes.addAttribute("consumerId", vo.getId());
			attributes.addAttribute("previous", "/consumer/myInfo_2");
			result = "redirect:/consumerLogin";
		}else {
			result = "redirect:/login/1";
		}
		return result;
	}
	
//	seller 개인정보 수정
	@PostMapping("/updateOK_/2")
	public String updateOK2(HttpServletRequest request, SellerVO sellerVO, RedirectAttributes attributes) {
		log.info("LoginController 컨트롤러의 updateOK2() 메소드");
		HttpSession session = request.getSession(false);
		String result="";
		if (session != null) {
			SellerVO vo = sellerVO;
			sellerDao.update(vo);
			attributes.addAttribute("sellerId", vo.getId());
			attributes.addAttribute("previous", "/seller/myInfo_2");
			result = "redirect:/sellerLogin";
		}else {
			result = "redirect:/login/2";
		}
		return result;
	}
	
// 개인정보 삭제
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		log.info("LoginController 컨트롤러의 delete() 메소드");
		HttpSession session = request.getSession(false);
		String result="";
		if (session != null) {
			int userType = (int) session.getAttribute("userType");
			int id = (int) session.getAttribute("id");
			if (userType == 1) {
				consumerDao.delete(id);
				result = "redirect:/logout";
			}else if (userType == 2) {
				sellerDao.delete(id);
				result = "redirect:/logout";
			}
		}else {
			result = "redirect:/login/1";
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
