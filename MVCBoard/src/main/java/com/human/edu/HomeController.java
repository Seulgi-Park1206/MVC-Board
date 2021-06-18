package com.human.edu;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;	// servlet-context 에서 선언한 SqlSession
	
	@RequestMapping("/")
	public String list(Model model) { // 데이터 화면에 출력
		System.out.println("list");
		// SQL 작성, 실행
		IDao dao = sqlSession.getMapper(IDao.class); // IDao interface + XML
		model.addAttribute("alData",dao.listDao());
		return "list";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value="/logincheck", method=RequestMethod.POST)
	public String logincheck(HttpServletRequest hsr) {
		String mobile = hsr.getParameter("mobile");
		String pass = hsr.getParameter("pwd");
		
		IDaoMember member = sqlSession.getMapper(IDaoMember.class);
		int n = member.checkMember(mobile, pass);
		HttpSession session = hsr.getSession();
		
		if(n==1) {
			// 세션 설정
			session.setAttribute("mobile", mobile);
			return "redirect:/";
		}
		else {
			session.setAttribute("n", n);
			return "redirect:login";
		}
	}
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}
	@RequestMapping(value="/sign", method=RequestMethod.POST)
	public String sign(HttpServletRequest hsr) {
		String name = hsr.getParameter("username");
		String gender = hsr.getParameter("gender");
		String mobile = hsr.getParameter("mobile");
		String passcode = hsr.getParameter("pwd");
		String nick = hsr.getParameter("nick");
		String birth = hsr.getParameter("birthday");
		String interest = Arrays.toString(hsr.getParameterValues("interest"));
		interest = interest.substring(1, interest.length()-1);
		
		HttpSession session = hsr.getSession();
		IDaoMember member = sqlSession.getMapper(IDaoMember.class);
		int n = member.checkMember(mobile, passcode);
		if(n == 0) {
			member.addMember(name, gender, mobile, passcode, nick, birth, interest);
			return "login";
		}else {
			session.setAttribute("n", n);
			return "redirect:signup";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/view/{bId}")
	public String view(@PathVariable int bId, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("rec", dao.viewDao(bId));
		return "view";
	}
	@RequestMapping("/delete/{bId}")
	public String delete(@PathVariable int bId, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.deleteDao(bId);
		return "redirect:/";
	}
	@RequestMapping("/newpost")
	public String newpost() {
		return "write";
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(HttpServletRequest hsr) {
		String name = hsr.getParameter("bName");
		String title = hsr.getParameter("bTitle");
		String content = hsr.getParameter("bContent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.writeDao(name, title, content); 
		return "redirect:/";
	}
	@RequestMapping("/modify/{bId}")
	public String modify(@PathVariable int bId, Model model) {
		System.out.println(bId);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("rec", dao.viewDao(bId));
		return "update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(HttpServletRequest hsr) {
		int id = Integer.parseInt(hsr.getParameter("bId"));
		String title = hsr.getParameter("bTitle");
		String content = hsr.getParameter("bContent");
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.modifyDao(id, title, content);
		return "redirect:/";
	}
	@RequestMapping("/ajaxlist")
	public String ajaxDo() {
		return "ajaxlist";
	}
	@ResponseBody
	@RequestMapping(value="/ajaxtest", method=RequestMethod.POST, produces = "application/json")
	public ArrayList<BDto> reqList() {
		IDao dao=sqlSession.getMapper(IDao.class);
	    return dao.listDao();
	}
}
