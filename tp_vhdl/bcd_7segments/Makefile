GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) --ieee=synopsys bcd_7segments_tb.vhdl bcd_7segments.vhdl
	@$(GHDL) -e $(FLAGS) --ieee=synopsys bcd_7sg_tb
	@$(GHDL) -r $(FLAGS) --ieee=synopsys bcd_7sg_tb --wave=wave.ghw --stop-time=13ns
