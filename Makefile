FIRST_BLOCK := c1908
SECOND_BLOCK := c5315

.PHONY: all first_1.0 first_1.5 first_2.0 second_1.0 second_1.5 second_2.0

all: first_1.0 first_1.5 first_2.0 second_1.0 second_1.5 second_2.0

first_1.0:
	pt_shell -x "set blockName $(FIRST_BLOCK); set clock 1.0; source scripts/pt_contest.tcl" > results_$(FIRST_BLOCK)_1.0.txt;

first_1.5:
	pt_shell -x "set blockName $(FIRST_BLOCK); set clock 1.5; source scripts/pt_contest.tcl" > results_$(FIRST_BLOCK)_1.5.txt;

first_2.0:
	pt_shell -x "set blockName $(FIRST_BLOCK); set clock 2.0; source scripts/pt_contest.tcl" > results_$(FIRST_BLOCK)_2.0.txt;

second_1.0:
	pt_shell -x "set blockName $(SECOND_BLOCK); set clock 1.0; source scripts/pt_contest.tcl" > results_$(SECOND_BLOCK)_1.0.txt;

second_1.5:
	pt_shell -x "set blockName $(SECOND_BLOCK); set clock 1.5; source scripts/pt_contest.tcl" > results_$(SECOND_BLOCK)_1.5.txt;

second_2.0:
	pt_shell -x "set blockName $(SECOND_BLOCK); set clock 2.0; source scripts/pt_contest.tcl" > results_$(SECOND_BLOCK)_2.0.txt;
