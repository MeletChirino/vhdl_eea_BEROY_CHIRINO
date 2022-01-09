#include "sys/alt_stdio.h"
#include "system.h"
//#define angle_barre (int *) 0x21090
#include "altera_avalon_pio_regs.h"

void set_freq(int frequency){
	//cuando sirva le pones alguna formula para pasar de un valor de frecuencia  a un valor hex
	//*FREQUENCY_BASE = frequency;
	IOWR_ALTERA_AVALON_PIO_DATA(FREQUENCY_BASE, frequency);
}

void set_duty(int duty){
	//mira si lo puedes poner ingresar un numero entre 0 y 100 y hacerle el map desde 0 hasta el valor de la frequencia
	//*DUTY_BASE = duty;
	IOWR_ALTERA_AVALON_PIO_DATA(DUTY_BASE, duty);
}

void set_butee_g(int butee){
	//mira si lo puedes poner ingresar un numero entre 0 y 100 y hacerle el map desde 0 hasta el valor de la frequencia
	//*DUTY_BASE = duty;
	IOWR_ALTERA_AVALON_PIO_DATA(BUTEE_G_BASE, butee);
}
void set_butee_d(int butee){
	//mira si lo puedes poner ingresar un numero entre 0 y 100 y hacerle el map desde 0 hasta el valor de la frequencia
	//*DUTY_BASE = duty;
	IOWR_ALTERA_AVALON_PIO_DATA(BUTEE_D_BASE, butee);
}
void set_sens(int sens){
	//mira si lo puedes poner ingresar un numero entre 0 y 100 y hacerle el map desde 0 hasta el valor de la frequencia
	//*DUTY_BASE = duty;
	IOWR_ALTERA_AVALON_PIO_DATA(SENS_BASE, sens);
}
int main()
{
	int angle, config, address, buffer;
	bool write_n;
	alt_putstr("Hello from Nios II!\n");
	//PWM disabled at first
	set_duty(0x0);
	set_freq(0x0);
	//inital data provided until data received from NIOS
	set_butee_g(1350);
	set_butee_d(2570);
	set_sens(1);
	while(1){
			angle = IORD_ALTERA_AVALON_PIO_DATA(ANGLE_BARRE_BASE);
			write_n = IORD_ALTERA_AVALON_PIO_DATA(WRITE_N_BASE);
			if(write_n){
				address = IORD_ALTERA_AVALON_PIO_DATA(ADDRESS_BASE);
				switch(address){
					case 0x0://frequency
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0xffff;
					set_freq(buffer);
					break;

					case 0x4://duty cycle
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0xffff;
					set_duty(buffer);
					break;

					case 0x8://butee_g
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0xffff;
					set_butee_g(buffer);
					break;

					case 0x12://butee_d
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0xffff;
					set_butee_d(buffer);
					break;

					case 0x16://config
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0x1f;
					IOWR_ALTERA_AVALON_PIO_DATA(RESET_BASE, buffer & 0x1);//raz_n
					IOWR_ALTERA_AVALON_PIO_DATA(ENABLE_PWM_BASE, (buffer & 0x2) >> 1);//enable_pwm
					IOWR_ALTERA_AVALON_PIO_DATA(SENS_BASE, (buffer & 0x4) >> 2);//sens_rotation
					IOWR_ALTERA_AVALON_PIO_DATA(READDATA_BASE, (buffer & 0x8) >> 3);//fin_course_d
					IOWR_ALTERA_AVALON_PIO_DATA(READDATA_BASE, (buffer & 0x16) >> 4);//fin_course_g
					break;

					case 0x20://angle_barre
					buffer = IORD_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE) & 0xffff;
					IOWR_ALTERA_AVALON_PIO_DATA(READDATA_BASE, angle);
					break;
				}
		} 
		buffer = 0x0;
	};

  return 0;
}

