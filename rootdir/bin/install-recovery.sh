#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:942678d193df0836c77eaa918566a35441c9c687; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot$(getprop ro.boot.slot_suffix):100663296:3bb54abbc4e3220d3387fb023706ac6839ad75f5 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:942678d193df0836c77eaa918566a35441c9c687 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
