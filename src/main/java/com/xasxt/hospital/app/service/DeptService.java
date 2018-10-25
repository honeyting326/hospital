package com.xasxt.hospital.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xasxt.hospital.app.bean.Dept;
import com.xasxt.hospital.app.bean.Doctor;
import com.xasxt.hospital.app.dao.DeptDaoMapper;

@Service
@Transactional
public class DeptService {

    @Autowired
    private DeptDaoMapper  deptDaoMapper;
    
    public List<Dept> findDeptWithPage(Map<String,Object>map){
        return deptDaoMapper.findDeptWithPage(map);
    }

    public  int getDeptCount() {
        return deptDaoMapper.getDeptCount();
    }
    
    public boolean saveDeptInfo(Dept dept) {
        return deptDaoMapper.saveDeptInfo(dept)!=0?true:false;
    }
    public boolean updateDeptInfo(Dept dept) {
        return deptDaoMapper.updateDeptInfo(dept)!=0?true:false;
    }
    
    public Dept getDeptInfo(int did) {
        return deptDaoMapper.getDeptInfo(did);
    }
    
    public boolean delDeptInfo(int did) {
        return deptDaoMapper.delDeptInfo(did)!=0?true:false;
    }
    public List<Dept> findDeptAllInfo(){
        return deptDaoMapper.findDeptAllInfo();
    }
    public List<Doctor> findDoctorByDid(int did){
        return deptDaoMapper.findDoctorByDid(did).getListDoctor();
    }
  
}
