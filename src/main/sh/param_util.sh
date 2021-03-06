#!/bin/bash
# v1.7.1 - Build with sh-pm



include_lib sh-logger

##
 # Inside a function, check if the function received correct number of params expected.
 # Example:
 # 
 #  even_or_odd() {
 #
 #     if is_number_params_correct 1 $@; then   <========EXAMPLE OF USE==========
 #      
 #       if (( $1 % 2 == 0 )); then
 #         echo "even"
 #       else
 #         echo "odd"
 #       fi
 #     else
 #       echo "Incorrect number of params!"
 #     fi
 #  }   
 #
 # @param $1: Number of expected params (NUM_PARAMS_EXPECTED)
 # @param $2: Number of params received in function. You must pass with $#
 #
 # @return $TRUE if function have correct number of params, $FALSE otherwise 
 ##
is_number_params_correct() {
	if [ $# -eq 0 ]; then
		local NUM_PARAMS_EXPECTED=0
	else 
		local NUM_PARAMS_EXPECTED=$1
	fi
	
    local FUNCTION_NAME=${FUNCNAME[1]}
    local NUM_PARAMS_RECEIVED=$(( $# - 1 )) # the first param is not a param of function under avaliation, is the number of param expected

	if [ $NUM_PARAMS_RECEIVED -ne $NUM_PARAMS_EXPECTED ]; then	    
		return $FALSE
	else
		return $TRUE
	fi
}

##
 # Used inside functions: Halt execution if function number of params is incorrect.
 #
 # @param $1: Number of expected params (NUM_PARAMS_EXPECTED)
 # @param $2: All params of function. You must pass with $#
 #
 # @return $TRUE if function have correct number of params, $FALSE otherwise 
 ##
ensure_number_params_correct(){
	
	if [ $# -eq 0 ]; then
		local NUM_PARAMS_EXPECTED=0
	else 
		local NUM_PARAMS_EXPECTED=$1
	fi
	
    local FUNCTION_NAME=${FUNCNAME[1]}
    local NUM_PARAMS_RECEIVED=$(( $# - 1 )) # the first param is not a param of function under avaliation, is the number of param expected

	if [ $NUM_PARAMS_RECEIVED -ne $NUM_PARAMS_EXPECTED ]; then	    
		log_error "Illegal number of parameters. Function '$FUNCTION_NAME' expect $NUM_PARAMS_EXPECTED params but receive $NUM_PARAMS_RECEIVED"	    
		exit 1
	fi	
}
