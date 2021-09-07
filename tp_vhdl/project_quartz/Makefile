GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys package.vhdl project_tb.vhdl bcd_7segments.vhdl project.vhdl counter.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys project_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys project_tb --stats --wave=wave.ghw --stop-time=30ns
