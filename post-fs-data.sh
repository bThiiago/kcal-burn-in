LOG=/data/media/0/KCAL/kvision.log

[[ -e ${KLOG} ]] && rm -rf "${KLOG}"

# Preset
echo "1" >"/sys/devices/platform/kcal_ctrl.0/kcal_enable"
echo "236 238 240" >"/sys/devices/platform/kcal_ctrl.0/kcal"
echo "275" >"/sys/devices/platform/kcal_ctrl.0/kcal_sat"
echo "253" >"/sys/devices/platform/kcal_ctrl.0/kcal_val"
echo "258" >"/sys/devices/platform/kcal_ctrl.0/kcal_cont"

[[ $? == "0" ]] && {
	echo "[*] KCAL preset executed without any errors!" >"${KLOG}"
	exit 0
} || {
	service call SurfaceFlinger 1023 i32 0 >/dev/null 2>&1
	service call SurfaceFlinger 1022 f 1.5 >/dev/null 2>&1
	echo "[!] KCAL preset executed with errors, using SF native saturation boost function instead." >"${KLOG}"
	exit $?
}