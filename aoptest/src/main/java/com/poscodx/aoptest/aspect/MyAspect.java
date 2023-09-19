package com.poscodx.aoptest.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class MyAspect {
   
   @Before("execution(public com.poscodx.aoptest.vo.ProductVo com.poscodx.aoptest.service.ProductService.find(String))") //해당 함수가 실행되기전 실행해라!!
   public void adviceBefore() {
      System.out.println("----before advice----");
   }
   
   //접근 지시자는 생략 가능!
   @After("execution(com.poscodx.aoptest.vo.ProductVo com.poscodx.aoptest.service.ProductService.find(String))") //해당 함수가 실행되기전 실행해라!!
   public void adviceAfter() {
      System.out.println("----before advice----");
   }

   @AfterReturning("execution(* com.poscodx.aoptest.service.ProductService.find(String))") 
   public void adviceAfterReturning() {
	   System.out.println("----AfterReturning advice----");
   }
   
   //예외 발생시 *..* 모든 패키지 
   @AfterThrowing(value="execution(* *..*.ProductService.find(..))", throwing="ex") 
   public void adviceAfterThrowing(Throwable ex) {
	   System.out.println("----AfterThrowing advice----" + ex + "----");
   }
   
   
   @Around("execution(* *..*.ProductService.*(..))")
   public Object adviceAround(ProceedingJoinPoint pjp) throws Throwable {
	   /*before*/
	   System.out.println("----- Around(before) Advice ----");
	   
	   /* Point Cut Method 실행 */
	   Object[] params = {"Camera"};
	   Object result = pjp.proceed(params);
	   
	   
	   //Object result = pjp.proceed();
	   
	   /* after */
	   System.out.println("----- Around(after) Advice ----");
	   
	   return result;
   }
   
   
}