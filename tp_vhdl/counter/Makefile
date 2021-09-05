GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) --ieee=synopsys counter_tb.vhdl counter.vhdl
	@$(GHDL) -e $(FLAGS) --ieee=synopsys counter_tb
	@$(GHDL) -r $(FLAGS) --ieee=synopsys counter_tb --stats --wave=wave.ghw --stop-time=30ns
