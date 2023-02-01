package goodee.gdj58.online.vo;

import lombok.Data;

@Data //직접 세트/겟트 안만들어도 된다 자동으로 만들어짐
public class Employee {
	private int empNo;
	private String empId;
	private String empPw;
	private String empName;
}
