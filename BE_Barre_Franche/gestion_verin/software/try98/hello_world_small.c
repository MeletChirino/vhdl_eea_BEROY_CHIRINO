/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

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
	int angle;
	alt_putstr("Hello from Nios II!\n");
	set_duty(0x4f40);
	set_freq(0xf0ff);
	set_butee_g(1350);
	set_butee_d(2570);
	alt_putstr("sens0!\n");
	set_sens(1);
	while(1){
			//0x21090
			angle = IORD_ALTERA_AVALON_PIO_DATA(ANGLE_BARRE_BASE);
			alt_putstr("Echantillone!\n");
	};

  return 0;
}

