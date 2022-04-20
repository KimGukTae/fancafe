package com.ezen.kimb;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index") //메인 페이지로가기
	public String ko1() {
		return "main";
	}
	
	@RequestMapping(value = "/inputsave") //회원등록 페이지로가기
	public String ko2() {
		return "memberinput";
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/memberinputsave")
	public String ko3(HttpServletRequest request,Model mo) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String day = request.getParameter("day");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.memberinsert(id,pw,name,tel,email,address,day);
		return "redirect:index";
	}
	
	@RequestMapping(value = "/outsave")
	public String ko4(Model mo) {
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		ArrayList<MemberDTO> list = mdao.memberout();
		mo.addAttribute("list", list);
		return "memberout";
	}
	
	@RequestMapping(value = "/login")
	public String ko5() {
		return "loginform";
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/loginsave")
	public ModelAndView ko6(HttpServletRequest request,Model mo,HttpServletResponse response,RedirectAttributes res) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		MemberDTO member = mdao.login(id,pw);
		ModelAndView mav = new ModelAndView();
		if(member !=null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("member", member);
			hs.setAttribute("islogon", true);
			
			mav.setViewName("redirect:outsave");
		}
		else {
			res.addAttribute("result", "loginfail");
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public String ko7(HttpServletRequest request,Model mo) {
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.removeAttribute("islogon");
		return "redirect:login";
	}
	
	@RequestMapping(value = "/drama") 
	public String ko8() {
		return "drama";
	}
	
	@RequestMapping(value = "/movie") 
	public String ko9() {
		return "movie";
	}
	
	@RequestMapping(value = "/photo") 
	public String ko10() {
		return "photo";
	}
	
	@RequestMapping(value = "/boardin") 
	public String ko11(HttpServletRequest request,Model mo) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		if(id != null) {
			MemberInter mdao = sqlSession.getMapper(MemberInter.class);
			ArrayList<MemberDTO> list = mdao.boardin(id);
			mo.addAttribute("list", list);
			return "board_input";
		}
		else {
			return "loginform";
		}
		
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/board_inputsave")
	public String ko12(HttpServletRequest request,Model mo) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.boardinsert(id,title,content);
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/boardout")
	public String ko13(HttpServletRequest request,Model mo) {
		BoardDTO dto = new BoardDTO();
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		ArrayList<BoardDTO> list = mdao.boardout();
		String loginid= request.getParameter("id");

		for(int i=0; i<list.size(); i++) {
			
			
			if(list.get(i).id.equals(loginid)) {
				list.get(i).setLog(1);
			}
			else {
				list.get(i).setLog(0);
			}
		}
		mo.addAttribute("list", list);
		return "board_out";
	}
	
	@RequestMapping(value = "/detail")
	public String ko14(HttpServletRequest request,Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		readcnt(num);
		ArrayList<BoardDTO> list = mdao.detail(num);
		mo.addAttribute("list", list);
		return "board_detail";
	}
	
	public void readcnt(int num) {
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.readcnt(num);
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/replyview")
	public String ko15(HttpServletRequest request,Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		ArrayList<BoardDTO> list = mdao.replyview(num,id);
		mo.addAttribute("list", list);
		return "replyview";
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/reply")
	public String ko16(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		stepup(groups,step);
		step++;
		indent++;
		mdao.reply(groups,step,indent,id,title,content,num);
		return "redirect:index";
	}
	
	public void stepup(int groups, int step) {
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.stepup(groups, step);
	}
	
	@RequestMapping(value = "/modifya")
	public String modify(HttpServletRequest request,Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		ArrayList<BoardDTO> list = mdao.modifya(num,id);
		mo.addAttribute("list", list);
		return "modify";
	}
	

	@RequestMapping(method = RequestMethod.POST, value = "/modifysave")
	public String modifysave(HttpServletRequest request,Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		String content  = request.getParameter("content");
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.modifysave(num,content);
		return "redirect:boardout";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request,Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		MemberInter mdao = sqlSession.getMapper(MemberInter.class);
		mdao.deletesave(num);
		return "redirect:boardout";
	}

	
	
	
}
