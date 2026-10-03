# RestlessOS 16 (arm64-ab) LIGHT for m20lte — unpacked modified system

Base: `RestlessOS-arm64-ab-16.0.0-202606230923.img` (treble_arm64_bvN user build).
This branch holds the full modified tree **except** 2 binaries over GitHub's
100MB file cap — run `./fetch-binaries.sh <base img>` to restore them, then
verify with `manifest.md5`.

## Modifications vs stock (472 entries removed)
- 16 debloated apps (~180MB): talkback, SpeechServices, LiveWallpapersPicker,
  Traceur, DeviceAsWebcam, BasicDreams, PhotoTable, ThemesStub, print stack
  (3), DSU service, QcRilAm, MtkInCallService, bookmark providers
- 368 foreign-device `treble-overlay-*` APKs (kept: 77 samsung-* + NavBar,
  NightMode, FalseLocks, Telephony-LTE, devinputjack)
- MTK leftovers: `bin/mtk-sms-fwk-ready`, `etc/init/mtk-sms-fwk-ready.rc`,
  mtk-ims overlays
- `system/build.prop`: maintainer credit (`ro.restless.maintainer=TXOR`,
  `ro.build.user/host=TXOR`)
- Symlinks use on-device `/system/...` targets (as in the image)

## Rebuild image (needs root for mount OR debugfs flow)
Layout here mirrors the partition root: `system/` + root symlinks.
Original image size: 3156676608 bytes, label `/`, contexts from
`system/etc/selinux/plat_file_contexts`.

## Pairs with
- Vendor: `main` branch of this repo (pristine Lineage m20lte vendor)
- Kernel: `grapheneos-fixes` @ txorav/kernel_samsung_universal7885
