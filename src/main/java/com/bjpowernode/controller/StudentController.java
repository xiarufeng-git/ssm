package com.bjpowernode.controller;

import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService service;

    public void setService(StudentService service) {
        this.service = service;
    }

    @RequestMapping("/addStudent.do")
    public ModelAndView addStudents(Student student){
        String tips = "注册失败";
        int nums = service.addStudent(student);
        if(nums>0){
            tips = "学生"+student.getName()+"注册成功";
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("tips",tips);
        mv.setViewName("/result");
        return mv;

    }
    @RequestMapping("/queryStudent.do")
    @ResponseBody
    public List<Student> queryStudent(){
        List<Student> list = service.findStudents();
        return list;
    }
}
