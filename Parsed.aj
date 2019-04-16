package aop;

import java.util.List;
import java.util.ArrayList;

public aspect Parsed {

	// create pointcut that captures all public methods
    pointcut publicMethodExecuted(): execution(public * *(..));
    
    // get information from method (name, arguments, return value, ...)
    after() returning (Object returnValue): publicMethodExecuted() {
    	List<Argument> args = new ArrayList<Argument>();
    	
        String signature = thisJoinPoint.getSignature().toString();

        Object[] arguments = thisJoinPoint.getArgs();
        for (int i =0; i < arguments.length; i++){
            Object argument = arguments[i];
            if (argument != null){
            	Argument arg = new Argument(argument.toString(), argument.getClass().toString());
            	args.add(arg);
            }
        }
        
        // Printing
        System.out.print("METHOD: " + signature);
        System.out.print(", ARGUMENTS: ");
        for(Argument a : args) {
        	System.out.print(a.value + " ");
        	//System.out.print(a.value + "(" + a.type + ") ");
        }
        System.out.print(", RETURNS: " + returnValue);
        System.out.println();
        
    }
     
    
}