package com.myworld.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myworld.spring.service.UserService;
import com.myworld.spring.DTO.UserDTO;
import com.myworld.spring.DTO.paperDTO;
import com.myworld.spring.service.BoardService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userSv;
	
	@Autowired
	private BoardService boardSv;
	
	//로그인 화면
	@GetMapping("/login")
	public ModelAndView index(RedirectAttributes redirect) {
		System.out.println("index() controller들어옴...");
		ModelAndView mv = new ModelAndView("user/login");
		if(redirect.getAttribute("msg") !=null) {
			mv.addObject("msg", redirect.getAttribute("msg"));
		}
		
		return mv;
	}
	
	//로그인 검사
	@PostMapping("/login")
	public String login(UserDTO user, RedirectAttributes redirect, HttpServletRequest request) {
		System.out.println("login() controller들어옴...");
		UserDTO result = this.userSv.checkUser(user);	//로그인 검사 결과
		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", result);	//사용자 정보 세션으로 넘김
			return "redirect:bbs";
		}
		else {
			redirect.addFlashAttribute("msg", "로그인 실패");
			return "redirect:login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("logout() controller들어옴...");
		HttpSession session = request.getSession();
		session.invalidate(); 	//세션 삭제
		redirect.addFlashAttribute("msg", "로그아웃 되었습니다.");
		System.out.println(redirect.getAttribute("msg"));
		return "redirect:/login";
		
	}
	
	//회원가입 초기 화면
	@GetMapping("/signUp")
	public ModelAndView signUp() {
		System.out.println("signUp() controller들어옴...");
		return new ModelAndView("user/signUp");
	}
	
	//회원가입 요청
	@PostMapping("/signUp")
	public String createUser(@RequestParam Map<String, Object> map, RedirectAttributes redirect) {
		System.out.println("createUser() controller들어옴...");
		String id = this.userSv.createUser(map); //유저의 고유 번호 리턴 받음
		if(id !=null)
		{	
			System.out.println("redirect 요청중...");
			redirect.addFlashAttribute("msg", "회원가입 완료! 다시 로그인해주세요.");
			return "redirect:/login";
		}
		else {
			redirect.addFlashAttribute("msg", "회원가입 실패! 다시 가입해주세요.");
			return "redirect:/login";
		}
			
	}
	
	@GetMapping("/main")
	public ModelAndView showMain(@RequestParam String id) {
		System.out.println("showMain() controller들어옴...");
		return new ModelAndView("board/main").addObject("Userid", id);
	}
	
	@GetMapping("/bbs")
	public ModelAndView showList(RedirectAttributes redirect, HttpServletRequest request) {
		System.out.println("showList() controller들어옴...");
		List<Map<String, Object>> list = this.boardSv.showAllArticle();
		System.out.println(list);
		ModelAndView mv = new ModelAndView("board/list");
		mv.addObject("data", list);
		
		//로그인 세션 처리
		HttpSession session = request.getSession();
		UserDTO loginedUser = (UserDTO) session.getAttribute("userInfo");
		mv.addObject("UserInfo", loginedUser);	//로그인 정보 넘김
		if(redirect.getAttribute("msg") !=null) {
			mv.addObject("msg", redirect.getAttribute("msg"));
		}
		
		return mv;
		
	}
	
	@GetMapping("/bbs/{board_id}")
	public ModelAndView detail(@PathVariable int board_id){
		System.out.println("detail() controller들어옴...");
		paperDTO p = this.boardSv.showDetail(board_id);	//글 상세 정보 받음
		ModelAndView mv = new ModelAndView("board/detail");
		mv.addObject("data",p);
		
		return mv;
	}
	
	//글쓰기 버튼 눌렀을 때
	@GetMapping("/write")
	public ModelAndView write(RedirectAttributes redirect) {
		
		ModelAndView mv = new ModelAndView("board/write");
		if(redirect.getAttribute("msg") !=null) {
			mv.addObject("msg", redirect.getAttribute("msg"));
		}
		return mv;
	}
	//글 등록 버튼 눌렀을 때
	@PostMapping("/write")
	public String write(paperDTO paper, RedirectAttributes redirect, HttpServletRequest request) {
		System.out.println("write 컨트롤러 들어옴....");
		HttpSession session = request.getSession();
		UserDTO loginedUser = (UserDTO)session.getAttribute("userInfo");
		String writerNumber = boardSv.insert_paper(paper, loginedUser);
		if(writerNumber != null) {	//올바르게 들어오면
			redirect.addFlashAttribute("msg", "정상적으로 글이 등록되었습니다.");
			return "redirect:/bbs";
		}
		else {
			redirect.addFlashAttribute("msg", "다시 시도해주세요.");
			return "redirect:/write";
		}
			
		
	}
	
	//게시글 삭제
	@PostMapping("/delete/{board_id}")
	public String delete_paper(@PathVariable int board_id, RedirectAttributes redirect) {
		boolean success = this.boardSv.delete_paper(board_id);
		if(success) {
			redirect.addFlashAttribute("msg", "정상적으로 글이 삭제 되었습니다.");
			return "redirect:/bbs";
		}
		else {
			redirect.addFlashAttribute("msg", "삭제 실패 ! 다시 시도해주세요");
			return "redirect:/bbs";
		}
	}
	
	@PostMapping("/put")
	public String update_paper(paperDTO paper, RedirectAttributes redirect) {
		boolean success = this.boardSv.update_paper(paper);
		if(success) {
			redirect.addFlashAttribute("msg", "정상적으로 글이 수정 되었습니다.");
			return "redirect:/detail/{}";
		}
		else {
			redirect.addFlashAttribute("msg", "수정 실패 ... 다시 시도해주세요 ㅠㅠ");
			return "redirect:/put/{paper.}";
		}
	}
		
	
	

}
