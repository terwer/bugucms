/*
 * Copyright 2002-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.terwergreen.bugucms.config;

import com.terwergreen.bugucms.service.SysUserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.annotation.Resource;

/**
 * @Author Terwer
 * @Date 2018/6/22 15:55
 * @Version 1.0
 * @Description 安全配置
 **/
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private Log logger = LogFactory.getLog(this.getClass());

    @Resource
    private SysUserService sysUserService;

    /**
     * 注册UserDetailsService的bean
     * @return
     */
    @Bean
    UserDetailsService customUserService() {
        return sysUserService;
    }

    // @formatter:off
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //运行加载iframe
        http.headers().frameOptions().disable();
        //关闭csrf
        http.csrf().disable();
        //配置权限及登录验证
        http
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .and()
                .formLogin()
                .loginPage("/auth/login").failureUrl("/auth/login?error")
                .permitAll()
                .and()
                .logout()
                .permitAll();
    }
    // @formatter:on

    // @formatter:off
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        //内存中缓存权限数据
        //auth.inMemoryAuthentication().withUser("admin").password(passwordEncoder.encode("123456")).roles("ADMIN");
        String encodePassword = BugucmsConfig.passwordEncoder().encode("123456");
        logger.info("source:123456,encodePassword:" + encodePassword);
        auth.userDetailsService(customUserService()).passwordEncoder(BugucmsConfig.passwordEncoder());
    }
    // @formatter:on
}


