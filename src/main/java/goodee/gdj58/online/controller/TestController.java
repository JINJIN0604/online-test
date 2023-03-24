package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;

	// 3) 시험 관련 기능
	// 문제 등록
	@PostMapping("/test/addQuestion")
	public String addQuestion(Question question
								, @RequestParam(value = "exampleContent") String[] exampleContent
								, @RequestParam(value = "exampleIdx") int[] exampleIdx
								, @RequestParam(value = "examplAnswer") int examplAnswer) {
		int addQuestion = testService.addQuestion(question);
		log.debug("\u001B[35m" + question.getQuestionNo() + "	<=questionNo");
		
		if(addQuestion == 1) {
			log.debug("\u001B[35m" + "문제 등록성공");
		}
		Example[] example = new Example[4]; // 보기 4개
		for(int i=0; i<example.length; i++) {
			example[i] = new Example();
			example[i].setQuestionNo(question.getQuestionNo());
			example[i].setExampleContent(exampleContent[i]);
			example[i].setExampleIdx(exampleIdx[i]);
			example[i].setExampleAnswer("오답");
			if(examplAnswer == (i+1)) {
				example[i].setExampleAnswer("정답");
			} 
			int addExample = testService.addExample(example[i]);
			if(addExample == 1) {
				log.debug("\u001B[35m" + (i+1) + "보기 등록 성공");
			}
		}
		return "redirect:/test/testOne?testNo="+question.getTestNo(); 
	}
	
	// 시험 상세보기
	@GetMapping("/test/testOne")
	public String getTestOne(Model model
							, @RequestParam(value = "testNo") int testNo) {
		List<Map<String, Object>> list = testService.getTestOne(testNo);
		Test test = testService.getTestTitle(testNo); // 테스트 정보
		List<Map<String, Object>> answer = testService.getTestAnswer(testNo);
		model.addAttribute("test",test);
		model.addAttribute("list",list);
		model.addAttribute("answer",answer);
		log.debug("\u001B[35m" + list.size()/4 + "	<= 문제 개수");
		int questionCount = list.size()/4;
		model.addAttribute("questionCount", questionCount);
		return "test/testOne";
	}
	
	// 시험 삭제(문제, 응시자 없을때만 가능)
	@GetMapping("/test/removeTest")
	public String removeTest(@RequestParam(value = "testNo") int testNo) {
		int row = testService.removeTest(testNo);
		if(row == 1) {
			log.debug("\u001B[35m"+"시험 삭제 성공");
		}
		log.debug("\u001B[35m" + testNo + "	<= testNo");
		return "redirect:/test/testList";
	}
	
	// 시험 등록
	@GetMapping("/test/addTest")
	public String addTest() {
		return "test/addTest";
	}
	
	@PostMapping("/test/addTest")
	public String addTest(Test test) {
		int row  = testService.addTest(test);
		if(row == 1) {
			log.debug("\u001B[35m"+"시험 등록완료");
		}
		return "redirect:/test/testList";
	}
	
	// 시험 목록
	@GetMapping("/test/testList")
	public String testList(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		log.debug("\u001B[35m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[35m" + rowPerPage + "  <=  rowPerPage");
		List<Test> list = testService.getTestList(currentPage, rowPerPage);
		int count = testService.getTestCount();
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug("\u001B[35m" + beginPage + "  <=  beginPage");
		log.debug("\u001B[35m" + endPage + "  <=  endPage");
		log.debug("\u001B[35m" + lastPage + "  <=  lastPage");
		return "test/testList";
	}
}
