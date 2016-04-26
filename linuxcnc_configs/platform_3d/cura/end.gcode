;End GCode
G91                                    ;relative positioning
G1 A-1 F300                            ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 A-5 X-20 Y-20 F{travel_speed} ;move Z up a bit and retract filament even more
G1 X-245 Y245                              ;move X/Y to min endstops, so the head is out of the way
G90                         ;absolute positioning
;
%
