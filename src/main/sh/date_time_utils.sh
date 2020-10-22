#!/bin/bash

source ../../../bootstrap.sh

include_lib sh-logger

##
 # @return system timestamp in format yyyyMMdd_HHmm_SSS
 # 
 # @see sh-logger use a diferent format to log timestamp of lines
 ##
get_timestamp() {
	echo `date +"%Y%m%d_%H%M%S_%s"`
}