GHDL=ghdl
FLAGS="--ieee=synopsys"

all:
	@$(GHDL) -a --std=02 $(FLAGS) adder_2x5_tb.vhdl adder_2x5.vhdl
	@$(GHDL) -e --std=02 $(FLAGS) adder_2x5_tb
	@$(GHDL) -r --std=02 $(FLAGS) adder_2x5_tb --wave=wave.ghw --stop-time=10ns
