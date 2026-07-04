# Hardware Services Restarter Magisk Module

## Descriptions
- Fixes some hardware/vendor services issues like vibrator, camera, charging/USB, SIM card/RIL, display, brightness, WiFi, and thermal on some devices caused by Dolby modules etc.
- Restarts some conflicted hardware/vendor services.
- To fix sensors issue, you have to enable it first, please read Optionals below.

## Changelog

v0.1-R
- Fix script bug

v0.1
- Initial release

  Compared to existing in latest Dolby modules:
  - Restarts android.hardware.vibrator@1.0-service-mediatek, vendor.ril-daemon-mtk, and android.hardware.usb@1.3-service.basic
  - Restarts android.hardware.thermal@2.0-service.mtk if BUGGY MODE detected
  - Restarts android.hardware.sensors@1.0-service-mediatek if hsr.sensor=1

## Requirements
Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- Install this module via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Reboot

## Optionals
- https://t.me/ryukinotes/95
- Global: https://t.me/ryukinotes/35

## Troubleshootings
Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54 (No need logcat but Magisk install log and Z folder only)
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- https://t.me/androidryukimodsdiscussions
- https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25


