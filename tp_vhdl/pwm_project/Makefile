GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys module_pwm.vhd module_pwm_tb.vhdl
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys module_pwm_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys module_pwm_tb --stats --wave=wave.ghw --stop-time=15200ns
