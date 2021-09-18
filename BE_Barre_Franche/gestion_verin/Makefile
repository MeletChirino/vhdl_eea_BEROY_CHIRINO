GHDL=ghdl
FLAGS="--std=02"

all:
	@$(GHDL) -a $(FLAGS) -fexplicit --ieee=synopsys package.vhdl mcp3201_tb.vhd clk_1MHz.vhdl compt_front.vhdl gene_start_conv.vhdl pilote_adc.vhdl pwm_module.vhdl shift_register.vhdl 
	@$(GHDL) -e $(FLAGS) -fexplicit --ieee=synopsys mcp3201_tb
	@$(GHDL) -r $(FLAGS) -fexplicit --ieee=synopsys mcp3201_tb --stats --wave=wave.ghw --stop-time=70us
