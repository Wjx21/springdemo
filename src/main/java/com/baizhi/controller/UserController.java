package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService us;

	@RequestMapping("/login")
	public String login(User user,String kaptcha,HttpSession session,Map map){
		String kaptcha1 = (String) session.getAttribute("kaptcha");
		if(!kaptcha.equalsIgnoreCase(kaptcha1)){
			map.put("error", "验证码错误");
			return "login";
		}
		User u = us.selectOne(user);
		if(u==null){
			map.put("error", "用户名或密码不正确");
			return "login";
		}
		session.setAttribute("user", u);
		
		return "redirect:/auction/selectAll.action";
	}
	
	@RequestMapping("/zhuxiao")
	public String zhuxiao(HttpSession session){
		session.removeAttribute("user");
		
		return "login";
	}
	
	@RequestMapping("/regist")
	public String regist(HttpSession session,User user,String code,Map map){
		String kaptcha = (String) session.getAttribute("kaptcha");
		
		System.out.println(user+"****************************");
		
		if(!kaptcha.equalsIgnoreCase(code)){
			map.put("error", "验证码输入有误");
			return "regist";
		}
		boolean bl = us.regist(user);
		if(bl){
			session.setAttribute("user", user);
			return "redirect:/auction/selectAll.action";
		}
		
		return "regist";
	}
	
	@RequestMapping("/checkUserName")
	public void checkUserName(String name,HttpServletResponse response) throws IOException{
		System.out.println("***********************");
		
		String result = "";
		if("wjx".equals(name)){
			result = "???????????";
		}
		
		response.getWriter().write(result);
		
	}
}
