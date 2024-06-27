package com.example.simpleBbs.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.simpleBbs.entity.SimpleBbs;
import com.example.simpleBbs.repository.SimpleBbsRepository;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {

	@Autowired
	SimpleBbsRepository simpleBbsRepository;
	
	
	@RequestMapping("/")
	public String root() {
		
		return "index";
	}
	@RequestMapping("/saveForm")
	public void saveForm() {
		
	}
	@RequestMapping("/save")
	public String save(SimpleBbs simpleBbs) {
		simpleBbsRepository.save(simpleBbs);
		System.out.println(simpleBbs);
		return "redirect:/";
	}
	@RequestMapping("/list")
	public void getAllList(Model model) {
		long count = simpleBbsRepository.count();
		model.addAttribute("count", count);
		//무조건 첫 10개만 뿌려주기
		List<SimpleBbs> lists = simpleBbsRepository.findAll();
		List<SimpleBbs> firstList = new ArrayList<>();
		for(int i=0; i<10; i++) {
			firstList.add(lists.get(i));
		}
		model.addAttribute("firstList", firstList);
		model.addAttribute("curPageBlock", 1);
		
	}
	@RequestMapping("/detail")
	public void getDetail(HttpServletRequest request, Model model) {
		Optional<SimpleBbs> sb =  simpleBbsRepository.findById(Integer.parseInt(request.getParameter("bno")));
		if(sb.isPresent()) {
			SimpleBbs sBbs = sb.get();
			model.addAttribute("simpleBbs", sBbs);
		}
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		simpleBbsRepository.deleteById(Integer.parseInt(request.getParameter("bno")));
		model.addAttribute("result", true);
		
		return "detail";
	}
	@RequestMapping("/deleteAll")
	public String deleteAll() {
		simpleBbsRepository.deleteAll();
		
		return "list";
	}
	@RequestMapping("/updateForm")
	public void updateForm(HttpServletRequest request, Model model) {
		Optional<SimpleBbs> sb =  simpleBbsRepository.findById(Integer.parseInt(request.getParameter("bno")));
		if(sb.isPresent()) {
			SimpleBbs sBbs = sb.get();
			model.addAttribute("simpleBbs", sBbs);
		}
	}
	@RequestMapping("/update")
	public String update(SimpleBbs simpleBbs, Model model) {
		simpleBbsRepository.save(simpleBbs);
		model.addAttribute("result", true);
		System.out.println(simpleBbs);
		return "updateForm";
	}
	@RequestMapping("/pagination")
	public String pagination(HttpServletRequest request, Model model) {
		int page = Integer.parseInt(request.getParameter("page"));
		int pageBlock =  Integer.parseInt(request.getParameter("pageBlock"));
		long length = simpleBbsRepository.count()/10;
		System.out.println(length);
		model.addAttribute("pageBlock", pageBlock);
		if(page == 1) {
			return "redirect:list";
		}
		List<SimpleBbs> lists = simpleBbsRepository.findAll();
		int startIdx = (page-1)*10;
		long endIdx = (page*10);
		System.out.println(startIdx);
		System.out.println(endIdx);
		if(startIdx == length*10) {
			endIdx = startIdx+ simpleBbsRepository.count()%10;
		}
		
		List<SimpleBbs> pageList = new ArrayList<>();
		for(int i = startIdx; i < endIdx ; i++) {
			pageList.add(lists.get(i));
			System.out.println(pageList);
		}
		model.addAttribute("pageList", pageList);
		model.addAttribute("count", simpleBbsRepository.count());
		model.addAttribute("curPage", page);

//		//전체게시글 수
//		int totalCont = (int)memoRepository.count();
//		//페이지당게시글수:10개
//		int pagePerBoard = 10;
		//한 페이지블록에 들어갈 페이지의 수
//		int pageCount = 5;
		//페이지 블록 시작
//		int start = (int)Math.floor((pageNum-1)/pageCount)*pageCount +1;
		// 페이지 블록 끝
//		int end = start + (pageCount -1);
		//실제 리스트의 길이
//		int realEnd = (totalCnt / 10) +1;
//		model.addAttribute("pageNum", pageNum);
//		model.addAttribute("list", memRepository.findByMnoBetweenOrderByMnoDesc((pageNum*10)-9), pageNum*10);
//		model.addAttribute("totalCnt", totalCnt);
//		model.addAttribute("end", end);
//		model.addAttribute("start", start);
//		model.addAttribute("realEnd", realEnd);
		return "pagination";
	}
}
