# Install Pepper Flash plugin

See https://ask.fedoraproject.org/en/question/60009/updating-adobe-flash-firefox/?answer=64885#post-id-64885

This is now even simpler:
* remove Adobe's Flash player (if installed): sudo dnf remove flash-plugin
* install freshplayerplugin from RPMFusion: sudo dnf install freshplayerplugin
* download the standalone Pepper Flash plugin from https://get.adobe.com/flashplayer/oth... (Choose Linux 64-bit, FP 22.0 (or later) for other Linux 64-bit, PPAPI) as ~/flash_player_ppapi_linux.x86_64.tar.gz
* extract its contents:
  - sudo mkdir -p /usr/lib64/chromium-browser/PepperFlash
  - cd /usr/lib64/chromium-browser/PepperFlash
  - sudo tar -xf ~/Apps/flash_player_ppapi_linux.x86_64.tar.gz
