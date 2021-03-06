package com.kh.dagym.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.dagym.admin.model.service.AdminService;
import com.kh.dagym.admin.model.vo.Attachment;
import com.kh.dagym.admin.model.vo.Board;
import com.kh.dagym.admin.model.vo.Member;
import com.kh.dagym.admin.model.vo.PT;
import com.kh.dagym.admin.model.vo.Page;
import com.kh.dagym.admin.model.vo.Reply;
import com.kh.dagym.admin.model.vo.Trainer;
import com.kh.dagym.trainer.model.vo.Payment;

@SessionAttributes({"loginMember"})
@Component
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminView")
	public String adminView() {
		return "admin/adminMain";
	}
	
	// 관리자 로그아웃
	@RequestMapping("logout")
	public String logout(SessionStatus status, RedirectAttributes rdAttr) {
		rdAttr.addFlashAttribute("status", "success");
		rdAttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		status.setComplete();
		
		return "redirect:/";
	}
	
	// 회원 전체 조회
	@RequestMapping("memberList")
	public String memberListView(Model model) {
		List<Member> mList = adminService.selectMList(); 
		model.addAttribute("mList", mList);

		return "admin/memberList";
	}
	
	// 트레이너 전체 조회
	@RequestMapping("trainerList")
	public String trainerListView(Model model) {
		List<Trainer> tList = adminService.selectTList(); 
		model.addAttribute("tList", tList);

		return "admin/trainerList";
	}
	
	// 1:1 문의 조회
	@RequestMapping("inquiryList")
	public String inquiryListView(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		int type = 3;
		Page pInfo = adminService.pagination(type, cp);
		
		List<Board> iList = adminService.selectList(pInfo);
		model.addAttribute("iList", iList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/inquiryList";
	}
	
	// 문의 내용 이미지 조회
	@ResponseBody
	@RequestMapping("fileList")
	public String fileList(int boardNo) {
		List<Attachment> fList = adminService.selectFList(boardNo);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(fList);
	}
	
	// 1:1 문의 답변
	@RequestMapping("insertAnswer")
	public String insertAnswer(Reply reply, RedirectAttributes rdAttr) {
		int result = adminService.insertAnswer(reply);
		
		if(result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "답변 완료 !");
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "답변 실패");
		}
		
		return "redirect:inquiryList";
	}
	
	// 월별 매출 조회 화면 전환
	@RequestMapping("monthChart")
	public String monthChartView() {
		return "admin/monthChart";
	}
	
	// 트레이너별 매출 조회 화면 전환
	@RequestMapping("trainerChart")
	public String trainerChartView() {
		return "admin/trainerChart";
	}
	
	// 이벤트 작성 화면 전환
	@RequestMapping("insertEventView")
	public String insertEventView() {
		return "admin/insertEvent";
	}
	
	// 이벤트 작성
	@RequestMapping(value="insertEvent", method=RequestMethod.POST)
	public String insertEvent(Board board, RedirectAttributes rdAttr, HttpServletRequest request,
							@RequestParam(value="images", required=false) List<MultipartFile> images) {
		board.setBoardType(1);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages");
		int result = adminService.insertEvent(board, images, savePath);
		
		String url = null;
		if(result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "이벤트 작성 완료 !");
			url = "eventList";
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "이벤트 작성 실패");
			url = "insertEvent";
		}
		
		return "redirect:" + url;
	}
	
	// 이벤트 목록 조회
	@RequestMapping("eventList")
	public String eventList(Model model, @RequestParam(value="cp", required=false, defaultValue="1") int cp) {
		int type = 1;
		Page pInfo = adminService.pagination(type, cp);
		
		List<Board> eList = adminService.selectList(pInfo);
		model.addAttribute("eList", eList);
		model.addAttribute("pInfo", pInfo);
		
		return "admin/eventList";
	}
	
	// 트레이너 가입
	@RequestMapping("insertTrainer")
	public String insertTrainer() {
		return "admin/trainerSignUp";
	}
	
	/*
	 * @RequestMapping("insertTrainer2") public String insertTrainer2() { 
	 * return "trainerResulvation/signUpView"; }
	 */
	
	// 트레이너별 매출 조회
	@ResponseBody
	@RequestMapping("trainerChartTotal")
	public String trainerChart(String ym) {
		List<Payment> list = adminService.trainerChart(ym);
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(list);
		
	}
	
	// 월별 매출 조회
	@ResponseBody
	@RequestMapping("monthChartView")
	public String monthChart(String year) {
		List<Payment> list = adminService.monthChartView(year);
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(list);
	}
	
	// 트레이너 탈퇴
	@RequestMapping("deleteTrainer/{trainerNo}")
	public String deleteTrainer(@PathVariable int trainerNo, RedirectAttributes rdAttr) {
		int result = adminService.deleteTrainer(trainerNo);
		
		if(result > 0) {
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "트레이너가 탈퇴되었습니다.");
		} else {
			rdAttr.addFlashAttribute("status", "error");
			rdAttr.addFlashAttribute("msg", "탈퇴 실패");
		}
		
		return "redirect:/admin/trainerList";
	}
	
	// 트레이너 수정 화면 전환
	@RequestMapping("updateTrainerView/{trainerNo}")
	public String updateTrainerView(@PathVariable int trainerNo, Model model) {
		Trainer trainer = adminService.selectTrainer(trainerNo);
		
		if(trainer != null) {
			Attachment file = adminService.selectFile(trainerNo);
			model.addAttribute("file", file);
		}
		model.addAttribute("trainer", trainer);

		return "admin/updateTrainer";
	}
	
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping("pwdCheck")
	public String pwdCheck(Trainer trainer) {
		int result = adminService.pwdCheck(trainer);
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result);
	}
	
	// 트레이너 수정
	@RequestMapping(value="trainerUpdate", method=RequestMethod.POST)
	public String updateTrainer(Trainer trainer, HttpServletRequest request, 
								RedirectAttributes rdAttr, @RequestParam(value="thumbnail", required=false) MultipartFile image) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadImages/");
		
		int result = adminService.updateTrainer(trainer, savePath, image);

		if(result > 0) { 
			rdAttr.addFlashAttribute("status", "success");
			rdAttr.addFlashAttribute("msg", "수정 성공 !"); 
		} else {
			rdAttr.addFlashAttribute("status", "error"); 
			rdAttr.addFlashAttribute("msg", "수정 실패"); 
		}
		
		return "redirect:/admin/trainerList";
	}
	
	// 스케줄 조회 화면 전환
	@RequestMapping("schedule")
	public String scheduleView(Model model) {
		List<Trainer> tList = adminService.selectTList();
		List<PT> sList = adminService.selectSList();

		model.addAttribute("tList", tList);
		model.addAttribute("sList", sList);

		return "admin/schedule";
	}
	
	// 스케줄 조회 시 트레이너 필터 적용
	@ResponseBody
	@RequestMapping("scheduleFilter")
	public String scheduleFileter(int[] tno) {
		List<Integer> noList = new ArrayList<Integer>();
		for(int i=0; i<tno.length; i++) {
			noList.add(tno[i]);
		}
		List<PT> sList = adminService.scheduleFilter(noList);
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(sList);
	}
	
	// 회원수 세기
	@ResponseBody
	@RequestMapping("count")
	public String count() {
		List<Integer> count = adminService.count();
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(count);
	}
}