Sliced at: {day} {date} {time}
;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
;Print time: {print_time}
;Filament used: {filament_amount}m {filament_weight}g
;Filament cost: {filament_cost}
;M190 S{print_bed_temperature} ;Uncomment to add your own bed temperature line
;M109 S{print_temperature} ;Uncomment to add your own temperature line
G21        ;metric values
G90        ;absolute positioning
G28 X-245 Y245  ;move X/Y to min endstops
G28 Z0     ;move Z to min endstops
G1 Z15.0 F{travel_speed} ;move the platform down 15mm
G92 A0                  ;zero the extruded length
G1 F200 A3              ;extrude 3mm of feed stock
G92 A0                  ;zero the extruded length again
G1 F{travel_speed}
