GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys package.vhdl gestion_verin_tb.vhdl clk_1MHz.vhdl shift_register.vhdl clk_50MHz.vhd
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb --stats --wave=wave.ghw --stop-time=500us
