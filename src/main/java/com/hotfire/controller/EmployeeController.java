package com.hotfire.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hotfire.bean.Employee;
import com.hotfire.bean.Msg;
import com.hotfire.service.EmployeeServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeServie employeeServie;

    @ResponseBody
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids) {
        System.out.println(ids);
        if (ids.contains("-")) {
            List<Integer> list = new ArrayList<>();
            String[] id = ids.split("-");
            for (String s : id) {
                list.add(Integer.valueOf(s));
            }
            employeeServie.deleteBatch(list);
        } else {
            employeeServie.deleteEmp(Integer.valueOf(ids));

        }
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    public Msg updateEmp(@Valid Employee employee, BindingResult bindingResult) {
        System.out.println(employee);
        if (bindingResult.hasErrors()) {
            HashMap<String, Object> errors = new HashMap<>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                errors.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errors", errors);
        } else {
            int update = employeeServie.update(employee);
            System.out.println(update);
            return Msg.success();

        }
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee emp = employeeServie.getEmpById(id);
        return Msg.success().add("emp", emp);
    }

    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuser(@RequestParam("empName") String empName) {
        System.out.println("hahahhaa");
        if (employeeServie.checkuser(empName)) {
            return Msg.success().add("result", "用户名可用");
        } else {
            return Msg.fail().add("result", "用户名不可用");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            HashMap<String, Object> errors = new HashMap<>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField());
                System.out.println(fieldError.getDefaultMessage());
                errors.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errors", errors);
        } else {
            employeeServie.saveEmp(employee);
            return Msg.success();
        }

    }

    @ResponseBody
    @RequestMapping("/empsWithjson")
    public Msg getEmpsWithjson(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<Employee> emps = employeeServie.getAllEmps();
        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
        PageHelper.startPage(pageNum, 5);
        List<Employee> emps = employeeServie.getAllEmps();
        PageInfo page = new PageInfo(emps, 5);
        model.addAttribute("pageInfo", page);
        return "list";

    }
}
