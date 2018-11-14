package com.xasxt.hospital.app.web;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xasxt.hospital.app.bean.Consultation;
import com.xasxt.hospital.app.bean.DrugPrescriptions;
import com.xasxt.hospital.app.bean.Patient;
import com.xasxt.hospital.app.bean.User;
import com.xasxt.hospital.app.service.PatientService;

@RestController
public class PatientController {
	
	@Autowired
	private PatientService patientService;
	
	
	@RequestMapping("findPatientWithPage")
    public Map<String,Object>findPatientWithPage(int page ,int limit,String pname){
        Map<String,Object>map=new HashMap<String,Object>();
        map.put("page", (page-1)*limit);
        map.put("rows", limit);
        map.put("pname", pname);
        Map<String,Object>results=new HashMap<String,Object>();
        results.put("msg", "");
        results.put("code", 0);
        results.put("count", patientService.getPatientCount(map));
        results.put("data", patientService.findPatientWithPage(map));
        return results;
    }
	@RequestMapping("savePatientInfo")
	public boolean savePatientInfo(Patient patient) {
	    Subject subject =SecurityUtils.getSubject();
        Session session=subject.getSession();
        User user=(User)session.getAttribute("user");
        patient.setOpername(user.getUname());
        patient.setPnum(UUID.randomUUID().toString());
        if("专家号".equals(patient.getFlagnum())) {
            patient.setMoney("15");
        }else if("普通号".equals(patient.getFlagnum())) {
            patient.setMoney("10");
        }
        patient.setOpertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        return patientService.savePatientInfo(patient);
    }
	

    @RequestMapping("delBatchPatientInfo")
    public  boolean delBatchPatientInfo(@RequestParam("pids[]")String pids[]) {
        return patientService.delBatchPatientInfo(pids);
    }
    
    @RequestMapping("delPatientInfo")
    public boolean delPatientInfo(int pid) {
        return patientService.delPatientInfo(pid);
    }
    
    @RequestMapping("updatePatientInfo")
    public   boolean updatePatientInfo(Patient patient,Integer pid,String flag) {
        Subject subject =SecurityUtils.getSubject();
        Session session=subject.getSession();
        if(pid!=0) {
            patient.setPid(pid);
        }
        if(!"".equals(flag)||flag!=null) {
            patient.setFlag(flag);
        }
        User user=(User)session.getAttribute("user");
        patient.setOpername(user.getUname());
        patient.setPnum(UUID.randomUUID().toString());
        if("专家号".equals(patient.getFlagnum())) {
            patient.setMoney("15");
        }else if("普通号".equals(patient.getFlagnum())) {
            patient.setMoney("10");
        }
        patient.setOpertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        return patientService.updatePatientInfo(patient);
        
    }
    
    @RequestMapping("findPatientSubmitWithPage")
	public   Map<String,Object>  findPatientSubmitWithPage(int page ,int limit,String pname,String docname){
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("pname", pname);
		map.put("docname", docname);
		Map<String,Object>results=new HashMap<String,Object>();
		results.put("msg", "");
		results.put("code", 0);
		results.put("count", patientService.getPatientSubmitCount(map));
		results.put("data", patientService.findPatientSubmitWithPage(map));
		return results;
	}
    
    @RequestMapping("saveConsultationInfo")
	public boolean saveConsultationInfo(Consultation consultation){
		consultation.setConsultationtime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return patientService.saveConsultationInfo(consultation);
		
	}
    
	@RequestMapping("savePatientDrugInfo")
	public   boolean savePatientDrugInfo(DrugPrescriptions   drugPrescriptions){
		return patientService.savePatientDrugInfo(drugPrescriptions);
	}

	
	@RequestMapping("findDrugDetailedWithPage")
	public Map<String,Object>findDrugDetailedWithPage(int page ,int limit,Integer patientid){
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("patientid", patientid);
		Map<String,Object>results=new HashMap<String,Object>();
		results.put("msg", "");
		results.put("code", 0);
		results.put("count", patientService.getDrugDetailedCount(map));
		results.put("data", patientService.findDrugDetailedWithPage(map));
		return results;
	}
	
}
