package com.xasxt.hospital.app.utils;

import java.util.LinkedHashMap;
import java.util.Map;


import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

@Configuration
public class ShiroConfiguration {
    /**
     * LifecycleBeanPostProcessor�����Ǹ�DestructionAwareBeanPostProcessor�����࣬
     * ����org.apache.shiro.util.Initializable����bean���������ڵģ���ʼ�������١�
     * ��Ҫ��AuthorizingRealm������࣬�Լ�EhCacheManager�ࡣ
     */
    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * HashedCredentialsMatcher���������Ϊ�˶�������б���ģ�
     * ��ֹ���������ݿ������뱣�棬��Ȼ�ڵ�½��֤��ʱ��
     * �����Ҳ�����form�������������б��롣
     */
    @Bean(name = "hashedCredentialsMatcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("MD5");
        credentialsMatcher.setHashIterations(2);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        return credentialsMatcher;
    }
    /**ShiroRealm�����Ǹ��Զ������֤�࣬�̳���AuthorizingRealm��
     * �����û�����֤��Ȩ�޵Ĵ������Բο�JdbcRealm��ʵ�֡�
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public MyRealm shiroRealm() {
        return  new MyRealm();
    }

    /**
     * SecurityManager��Ȩ�޹������������˵�½���ǳ���Ȩ�ޣ�session�Ĵ����Ǹ��Ƚ���Ҫ���ࡣ
     */
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(shiroRealm());
        return securityManager;
    }
    /**
     * ShiroFilterFactoryBean���Ǹ�factorybean��Ϊ������ShiroFilter��
     * ����Ҫ�������������ݣ�securityManager��filters��filterChainDefinitionManager��
     */
    @Bean(name = "shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean() {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager());
        Map<String, String> filterChainDefinitionManager = new LinkedHashMap<String, String>();
        filterChainDefinitionManager.put("/login", "anon");
        filterChainDefinitionManager.put("/layui/**", "anon");
        filterChainDefinitionManager.put("/logout", "logout");
        filterChainDefinitionManager.put("/**", "authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionManager);
        return shiroFilterFactoryBean;
    }



}
