package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TestMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	@Autowired private TestMapper testMapper;
	
	
	
	// 보기 등록
	public int addExample(Example example) {
		return testMapper.insertExample(example);
	}
	
	// 문제 등록
	public int addQuestion(Question question) {
		return testMapper.insertQuestion(question);
	}
	
	// 시험 상세보기
	public Test getTestTitle(int testNo) {
		return testMapper.selectTestTitle(testNo);
	}
	public List<Map<String, Object>> getTestOne(int testNo) {
		return testMapper.selectTestOne(testNo);
	}
	public List<Map<String, Object>> getTestAnswer(int testNo) {
		return testMapper.selectTestAnswer(testNo);
	}
	
	// 시험 삭제
	public int removeTest(int testNo) {
		return testMapper.deleteTest(testNo);
	}
	
	// 시험 등록
	public int addTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	// 강사 시험 목록
	public List<Test> getTestList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return testMapper.selectTestList(paramMap);
	}
	
	// 시험 개수
	public int getTestCount() {
		return testMapper.testListCount();
	}	
}
