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
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;

	//pw수정 폼
	@GetMapping("/employee/modifyStudentPw")
	public String modifyStudentPw(HttpSession session) {			
		return "/student/modifyStudentPw";
	}
	
	//pw수정 액션
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {		
		// 로그인 후 호출 가능
		Student loginStudent = (Student)session.getAttribute("loginStudent");	
		studentService.updateStudentPw(loginStudent.getStudentNo(), oldPw, newPw);
		
		return "redirect:/employee/studentList";
	}	
	
	//로그인 폼
	@GetMapping("/loginStudent")
	public String loginStudent(HttpSession session) {
		log.debug("loginStudent student");
		return "Student/loginStudent";
	}
	
	//로그인 액션
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student) {		
		Student resultStudent  = studentService.login(student);
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentList";
	}	
	
	//로그아웃
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/student/loginStudent";
	}
	
	//삭제
	@GetMapping("employee/removeStudent")
	public String removeStudent(@RequestParam("studentNo") int studentNo) {			
		
		studentService.removeStudent(studentNo);
		return "redirect:/employee/studentList"; //리스트로 리다이렉트
	}	
	
	
	//입력(추가) 폼
	@GetMapping("employee/addStudent")
	public String addStudent() {		
		return "employee/addStudent"; // forWord
	}
	
	//입력(추가) 액션
	@PostMapping("employee/addStudent")
	public String addStudent(Model model, Student student) { // 매개변수가 달라서 괜찮다:오버로딩
		
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID");
			return "student/addStudent";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {		
			model.addAttribute("errorMsg", "시스템에러로 등록실패");
			return "student/addStudent";
		}
		return "redirect:/employee/studentList";	// sendRedirect, CM -> C
	
	}		
		
	//리스트
	@GetMapping("employee/studentList")
	public String studentList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
							
							// int currentPage(y)= request.getParamenter("currentPage(x)");	
		
		int lastPage = (int)Math.ceil((double)studentService.lastPage(searchWord)/(double)rowPerPage);
		int startPage = (currentPage/rowPerPage)*10+1;
		int endPage = (currentPage/rowPerPage)*10+10;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		if(lastPage < 1) {
			lastPage = currentPage;
		}		
				
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage, searchWord);
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);		
		return "student/studentList";
	}	

}