package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	//pw수정 폼
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		return "employee/modifyEmpPw";
	}
	
	//pw수정 액션
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {		
		// 로그인 후 호출 가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");	
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}	
	
	//로그인 폼
	@GetMapping("/loginEmp")
	public String loginEmp(HttpSession session) {
		log.debug("loginEmp emp");
		return "employee/loginEmp";
	}
	//로그인 액션
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {		
		Employee resultEmp  = employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}	
	
	//로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	/*
	 * 로그인 후에 사용가능한 기능
	 */
	
	//삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam("empNo") int empNo) {
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList"; //리스트로 리다이렉트
	}

	//입력(추가) 폼
	@GetMapping("/employee/addEmp")
	public String addEmp() {	
		return "employee/addEmp"; // forWord
	}
	
	//입력(추가) 액션
	@PostMapping("/employee/addEmp")
	public String addEmp(Model model, Employee employee) { // 매개변수가 달라서 괜찮다:오버로딩
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "중복된ID");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패");
			return "employee/addEmp";
		}
		
		return "redirect:/employee/empList";	// sendRedirect, CM -> C
	}
	
	//리스트
	@GetMapping("/employee/empList")
	public String empList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord) { 
							// int currentPage(y)= request.getParamenter("currentPage(x)");	
		//log.debug(searchWord +"<-- searchWord");			
		//log.debug(searchWord +"<-- rowPerPage");			
		//log.debug(searchWord +"<-- currentPage");			
		
		int lastPage = (int)Math.ceil((double)employeeService.lastPage(searchWord)/(double)rowPerPage);
		int startPage = (currentPage/rowPerPage)*10+1;
		int endPage = (currentPage/rowPerPage)*10+10;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		if(lastPage < 1) {
			lastPage = currentPage;
		}

		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		//request.setAttribute("list", list); 
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "employee/empList";
	}

}
