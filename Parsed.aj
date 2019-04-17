package aop;

import java.util.List;
import java.util.ArrayList;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.aspectj.lang.reflect.CodeSignature;

public aspect Parsed {

	// create pointcut that captures all public and private methods
    pointcut publicMethodExecuted(): execution( * *(..));
    
    // TODO record argument values before the method gets executed? Can they be changed otherwise?
    
    // get information from method (name, arguments, return value, ...)
    after() returning (Object returnValue): publicMethodExecuted() {
    	List<Argument> args = new ArrayList<Argument>();
    	LocalDateTime now = LocalDateTime.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    	
        String signature = thisJoinPoint.getSignature().toString();
        CodeSignature codeSignature = (CodeSignature) thisJoinPoint.getSignature();
        
        // argument values and names
        Object[] argumentValues = thisJoinPoint.getArgs();
        String[] argumentNames = codeSignature.getParameterNames();
        for (int i =0; i < argumentValues.length; i++){
            Object argument = argumentValues[i];
            String name = argumentNames[i];	
            if (argument != null){
            	Argument arg = new Argument(name, argument.toString(), argument.getClass().toString());
            	args.add(arg);
            }
        }
        
        // Printing
        System.out.print(now.format(formatter) + " | ");
        System.out.print("METHOD: " + signature);
        System.out.print(", ARGUMENTS: ");
        for(Argument a : args) {
        	System.out.print(a.name + "=" + a.value + " ");		// TODO Add type, too?
        }
        System.out.print(", RETURNS: " + returnValue);
        System.out.println();
        
    }
     
}
