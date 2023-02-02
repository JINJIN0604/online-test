package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;

	//pw수정 폼
	@GetMapping("/employee/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session) {
				
		return "/employee/modifyTeacherPw";
	}
	
	//pw수정 액션
	@PostMapping("/employee/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {		
		// 로그인 후 호출 가능
		Teacher loginTeacher= (Teacher)session.getAttribute("loginTeacher");	
		teacherService.updateTeacherPw(loginTeacher.getTeacherNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}	
	
	//로그인 폼
	@GetMapping("/loginTeacher")
	public String loginTeacher(HttpSession session) {
		log.debug("loginTeacher teacher");
		return "employee/loginTeacher";
	}
	//로그인 액션
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {		
		Teacher resultTeacher  = teacherService.login(teacher);
		session.setAttribute("loginEmp", resultTeacher);
		return "redirect:/employee/empList";
	}	
	
	//로그아웃
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginTeacher";
	}
	
	//삭제
	@GetMapping("employee/removeTeacher")
	public String removeTeacher(@RequestParam("teacherNo") int teacherNo) {

		teacherService.removeTeacher(teacherNo);
		return "redirect:/employee/teacherList"; //리스트로 리다이렉트
	}	
	
	
	//입력(추가) 폼
	@GetMapping("employee/addTeacher")
	public String addTeacher() {		
		return "employee/addTeacher"; // forWord
	}
	
	//입력(추가) 액션
	@PostMapping("employee/addTeacher")
	public String addTeacher(Model model, Teacher teacher) { // 매개변수가 달라서 괜찮다:오버로딩			
		
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID");
			return "employee/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패");
			return "teacher/addTeacher";
		}
		return "redirect:/employee/teacherList";	// sendRedirect, CM -> C
	}
			
		
	//리스트
	@GetMapping("employee/teacherList")
	public String teacherList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
							
							// int currentPage(y)= request.getParamenter("currentPage(x)");	

		int lastPage = (int)Math.ceil((double)teacherService.lastPage(searchWord)/(double)rowPerPage);
		int startPage = (currentPage/rowPerPage)*10+1;
		int endPage = (currentPage/rowPerPage)*10+10;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		if(lastPage < 1) {
			lastPage = currentPage;
		}
		
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);		
		return "teacher/teacherList";
	}	

}
