# VHDL EEA
By: 
- BEROY Juan Anel
- CHIRINO CAICEDO Melet David

In this file you're going to find vhdl files and TP vhdl files with simulations and graphics

## GHDL
All VHDL circuits written in this repo has been simulated using [GHDL](http://ghdl.free.fr/) which is an open source simulator for vhdl available for Linux, Windows and Apple OS X. That's why in every folder with file you're going to find a file `_tb.vhdl` and a `Makefile`. If you're not using GHDL to simulate your files you can ignore those files.

# Project BE
We have choosen as primary functions the anemometer and Gestion Verin
## Anemometre
![anemometer-diagram](https://carpego-files-bucket.s3.amazonaws.com/img/anemometre.png)
## Gestion Verin
This device is going to manage position of a piston so it has several internal pieces. This is internal diagram of functions

![gv-diagram](https://carpego-files-bucket.s3.amazonaws.com/img/diagram.png)
### Frequency Clock Divider
This module is going to divide frequency by 50 and is going to give us a frequency of 1MHz used with the other devices
### PWM Module
This PWM module is going to receive the frequency and duty cycle coded by software with internal microcontroler

![pwm-diagram](https://carpego-files-bucket.s3.amazonaws.com/img/pwm_module.png)
### ADC Diagram
This device is going to receive data from MCP3201 as serial input and store it as numeric 12-bit number

![adc-diagram](https://carpego-files-bucket.s3.amazonaws.com/img/adc_module.png)

### Interface Avalon
![adc-diagram](https://carpego-files-bucket.s3.amazonaws.com/img/trame_nmea.png)
