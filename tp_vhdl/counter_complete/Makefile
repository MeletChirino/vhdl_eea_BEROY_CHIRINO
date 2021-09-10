GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys counter_tb.vhdl counter.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys counter_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys counter_tb --stats --wave=wave.ghw --stop-time=50ns
