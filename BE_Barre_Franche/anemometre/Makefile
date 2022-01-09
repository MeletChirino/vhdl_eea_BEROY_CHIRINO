GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit -Wlibrary -Wbinding --ieee=synopsys tools.vhd projet_anemometre_tb.vhd counter.vhd projet_anemometre.vhd  select_mode.vhd time_divider.vhd 
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys projet_anemometre_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys projet_anemometre_tb --stats --wave=wave.ghw --stop-time=3000ms
