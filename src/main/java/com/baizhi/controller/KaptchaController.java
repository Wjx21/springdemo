package com.baizhi.controller;

import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class KaptchaController {
	@Autowired
	private Producer producer;
	
	@RequestMapping("/getKaptcha")
	public void getKaptcha(HttpSession session,HttpServletResponse response) throws IOException{
		
		// 1.???????????,??????session
		String text = producer.createText();
		session.setAttribute("kaptcha", text);

		// 2.??????????????????
		BufferedImage image = producer.createImage(text);
		
		// 3.?????????????????????????
		ImageIO.write(image,"jpg",response.getOutputStream());
		
	}

}
