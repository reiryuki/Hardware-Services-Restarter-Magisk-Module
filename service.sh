MODPATH=${0%/*}

# log
LOGFILE=$MODPATH/debug.log
exec 2>$LOGFILE
set -x

# wait
sleep 10

# restart
killall vendor.qti.hardware.vibrator.service\
 vendor.qti.hardware.vibrator.service.oneplus9\
 vendor.qti.hardware.vibrator.service.oplus\
 android.hardware.vibrator@1.0-service-mediatek\
 android.hardware.camera.provider@2.4-service_64\
 vendor.mediatek.hardware.mtkpower@1.0-service\
 android.hardware.usb@1.0-service\
 android.hardware.usb@1.0-service.basic\
 android.hardware.usb@1.3-service.basic\
 android.hardware.light-service.mt6768\
 android.hardware.lights-service.xiaomi_mithorium\
 vendor.samsung.hardware.light-service\
 vendor.qti.hardware.lights.service\
 android.hardware.lights-service.qti\
 android.hardware.wifi@1.0-service-lazy
if grep 'BUGGY MODE' /data/adb/modules/*/module.prop; then
  killall vendor.qti.hardware.display.allocator-service\
   vendor.qti.hardware.display.composer-service\
   android.hardware.thermal@2.0-service.mtk\
   camerahalserver qcrilNrd mtkfusionrild
fi
#xkillall android.hardware.sensors@1.0-service\
#x android.hardware.sensors@1.0-service-mediatek\
#x android.hardware.sensors@2.0-service\
#x android.hardware.sensors@2.0-service-mediatek\
#x android.hardware.sensors@2.0-service.multihal\
#x android.hardware.sensors@2.0-service.multihal-mediatek
#akillall PROC

# wait
until [ "`getprop sys.boot_completed`" == 1 ]; do
  sleep 1
done

# function
restart_init_services() {
for NAME in $NAMES; do
  if [ "`getprop init.svc.$NAME`" == stopped ]; then
    start $NAME
  fi
done
}

# restart
NAMES=vendor.ril-daemon-mtk
restart_init_services
#iNAMES="SVC"
#irestart_init_services






