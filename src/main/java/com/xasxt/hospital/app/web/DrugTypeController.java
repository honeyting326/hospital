package com.xasxt.hospital.app.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xasxt.hospital.app.bean.Drug;
import com.xasxt.hospital.app.bean.DrugType;
import com.xasxt.hospital.app.service.DrugTypeService;
@RestController
public class DrugTypeController {
	
	@Autowired
	private DrugTypeService    drugTypeService;
	
	@RequestMapping("findDrugTypeWithPage")
	public Map<String,Object>findDrugTypeWithPage(int page ,int limit){
		Map<String,Object>  map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		Map<String,Object>  result=new HashMap<String,Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", drugTypeService.getDrugTypeCount());
		result.put("data", drugTypeService.findDrugTypeWithPage(map));
		return result;
	}
	
	
	@RequestMapping("findDrugTypeAllInfo")
	public List<DrugType>findDrugTypeAllInfo(){
		
		return drugTypeService.findDrugTypeAllInfo();
	}
	
	@RequestMapping("saveDrugtypeInfo")
	public boolean saveDrugtypeInfo(DrugType DrugType){
		return drugTypeService.saveDrugtypeInfo(DrugType);
	}
	
	@RequestMapping("delBatchDrugtypeInfo")
	public boolean delBatchDrugtypeInfo(@RequestParam("drugtypeids[]")String drugtypeids[]){			
//		boolean flag=false;
//		if(drugtypeids.length!=0){
//			for(Integer drugtypeid:drugtypeids){
//				flag=drugTypeService.delBatchDrugtypeInfo(drugtypeid);
//			}
//		}
		
//		return flag;
		return drugTypeService.delBatchDrugtypeInfo(drugtypeids);
	}
	
	
	
	@RequestMapping("delDrugtypeInfo")
	public boolean delDrugtypeInfo(Integer drugtypeid){
		return drugTypeService.delDrugtypeInfo(drugtypeid);
	}
	
	@RequestMapping("getDrugtypeInfo")
	public DrugType getDrugtypeInfo(int drugtypeid){
		return drugTypeService.getDrugtypeInfo(drugtypeid);
	}
	
	@RequestMapping("updateDrugtypeInfo")
	public boolean updateDrugtypeInfo(DrugType drugtype){
		return drugTypeService.updateDrugtypeInfo(drugtype);
	}
	
	
}
