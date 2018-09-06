package com.xasxt.hospital.app.utils;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import com.alibaba.druid.support.http.StatViewServlet;

/**  
 * druid鐩戞帶瑙嗗浘閰嶇疆  
 * @ClassName: DruidStatViewServlet   
 * @author linge  
 * @date 2017骞�7鏈�24鏃� 涓婂崍10:54:27  
 */  
@WebServlet(urlPatterns = "/druid/*", initParams={  
    @WebInitParam(name="allow",value=""),// IP鐧藉悕鍗� (娌℃湁閰嶇疆鎴栬�呬负绌猴紝鍒欏厑璁告墍鏈夎闂�)  
    @WebInitParam(name="deny",value="127.0.0.1"),// IP榛戝悕鍗� (瀛樺湪鍏卞悓鏃讹紝deny浼樺厛浜巃llow)  
    @WebInitParam(name="loginUsername",value="admin"),// 鐢ㄦ埛鍚�  
    @WebInitParam(name="loginPassword",value="admin"),// 瀵嗙爜  
    @WebInitParam(name="resetEnable",value="true")// 绂佺敤HTML椤甸潰涓婄殑鈥淩eset All鈥濆姛鑳�  
})
public class DruidStatViewServlet extends StatViewServlet {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

}
