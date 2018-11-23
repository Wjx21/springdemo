package com.baizhi.conf;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Configuration;

@Configuration
@Aspect
public class TestAdvicer {

    @Pointcut("execution(* com.baizhi.service.*.*(..))")
    public void pointCut(){
    }

    @Before("pointCut()")
    public void doBefore(JoinPoint joinPoint){
        Object[] args = joinPoint.getArgs();
        Object target = joinPoint.getTarget();
        Signature signature = joinPoint.getSignature();
        String name = signature.getName();

        System.out.println(target.toString()+"中的"+name+"方法，参数为"+args);

        System.out.println("this is before");
    }

    @After("pointCut()")
    public void doAfter(JoinPoint joinPoint){
        System.out.println("this is after");
    }
}
