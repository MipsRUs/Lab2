#########################################################
# Copyright TeamName 2016 - All Rights Reserved         
# 							
# Description:        				        
#    makefile for VHDL Test Bench  					  	
#	this makefile assumes that you already have	  
#	cds.lib, hdl.var, and run.cmd in the working 	
#	directory					
#							
# History:						
#    Date	Update Description       Developer	
# ------------ ------------------------- -------------- 
# 1/9/2016	Created			  SC		
#							
#							
#########################################################


# change these parameters 
PROJECT = regfile
INPUTFILE = regfile.vhd
TESTBENCH = regfile_tb.vhd
TOPMODULEENTITY = regfile_tb
TOPMODULEARCHITECTURE = behavior
WORK_TOPMODULE = work.regfile_tb

all: $(PROJECT)

$(PROJECT): 
	mkdir work
	ncvhdl -messages $(INPUTFILE)
	ncvhdl -messages $(TESTBENCH)
	ncelab $(TOPMODULEENTITY):$(TOPMODULEARCHITECTURE) -access +r -messages
	ncsim $(WORK_TOPMODULE) -input run.cmd

clean:
	rm -rf work
	rm *.log
	rm *.key
	rm -rf *.shm	
