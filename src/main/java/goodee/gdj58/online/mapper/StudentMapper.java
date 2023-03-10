package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {

	int updateStudentPw(Map<String, Object> paramMap);
	Student login(Student student);	
	int deleteStudent(int StudentNo);
	int insertStudent(Student student);
	int lastPage(String searchWord);
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
