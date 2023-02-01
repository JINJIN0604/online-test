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

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;


@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;

	//삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/empList";
		}				
		
		studentService.removeStudent(studentNo);
		return "redirect:/student/studentList"; //리스트로 리다이렉트
	}	
	
	
	//입력(추가) 폼
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}			
		return "student/addStudent"; // forWord
	}
	
	//입력(추가) 액션
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Model model, Student student) { // 매개변수가 달라서 괜찮다:오버로딩
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}			
		
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
		return "redirect:/student/studentList";	// sendRedirect, CM -> C
	
	}		
		
	//리스트
	@GetMapping("/student/studentList")
	public String studentList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) { 
							// int currentPage(y)= request.getParamenter("currentPage(x)");	
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}					
		
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "student/studentList";
	}	

}