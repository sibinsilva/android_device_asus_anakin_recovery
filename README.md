# OrangeFox device tree for ASUS ROG Phone 5S (anakin / ASUS_I005D)

Auto-generated with [twrpdtgen](https://github.com/twrpdtgen/twrpdtgen) against a real
`boot.img` from this project's own `derp_anakin-userdebug` build
(`BUILD_ID TQ3A.230901.001`, built 2026-08-29), then hand-corrected against known-good
values from the ANAKIN bring-up project (`device/asus/anakin`, `kernel/asus/sm8350`).

**This has not been built or tested yet.** It's a real, accurate starting scaffold - not
a working recovery. Building it and getting it to actually boot/decrypt is separate work.

## What's confirmed accurate

- `recovery.fstab` - all partition names/types/flags extracted directly from the real
  boot image (matches this device's actual A/B + dynamic-partition layout: system/vendor/
  product/odm/system_ext as logical+slotselect, data as f2fs, plus ASUS-specific raw
  partitions like `asusfw`/`qmcs`/`bt_firmware`/`dsp`).
- `BOARD_SUPER_PARTITION_SIZE` / `BOARD_QTI_DYNAMIC_PARTITIONS_SIZE` - corrected to the
  real values from this device's own `fastboot getvar all` output and this project's
  actual `lpmake` build logs (the generator's guesses here were wrong - see git history).
- `TARGET_KERNEL_SOURCE`/`TARGET_KERNEL_CONFIG` - corrected to this project's real kernel
  repo (`kernel/asus/sm8350`, `kirisakura_defconfig`) - the generator guessed a
  nonexistent `kernel/asustek/anakin` path.
- `BUILD_FINGERPRINT`, `bootctrl.lahaina`, `TARGET_BOARD_PLATFORM := lahaina` - all
  genuinely extracted from the real boot image, not template placeholders.
- `recovery/root/init.asus.recovery.rc` - real ASUS/Qualcomm USB-gadget configfs setup,
  extracted from the actual ramdisk (needed for adb/sideload to work in recovery at all).

## What's NOT yet done - the hard part

- **FBE decryption bridging is completely unaddressed.** This device uses QTI's
  keymaster/gatekeeper stack with an SPU subsystem this project already found and
  disabled for the main ROM (see the ANAKIN project's screen-lock/SPU fix). A working
  recovery needs its own path to communicate with the same TEE/QSEE stack to decrypt
  `/data` - this is device-specific glue code the generator cannot produce, and is
  historically the hardest, most failure-prone part of any modern recovery port.
- `vendor/omni/config/common.mk` inherit path in `fox_anakin.mk` is unverified - it's
  what OrangeFox has historically forked from, but hasn't been confirmed against an
  actual OrangeFox manifest sync yet.
- Never actually synced or built - first real build attempt will surface missing
  dependencies, wrong assumptions, and things this README doesn't know about yet.

## Source

- Real boot image: this project's `derp_anakin-userdebug` build, `out/target/product/anakin/boot.img`
- Cross-referenced against: `device/asus/anakin/BoardConfigCommon.mk`,
  `kernel/asus/sm8350/arch/arm64/configs/kirisakura_defconfig`, and real
  `fastboot getvar all` output from the physical device.
