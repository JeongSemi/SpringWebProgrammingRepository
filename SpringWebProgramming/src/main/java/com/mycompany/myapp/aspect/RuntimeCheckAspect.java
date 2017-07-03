package com.mycompany.myapp.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class RuntimeCheckAspect {
	private static final Logger LOGGER = LoggerFactory.getLogger(RuntimeCheckAspect.class);

	// PointCut
	@Pointcut("execution(public * com.mycompany.myapp.controller.Exam12DBController.*(..))")
	private void runtimeCheckMethod() {
	} // 메소드의 의미X -> Around어노테이션에서 사용하기 위해 선언

	// Advice
	@Around("runtimeCheckMethod()")
	public Object runtimeCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		// before code
		long startTime = System.nanoTime();

		// 실제 메소드(realMethod) 호출
		Object result = joinPoint.proceed(); // pointcut에서 리턴 타입이 정해지지 않았으므로(*)
												// Object를 리턴타입으로 정한다.

		// after code
		long endTime = System.nanoTime();
		long totalTime = endTime - startTime;
		String realMethod = joinPoint.getSignature().toShortString();
		LOGGER.info(realMethod + " 실행시간 : " + totalTime + "ns");
		return result;
	}
}
