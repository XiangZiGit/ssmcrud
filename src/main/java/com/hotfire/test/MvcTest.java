package com.hotfire.test;

import com.github.pagehelper.PageInfo;
import com.hotfire.bean.Department;
import com.hotfire.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
    @Autowired
    WebApplicationContext webApplicationContext;
    MockMvc mockMvc;

    @Before
    public void init() {
         mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void test() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNum", "18")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码" + pageInfo.getPages() + "、" + pageInfo.getPageSize());
        System.out.println("总记录数" + pageInfo.getTotal() + "、" + pageInfo.getSize());
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for (int navigatepageNum : navigatepageNums) {
            System.out.println(navigatepageNum);
        }
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.println(employee);
        }
    }
    @Test
public void testDepts() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/getDepts")).andReturn();



    }
}
