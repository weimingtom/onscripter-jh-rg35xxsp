# onscripter-jh-rg35xxsp
[WIP] My ONScripter-jh RG35XXSP port

## bugs, todo  
* Not support HDMI display output
* Key mapping  
* Key and joystick event on same time
* Auto mode may be bad (keycode a)  
* Not support volume up / down, default volume 100 is too loud, change to 10 (#define DEFAULT_VOLUME 100)  
* Toolchain same as MIYOO A30, some so files exist for a30 but rg35xxsp not, be careful  

## About volume control  
* see https://github.com/weimingtom/onscripter-jh-rg35xxsp/blob/master/ONScripter_event.cpp
```
if (button == 14 || button == 0x40000080) {
//volume up
char str[256] = {0};
++volume;
if (volume > 31) volume = 31;
if (volume < 0) volume = 0;
//https://steward-fu.github.io/website/handheld/rg28xx_volume.htm
sprintf(str, "amixer set 'lineout volume' %d", volume);
system(str);
}
if (button == 13 || button == 0x40000081) {
//volume down
char str[256] = {0};
--volume;
if (volume > 31) volume = 31;
if (volume < 0) volume = 0;
//https://steward-fu.github.io/website/handheld/rg28xx_volume.htm
sprintf(str, "amixer set 'lineout volume' %d", volume);
system(str);
}
```
* see https://steward-fu.github.io/website/handheld/rg28xx_volume.htm
```
如何控制音量
步驟如下：
# amixer set 'lineout volume' 10
P.S. Range 0-31
```

## About HDMI output
* Write and put a .sh shell file like vendor/ons_rg35xxsp.sh to SDCARD:/Roms/APPS.    
* Execute SDL2 Programme from 'main menu -> App -> Apps', instead from file manager.    
* I'm not sure this method is good, it will cause the audio doesn't come from HDMI but from the handheld.    
```
关于RG35XXSP的HDMI输出问题，我决定放弃研究，因为它自带的/mnt/vendor/bin/fbtest3应该是用了libcedarx之类的全志私有的多媒体库，
我找不到太多资料，所以不会研究这个。我发现另一个办法，但不一定有效，就是不要从文件管理器打开SDL2程序，
而是写一个sh脚本放入SD卡盘符:/Roms/APPS目录中，然后从应用中心-Apps进入SDL2程序，就能实现HDMI输出，
但这种方法的坏处可能会导致声音不是走HDMI而是可能从掌机的扬声器发出
```
