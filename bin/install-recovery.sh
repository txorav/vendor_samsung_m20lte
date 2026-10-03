#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):28162048:19b22d71a648044b6740bc1c6909c1cc8020b1f4; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/BOOT$(getprop ro.boot.slot_suffix):20129792:ae585150fa1184f562f42721181e4a68c53ea577 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):28162048:19b22d71a648044b6740bc1c6909c1cc8020b1f4 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
