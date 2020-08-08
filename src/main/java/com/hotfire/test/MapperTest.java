package com.hotfire.test;

import com.hotfire.bean.Employee;
import com.hotfire.dao.DepartmentMapper;
import com.hotfire.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MapperTest {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testMapper(){
       /* Department department = new Department();
        department.setDeptName("AA");
        departmentMapper.insertSelective(department);
        System.out.println(department.getDeptId());*/
        Employee employee = new Employee();
        employee.setEmail("yida@qq.com");
        employee.setdId(1);
        employee.setEmpName("yida");
        employee.setGender("M");
        employeeMapper.insertSelective(employee);
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null,uuid,"M",uuid+"@139.com",1));
        }
    }
}
