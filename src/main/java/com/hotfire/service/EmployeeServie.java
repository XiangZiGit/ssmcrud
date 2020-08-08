package com.hotfire.service;

import com.hotfire.bean.Employee;
import com.hotfire.bean.EmployeeExample;
import com.hotfire.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeeServie {
    @Autowired
    private EmployeeMapper employeeMapper;
    public List<Employee> getAllEmps() {
        return employeeMapper.selectByExampleWithDepartment(null);
    }

    public void saveEmp(Employee employee) {
        int i = employeeMapper.insertSelective(employee);
    }

    public boolean checkuser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return  0 == employeeMapper.countByExample(employeeExample);
    }

    public Employee getEmpById(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public int update(Employee employee) {
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        return i;
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
