####################################################################
# Reset radio settings when swapping SP-50 <-> Kurs-MP
####################################################################
var resetradios = func {
	setprop("an24/SP-50/on", 0.0 );
	setprop("instrumentation/nav/serviceable", 0.0 );
	setprop("instrumentation/nav[1]/serviceable", 0.0 );
	setprop("instrumentation/nav/cdi/serviceable", 0.0 );
	setprop("instrumentation/nav/gs/serviceable", 0.0 );
	setprop("an24/Kurs-MP/vor1-ark1", -1.0 );
	setprop("an24/Kurs-MP/vor2-ark2", -1.0 );
	setprop("an24/Kurs-MP/sw_vor1on", 0.0 );
	setprop("an24/Kurs-MP/sw_vor2on", 0.0 );
	setprop("an24/Kurs-MP/signalisation", 0.0 );
}
 setlistener("an24/radio-equip", resetradios);

####################################################################
# ARK-11 stuff
####################################################################
setprop("an24/ARK-11/mem1/fix1sb", 120.0);
setprop("an24/ARK-11/mem1/fix2sb", 120.0);
setprop("an24/ARK-11/mem1/fix3sb", 120.0);
setprop("an24/ARK-11/mem1/fix4sb", 120.0);
setprop("an24/ARK-11/mem1/fix5sb", 120.0);
setprop("an24/ARK-11/mem1/fix6sb", 120.0);
setprop("an24/ARK-11/mem1/fix7sb", 120.0);
setprop("an24/ARK-11/mem1/fix8sb", 120.0);
setprop("an24/ARK-11/mem1/fix9sb", 120.0);
setprop("an24/ARK-11/mem1/fix1ff", 0.0);
setprop("an24/ARK-11/mem1/fix2ff", 0.0);
setprop("an24/ARK-11/mem1/fix3ff", 0.0);
setprop("an24/ARK-11/mem1/fix4ff", 0.0);
setprop("an24/ARK-11/mem1/fix5ff", 0.0);
setprop("an24/ARK-11/mem1/fix6ff", 0.0);
setprop("an24/ARK-11/mem1/fix7ff", 0.0);
setprop("an24/ARK-11/mem1/fix8ff", 0.0);
setprop("an24/ARK-11/mem1/fix9ff", 0.0);
setprop("an24/ARK-11/mem2/fix1sb", 120.0);
setprop("an24/ARK-11/mem2/fix2sb", 120.0);
setprop("an24/ARK-11/mem2/fix3sb", 120.0);
setprop("an24/ARK-11/mem2/fix4sb", 120.0);
setprop("an24/ARK-11/mem2/fix5sb", 120.0);
setprop("an24/ARK-11/mem2/fix6sb", 120.0);
setprop("an24/ARK-11/mem2/fix7sb", 120.0);
setprop("an24/ARK-11/mem2/fix8sb", 120.0);
setprop("an24/ARK-11/mem2/fix9sb", 120.0);
setprop("an24/ARK-11/mem2/fix1ff", 0.0);
setprop("an24/ARK-11/mem2/fix2ff", 0.0);
setprop("an24/ARK-11/mem2/fix3ff", 0.0);
setprop("an24/ARK-11/mem2/fix4ff", 0.0);
setprop("an24/ARK-11/mem2/fix5ff", 0.0);
setprop("an24/ARK-11/mem2/fix6ff", 0.0);
setprop("an24/ARK-11/mem2/fix7ff", 0.0);
setprop("an24/ARK-11/mem2/fix8ff", 0.0);
setprop("an24/ARK-11/mem2/fix9ff", 0.0);
setprop("an24/ARK-11/signal-1", 0.0);
setprop("an24/ARK-11/signal-2", 0.0);

#####################################################################
## ARK-11 No. 1
#####################################################################
# ARK No. 1 Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-1", 120.0);
setprop("an24/ARK-11/fine-khz-1", 0.0);
var addfreqs1 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-1");
 var finetune = getprop("an24/ARK-11/fine-khz-1");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-1", finalfreq);
 setprop("/instrumentation/adf[0]/frequencies/selected-khz", finalfreq);
 setprop("/instrumentation/adf[2]/frequencies/selected-khz", finalfreq);
}
 setlistener("an24/ARK-11/sub-band-khz-1", addfreqs1);
 setlistener("an24/ARK-11/fine-khz-1", addfreqs1);

#######################################
#  ARK No. 1 output volume (lowest is best-> antenna at 90° (indication 0°) to source, least interference)
#  adf[2] serves as background reference
#######################################
setprop("an24/ARK-11/mode-1", 0.0 );
setprop("an24/ARK-11/mode-oh", 0.0 );
setprop("an24/ARK-11/volumeknob-1", 0.0 );
setprop("an24/ARK-11/volumeknob-oh", 0.0 );
setprop("an24/ARK-11/vol-1", 0.0 );
setprop("/instrumentation/adf[0]/mode", "off" );
setprop("/instrumentation/adf[0]/indicated-bearing-deg", 180.0 );
setprop("/instrumentation/adf[0]/ident-audible", "true" );
setprop("/instrumentation/adf[0]/serviceable", 1.0 );
setprop("/instrumentation/adf[2]/mode", "off" );
setprop("/instrumentation/adf[2]/indicated-bearing-deg", 0.0 );
setprop("/instrumentation/adf[2]/ident-audible", "true" );
setprop("/instrumentation/adf[2]/serviceable", 1.0 );
setprop("/instrumentation/adf[2]/volume-norm", 1.0 );
setprop("an24/AZS/sw0512", 0.0);
setprop("an24/AZS/sw0513", 0.0);

var arkoutput1 = func {
	if ( getprop("an24/ARK-11/panel_nav_oh") == 0.0 ) {
	var volume_knob = getprop("an24/ARK-11/volumeknob-1");
		if ( getprop("an24/ARK-11/mode-1") != 0.0 ) {
		var powered = getprop("an24/AZS/sw0512") * getprop("an24/AZS/sw0513");
		}
		else {
		var powered = 0.0;
		}
	}
	else {
	var volume_knob = getprop("an24/ARK-11/volumeknob-oh");
		if ( getprop("an24/ARK-11/mode-oh") != 0.0 ) {
		var powered = getprop("an24/AZS/sw0512") * getprop("an24/AZS/sw0513");
		}
		else {
		var powered = 0.0;
		}
	}
#
	var signalstrength = abs(math.cos( 0.017453 * ( 90 + getprop("/instrumentation/adf[2]/indicated-bearing-deg") - getprop("/instrumentation/adf[0]/indicated-bearing-deg") ) ) );
	interpolate("an24/ARK-11/signal-1", signalstrength, 0.4 );

	if ( (getprop("an24/ARK-11/panel_nav_oh") == 0.0 and getprop("an24/ARK-11/mode-1") == 3.0 ) or (getprop("an24/ARK-11/panel_nav_oh") == 1.0 and getprop("an24/ARK-11/mode-oh") == 3.0 ) ) {
	setprop("an24/ARK-11/vol-1", signalstrength * powered );
		}
		else {
		setprop("an24/ARK-11/vol-1", volume_knob * powered );
		}
}
 setlistener("an24/ARK-11/volumeknob-1", arkoutput1);
 setlistener("an24/ARK-11/volumeknob-oh", arkoutput1);
 setlistener("an24/ARK-11/panel_nav_oh", arkoutput1);
 setlistener("an24/ARK-11/mode-1", arkoutput1);
 setlistener("an24/ARK-11/mode-oh", arkoutput1);
 setlistener("/instrumentation/adf[0]/indicated-bearing-deg", arkoutput1);
 setlistener("/instrumentation/adf[2]/indicated-bearing-deg", arkoutput1);
 setlistener("an24/AZS/sw0512", arkoutput1);
 setlistener("an24/AZS/sw0513", arkoutput1);

#####################################################################
## ARK-11 No. 2
#####################################################################
# Summing up frequencies
setprop("an24/ARK-11/sub-band-khz-2", 120.0);
setprop("an24/ARK-11/fine-khz-2", 0.0);
var addfreqs2 = func {
 var subband = getprop("an24/ARK-11/sub-band-khz-2");
 var finetune = getprop("an24/ARK-11/fine-khz-2");
 var finalfreq = finetune + subband ;
 setprop("an24/ARK-11/final-freq-2", finalfreq);
 setprop("/instrumentation/adf[1]/frequencies/selected-khz", finalfreq);
 setprop("/instrumentation/adf[3]/frequencies/selected-khz", finalfreq);
}
 setlistener("an24/ARK-11/sub-band-khz-2", addfreqs2);
 setlistener("an24/ARK-11/fine-khz-2", addfreqs2);

#######################################
#  ARK No. 2 output volume (lowest is best-> antenna at 90° (indication 0°) to source, least interference)
#  adf[3] serves as background reference
#######################################
setprop("an24/ARK-11/mode-2", 0.0 );
setprop("an24/ARK-11/volumeknob-2", 0.0 );
setprop("an24/ARK-11/vol-2", 0.0 );
setprop("/instrumentation/adf[1]/mode", "off" );
setprop("/instrumentation/adf[1]/indicated-bearing-deg", 180.0 );
setprop("/instrumentation/adf[1]/ident-audible", "true" );
setprop("/instrumentation/adf[1]/serviceable", 1.0 );
setprop("/instrumentation/adf[3]/mode", "off" );
setprop("/instrumentation/adf[3]/indicated-bearing-deg", 0.0 );
setprop("/instrumentation/adf[3]/ident-audible", "true" );
setprop("/instrumentation/adf[3]/serviceable", 1.0 );
setprop("/instrumentation/adf[3]/volume-norm", 1.0 );
setprop("an24/AZS/sw0514", 0.0);
setprop("an24/AZS/sw0515", 0.0);

var arkoutput2 = func {
	var volume_knob = getprop("an24/ARK-11/volumeknob-2");
	if ( getprop("an24/ARK-11/mode-2") != 0.0 ) {
	var powered = getprop("an24/AZS/sw0514") * getprop("an24/AZS/sw0515");
	}
	else {
	var powered = 0.0;
	}
	var signalstrength = abs(math.cos( 0.017453 * ( 90 + getprop("/instrumentation/adf[3]/indicated-bearing-deg") - getprop("/instrumentation/adf[1]/indicated-bearing-deg") ) ) );
	interpolate("an24/ARK-11/signal-2", signalstrength, 0.4 );
	if ( getprop("an24/ARK-11/mode-2") == 3.0 ) {
	setprop("an24/ARK-11/vol-2", signalstrength  * powered );
	}
	else {
	setprop("an24/ARK-11/vol-2", volume_knob  * powered );
	}
}
 setlistener("an24/ARK-11/volumeknob-2", arkoutput2);
 setlistener("an24/ARK-11/mode-2", arkoutput2);
 setlistener("/instrumentation/adf[1]/indicated-bearing-deg", arkoutput2);
 setlistener("/instrumentation/adf[3]/indicated-bearing-deg", arkoutput2);
 setlistener("an24/AZS/sw0514", arkoutput2);
 setlistener("an24/AZS/sw0515", arkoutput2);


#####################################################################
# R-802 Stuff
#####################################################################
var add802freqs = func {
 var freq100 = getprop("an24/R-802/dial100");
 var freq10 = getprop("an24/R-802/dial10");
 var freq1 = getprop("an24/R-802/dial1");
 var final802freq = freq100 + freq10 + freq1 / 10 ;
# 6s max from 100-150MHz(shortened a little bit by /10 instead of /8.3)
 var transitiontime = abs((final802freq-getprop("/instrumentation/comm[1]/frequencies/selected-mhz")) / 10);
 setprop("an24/R-802/finalfreq", final802freq);
 interpolate("/instrumentation/comm[1]/frequencies/selected-mhz", final802freq, transitiontime);
}
 setlistener("an24/R-802/dial100", add802freqs);
 setlistener("an24/R-802/dial10", add802freqs);
 setlistener("an24/R-802/dial1", add802freqs);

#  Store dialed freqs in memory
var freqmem = func {
var channel = getprop("an24/R-802/channel");
var curfreq = getprop("an24/R-802/finalfreq");
setprop("an24/R-802/memory/num" ~ channel ~ "", curfreq);
setprop("/instrumentation/comm[0]/frequencies/selected-mhz", curfreq );
}
 setlistener("an24/R-802/dialscrew", freqmem);

#  Transfer freqs from memory to dial
var freqremem = func {
var channel = getprop("an24/R-802/channel");
var storedfreq = getprop("an24/R-802/memory/num" ~ channel ~ "");
interpolate("an24/R-802/dial100", sprintf("%.2s", storedfreq) * 10, 0.2 );
interpolate("an24/R-802/dial10", int(storedfreq) - sprintf("%.2s", storedfreq) * 10, 0.4 );
interpolate("an24/R-802/dial1", (storedfreq - int(storedfreq)) * 10, 0.6 );
setprop("an24/R-802/finalfreq", storedfreq);
setprop("/instrumentation/comm[1]/frequencies/selected-mhz", storedfreq);
}
 setlistener("an24/R-802/memscrew", freqremem);

#  R-802 Choose Channel
var freqchoice = func {
var channel = getprop("an24/R-802/channel");
var storedfreq = getprop("an24/R-802/memory/num" ~ channel ~ "");
# 4s max (shortened a little bit to 2s)
interpolate("/instrumentation/comm[0]/frequencies/selected-mhz", storedfreq, 2.0 );
}
 setlistener("an24/R-802/channel", freqchoice);
 setlistener("an24/R-802/rememscrew", freqchoice);

#####################################################################
# Kurs-MP No.1
#####################################################################
var mp1freq = func {
 var mhz1 = getprop("an24/Kurs-MP/mhz1");
 var dec1 = getprop("an24/Kurs-MP/dec1");
 var finalmp1freq = 108 + mhz1 + dec1;
 setprop("/instrumentation/nav[0]/frequencies/selected-mhz", finalmp1freq);
}
 setlistener("an24/Kurs-MP/mhz1", mp1freq);
 setlistener("an24/Kurs-MP/dec1", mp1freq);

var mp1azimut = func {
 var azim1 = getprop("instrumentation/nav/radials/selected-deg");
 var finalmp1azim10 = int(azim1/10);
 interpolate("an24/Kurs-MP/azim1_10", finalmp1azim10, 0.1);
 interpolate("an24/Kurs-MP/azim1_100", int(finalmp1azim10/10), 0.1);
}
 setlistener("instrumentation/nav/radials/selected-deg", mp1azimut);
 setlistener("sim/signals/fdm-initialized", mp1azimut);

#####################################################################
# Kurs-MP No.2
#####################################################################
var mp2freq = func {
 var mhz2 = getprop("an24/Kurs-MP/mhz2");
	if ( mhz2 == 10.0 ) mhz2 = 0.0;
 var dec2 = getprop("an24/Kurs-MP/dec2");
	if ( dec2 == 1.0 ) dec2 = 0.0;
 var finalmp2freq = 108 + mhz2 + dec2;
 setprop("/instrumentation/nav[1]/frequencies/selected-mhz", finalmp2freq);
}
 setlistener("an24/Kurs-MP/mhz2", mp2freq);
 setlistener("an24/Kurs-MP/dec2", mp2freq);

var mp2azimut = func {
 var azim2 = getprop("instrumentation/nav[1]/radials/selected-deg");
 var finalmp2azim10 = int(azim2/10);
 interpolate("an24/Kurs-MP/azim2_10", finalmp2azim10, 0.1);
 interpolate("an24/Kurs-MP/azim2_100", int(finalmp2azim10/10), 0.1);
}
 setlistener("instrumentation/nav[1]/radials/selected-deg", mp2azimut);
 setlistener("sim/signals/fdm-initialized", mp2azimut);
