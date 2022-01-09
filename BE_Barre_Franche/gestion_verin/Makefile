GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit -Wlibrary -Wbinding --ieee=synopsys package.vhdl gestion_butees.vhdl gestion_butees_tb.vhdl clk_1MHz.vhdl pilote_adc.vhdl shift_register.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys gestion_butees_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys gestion_butees_tb --stats --wave=wave2.ghw --stop-time=50us
