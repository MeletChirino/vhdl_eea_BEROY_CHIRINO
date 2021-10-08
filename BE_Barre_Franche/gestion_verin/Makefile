GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys package.vhdl pwm_module.vhdl gestion_verin_tb.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb --stats --wave=wave.ghw --stop-time=41000ns
