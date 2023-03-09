package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface EmployeeMapper {
	
	List<Test> selectMainTestList();
	int updateEmployeePw(Map<String, Object> paramMap);
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insertEmployee(Employee employee);
	int lastPage(String searchWord);
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}