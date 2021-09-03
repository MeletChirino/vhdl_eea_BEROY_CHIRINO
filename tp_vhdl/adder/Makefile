GHDL=ghdl
FLAGS="--std=08"

all:
	@$(GHDL) -a $(FLAGS) adder_tb.vhdl adder.vhdl
	@$(GHDL) -e $(FLAGS) adder_tb
	@$(GHDL) -r $(FLAGS) adder_tb --wave=wave.ghw --stop-time=4ns
