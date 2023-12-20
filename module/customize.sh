# Error on < Android 8.
if [ "$API" -lt 26 ]; then
    abort "- !!! You can't use this module on Android < 8.0"
fi

# safetynet-fix module is obsolete and it's incompatible with PIF.
if [ -d /data/adb/modules/safetynet-fix ]; then
	rm -rf /data/adb/modules/safetynet-fix
	rm -f /data/adb/SNFix.dex
    ui_print "! safetynet-fix module will be removed. Do NOT install it again along PIF."
fi

# MagiskHidePropsConf module is obsolete in Android 8+ but it shouldn't give issues.
if [ -d /data/adb/modules/MagiskHidePropsConf ]; then
    ui_print "! WARNING, MagiskHidePropsConf module may cause issues with PIF."
fi

# Remove xiaomi.eu apps

if [ -d "/product/app/XiaomiEUInject" ]; then
	
	directory="$MODPATH/product/app/XiaomiEUInject"

	[ -d "$directory" ] || mkdir -p "$directory"

	touch "$directory/.replace"
		
	ui_print "- XiaomiEUInject app removed."
fi

# Remove EliteRoms app
	
if [ -d "/system/app/XInjectModule" ]; then
	
	directory="$MODPATH/system/app/XInjectModule"

	[ -d "$directory" ] || mkdir -p "$directory"

	touch "$directory/.replace"
		
	ui_print "- XInjectModule app removed."
fi

if [ -d "/system/app/EliteDevelopmentModule" ]; then
	
	directory="$MODPATH/system/app/EliteDevelopmentModule"

	[ -d "$directory" ] || mkdir -p "$directory"

	touch "$directory/.replace"
		
	ui_print "- EliteDevelopmentModule app removed."
fi

ui_print "! DO NOT REMOVE /data/adb/modules/playintegrityfix/pif.json"
ui_print "! THIS FILE CONTAINS THE DEFAULT PROPS TO SPOOF A CERTIFIED DEVICE"
ui_print "! IF YOU WANT TO USE YOUR CUSTOM PROPS, COPY THIS FILE TO /data/adb/pif.json"
ui_print "! MODULE WILL READ FIRST THAT FILE, IF IT ISN'T EXIST, IT WILL READ THE MODULE FOLDER ONE"
ui_print "! IF YOU REMOVE BOTH FILES EXPECT CRASHES"