#
# requires xilinx webpack ise (tested with 14.7)
#

PART=xc6slx9-tqg144-2
BOARD=5i25

all: FALLBACK.bit

%.prj: %.vhd
	sh ./vhd2prj.sh $*

%.xst:
	cat xsttemplate | sed s/toplevel/$*/g | sed s/targetpart/$(PART)/g > $@

%.ngc : %.xst %.prj
	# synthesize
	mkdir -p xst/projnav.tmp
	xst -intstyle ise -ifn $< 

%.ngd: %.ngc constraints/$(BOARD).ucf
	ngdbuild -intstyle ise -dd _ngo -aut -nt timestamp -uc constraints/$(BOARD).ucf -p $(PART) $< $@
 
%.pcf: %.ngd
	# map
	map -intstyle ise -p $(PART) -w -logic_opt off -ol high -t 1 -xt 0 -register_duplication off -r 4 -global_opt off -mt off -ir off -pr b -lc off -power off -o $*_map.ncd $< $@

%.ncd: %.pcf
	# place and route
	par -w -intstyle ise -ol high -mt off $*_map.ncd $@ $<
 
%.bit: %.pcf %.ncd
	bitgen -intstyle ise -f defaults.ut $*.ncd $@ $<

clean:
	$(RM) netlist.lst *.bld *.lso *.ngm *.ncd *.mrp *.map *.xrpt *.ngc *.ngd *.ngr *.pcf *.prj  *.srp *.xml *.syr *.xml *.xst
	$(RM) -rf xlnx_auto_0_xdb  _xmsgs _ngo xst 
	$(RM) *.html *.log *.xpi *.unroutes *.ptwx *.par *.txt *.csv *.pas *.pad *.drc *.xwbt *.bgn 




