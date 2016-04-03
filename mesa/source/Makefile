#
# requires xilinx webpack ise (tested with 14.7)
#
BOARD=6i25
CHIP=spartan6
PART=xc6slx9-tqg144-2

TARGET_BITFILES=\
6i25_G540x2_34.bit\
6i25_7i76x2_34.bit\
6i25_G540_7i76_34.bit\
6i25_G540_BSPI.bit\


all: $(TARGET_BITFILES)

%.vhd:
	sed s/@Card@/Sixi25_x9card/g top/TopPCIHostMot2.vhd | sed s/@Pin@/$(subst .vhd,,$(subst $(BOARD),PIN,$@))/g | sed s/TopPCIHostMot2/tophm2/g > $@

%.prj: %.vhd
	sh ./vhd2prj.sh $*

%.xst:
	cat $(CHIP)xst | sed s/toplevel/$*/g | sed s/targetpart/$(PART)/g > $@

%.ngc: %.xst %.prj
	# synthesize
	mkdir -p xst/$*.tmp
	xst -intstyle ise -ifn $< 

%.ngd: %.ngc constraints/$(BOARD).ucf
	ngdbuild -intstyle ise -dd _ngo -aut -nt timestamp -uc constraints/$(BOARD).ucf -p $(PART) $< $@
 
%.pcf: %.ngd
	# map
	map -intstyle ise -p $(PART) -w -logic_opt off -ol high -t 1 -register_duplication off -r 4 -global_opt off -ir off -pr b -power off -o $*_map.ncd $< $@

%.ncd: %.pcf
	# place and route
	par -w -intstyle ise -ol high -mt off $*_map.ncd $@ $<
 
%.bit: %.pcf %.ncd $(CHIP).ut
	bitgen -intstyle ise -f $(CHIP).ut $*.ncd $@ $<

clean:
	$(RM) netlist.lst *.bld *.lso *.ngm *.ncd *.mrp *.map *.xrpt *.ngc *.ngd *.ngr *.pcf *.prj  *.srp *.xml *.syr *.xml *.xst
	$(RM) -rf xlnx_auto_0_xdb _xmsgs _ngo xst 
	$(RM) *.html *.log *.xpi *.unroutes *.ptwx *.par *.txt *.csv *.pas *.pad *.drc *.xwbt *.bgn 


