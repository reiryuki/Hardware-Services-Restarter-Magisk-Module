# space
ui_print " "

# var
UID=`id -u`
[ ! "$UID" ] && UID=0

# log
if [ "$BOOTMODE" != true ]; then
  FILE=/data/media/"$UID"/$MODID\_recovery.log
  ui_print "- Log will be saved at $FILE"
  exec 2>$FILE
  ui_print " "
fi

# optionals
OPTIONALS=/data/media/"$UID"/optionals.prop
if [ ! -f $OPTIONALS ]; then
  touch $OPTIONALS
fi

# debug
if [ "`grep_prop debug.log $OPTIONALS`" == 1 ]; then
  ui_print "- The install log will contain detailed information"
  set -x
  ui_print " "
fi

# recovery
if [ "$BOOTMODE" != true ]; then
  MODPATH_UPDATE=`echo $MODPATH | sed 's|modules/|modules_update/|g'`
  rm -f $MODPATH/update
  rm -rf $MODPATH_UPDATE
fi

# info
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " ID=$MODID"
ui_print " Version=$MODVER"
ui_print " VersionCode=$MODVERCODE"
if [ "$KSU" == true ]; then
  ui_print " KSUVersion=$KSU_VER"
  ui_print " KSUVersionCode=$KSU_VER_CODE"
  ui_print " KSUKernelVersionCode=$KSU_KERNEL_VER_CODE"
else
  ui_print " MagiskVersion=$MAGISK_VER"
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE"
fi
ui_print " "

# sensor
if [ "`grep_prop hsr.sensor $OPTIONALS`" == 1 ]; then
  ui_print "- Restarts hardware sensor services"
  ui_print "  This causes bootloop in some ROMs"
  sed -i 's|#x||g' $MODPATH/service.sh
  ui_print " "
fi

# additional by user
PROC=`grep_prop hsr.add $OPTIONALS`
if [ "$PROC" ]; then
  ui_print "- Restarts processes:"
  ui_print "  $PROC"
  ui_print "  Please Do with Your Own Risk!"
  sed -i -e "s|PROC|$PROC|g" -e 's|#a||g' $MODPATH/service.sh
  ui_print " "
fi
SVC=`grep_prop hsr.add_init $OPTIONALS`
if [ "$SVC" ]; then
  ui_print "- Restarts init services:"
  ui_print "  $SVC"
  ui_print "  Please Do with Your Own Risk!"
  sed -i -e "s|SVC|$SVC|g" -e 's|#i||g' $MODPATH/service.sh
  ui_print " "
fi

# cleaning
rm -rf $MODPATH/image







