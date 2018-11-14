package com.xasxt.hospital.app.web;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xasxt.hospital.app.bean.Dept;
import com.xasxt.hospital.app.bean.Drug;
import com.xasxt.hospital.app.service.DrugService;

@RestController
public class DrugController {
	
	@Autowired
	private DrugService    drugService;
	
	@RequestMapping("findDrugWithPage")
	public Map<String,Object>findDrugWithPage(int page ,int limit,String drugname,String drugtypname){
		Map<String,Object>  map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("drugname", drugname);
		map.put("drugtypname", drugtypname);
		Map<String,Object>  result=new HashMap<String,Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", drugService.getDrugCount());
		result.put("data", drugService.findDrugWithPage(map));
		return result;
	}
	
	@RequestMapping("saveDrugInfo")
	public boolean saveDrugInfo(Drug drug) {
//		Subject subject =SecurityUtils.getSubject();
//	    Session session=subject.getSession();
//	    User user=(User)session.getAttribute("user");
		drug.setManufacturedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return drugService.saveDrugInfo(drug);
	}
	
	@RequestMapping("delDrugInfo")
	public boolean delDoctorInfo(Integer drugid) {
	
		return drugService.delDrugInfo(drugid);
	}
	
	@RequestMapping("getDrugInfo")
	public Drug getDrugInfo(int drugid) {
		return drugService.getDrugInfo(drugid);
	}
	
	@RequestMapping("delBatchDrugInfo")
    public boolean delBatchDrugInfo(@RequestParam("drugids[]")String  drugids[]) {
        return drugService.delBatchDrugInfo(drugids);
    }
	
	@RequestMapping("updateDrugInfo")
	public boolean updateDrugInfo(Drug drug){
		return drugService.updateDrugInfo(drug);
	}
	
	
	
}
