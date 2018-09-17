package com.xasxt.hospital.app.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xasxt.hospital.app.bean.Dept;
import com.xasxt.hospital.app.bean.Doctor;
import com.xasxt.hospital.app.service.DeptService;

@RestController

public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("saveDeptInfo")
	public boolean saveDeptInfo(Dept dept) {
		return deptService.saveDeptInfo(dept);
	}
	@RequestMapping("updateDeptInfo")
	public boolean updateDeptInfo(Dept dept) {
		return deptService.updateDeptInfo(dept);
	}
	@RequestMapping("getDeptInfo")
	public Dept getDeptInfo(int dId) {
		return deptService.getDeptInfo(dId);
	}
	
	
	@RequestMapping("delDeptInfo")
	public boolean delDeptInfo(Integer did) {
	
		return deptService.delDeptInfo(did);
	}
	
	@RequestMapping("delBatchDeptInfo")
	public boolean delBatchDeptInfo(@RequestParam("dids[]")Integer  dids[]) {
		boolean flag=false;
		if( dids.length!=0) {
			for(Integer  deptid:dids) {
				flag=deptService.delDeptInfo(deptid);
			}
			
		}
		return flag;
	}
  
	@RequestMapping("findDeptWithPage")
	public Map<String,Object>findDeptWithPage(int page ,int limit,String deptname){
		Map<String,Object>  map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("dname", deptname);
		Map<String,Object>  result=new HashMap<String,Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", deptService.getDeptCount());
		result.put("data", deptService.findDeptWithPage(map));
		return result;
	}
	
	@RequestMapping("findDeptAllInfo")
    public List<Dept>findDeptAllInfo(){
        return deptService.findDeptAllInfo();
    }
	
	@RequestMapping("findDoctorByDid")
    public List<Doctor>findDoctorByDid(int did){
        return deptService.findDoctorByDid(did);
        
    }
	
}
