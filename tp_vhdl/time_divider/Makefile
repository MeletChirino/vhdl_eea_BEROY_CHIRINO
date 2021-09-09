GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys time_divider.vhdl time_divider_tb.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys diviseur_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys diviseur_tb --stats --wave=wave.ghw --stop-time=2000000000ns

