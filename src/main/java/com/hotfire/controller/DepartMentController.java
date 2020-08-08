package com.hotfire.controller;

import com.hotfire.bean.Department;
import com.hotfire.bean.Msg;
import com.hotfire.service.DepartMentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DepartMentController {
    @Autowired
    DepartMentService departMentService;
    @RequestMapping("/getDepts")
    public Msg getDepts(){
        List<Department> depts = departMentService.getDepts();
        return Msg.success().add("depts",depts);
    }
}
