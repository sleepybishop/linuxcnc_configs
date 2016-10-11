# platforms

linuxcnc configs and fpga firmware for machines in the lab

## configs
[grunblau platform](http://www.grunblau.com/PlatformCNC.htm)
 * platform - base config (mill/laser)
 * platform_fdm - for 3d printing
 * platform_sim - just simulation no HAL

[aluminum extrusion ultimaker extended](http://www.thingiverse.com/thing:1100186)
 * ultimaker_fdm - default 3d printing config
 * ultimaker_sim - just simulation no HAL
 * jeffiebotbeta - 3d printer config using 6i25 + sain smart 5axis db25 breakout

## fpga firmware
the firmware is a simplified version of the [mesa hostmot2 firmware](https://github.com/LinuxCNC/hostmot2-firmware) tailored to support only the hardware used.
 * mesa 6i25
 * mesa 7i90
 * mesa 7i92
 * embmicro mojo v3
 
## raspberry pi 3 + mojo v3 fpga wiring

| LINE  | RPI PIN | MOJO PIN |
| ----- | ------- | -------- |
| MOSI  | P1-19   | P17      |
| MISO  | P1-21   | P15      |
| CLK   | P1-23   | P24      |
| CE0   | P1-24   | P22      |


