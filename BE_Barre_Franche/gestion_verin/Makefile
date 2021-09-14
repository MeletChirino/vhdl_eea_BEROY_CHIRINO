GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys package.vhd gestion_verin_tb.vhdl pwm_module.vhd
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys gestion_verin_tb --stats --wave=wave.ghw --stop-time=3200ms
