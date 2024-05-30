****************************************************************
*                      PS3 ISO TOOLS V1.97B                    *
* by Rudi Rastelli                                             *
****************************************************************
* Credits:                                                     *
* @Estwald for "makeps3iso", "extractps3iso" and "patchps3iso" *
****************************************************************

Description:
************
"PS3 ISO TOOLS" is an all-in-one tool for a complete PS3-ISO handling and contains:

- ISO-Generator to convert PS3-Folder-Format-Games 2 PS3-ISO-Format-Games (splitted big-files will be joined) 
- ISO-Extractor to convert PS3-ISO-Format-Games 2 PS3-Folder-Format-Games (big-files will be optionaly splitted)
- ISO-Splitter  to split single PS3-ISOs for use on a FAT32 device ("*.iso.0", "*.iso.1", ...etc)
- ISO-Joiner    to join splitted PS3-ISOs into single PS3-ISOs
- ISO-Modifier  to rename single or splitted PS3-ISOs according to game-info found in "PARAM.SFO"-file
                to hide/un-hide parts of splitted ISOs ("*.iso.1", "*.iso.2", ...etc)
                to extract and save "PARAM.SFO" and "ICON0.PNG" as "[ISO-name].SFO" respectively "[ISO-name].PNG" within ISO-folder
- ISO-Patcher   to patch single or splitted PS3-ISOs to a lower firmware version (down to 4.21)


Usage:
******
Pretty self-explanatory... read the tool-tips


Notes:
******
- You can batch-convert all of your PS3-Folder-Format-Games, when you select your game-archive as source-folder(eg "X:\GAMES" or "X:\GAMESZ")
- All other tools, with the exception of ISO-Patcher, support batch-operation as well. Just multi-select the ISOs you like to process.
- As default ISO-names will NOT contain special ASCII-characters 0-31, 126-255 and also NOT /\:*?"<>| ... This is to avoid problems with webMAN
  (You can allow usage of special ASCII-characters 126-255, like '™' or '®' in "ISO-conversion-Options")
- After conversion/extraction a log-file will be shown, which compares size and number of files/folders.
  An eventually existing firmware-update-file 'PS3UPDAT.PUP' will be left out of the ISO. Because of this log-file reports that the generated ISO
  about 256MB less than the source game-folder. This is no problem and status in log-file will be 'OK' in such a case.
  

Tipps:
******
- While converting to ISO-format "PARAM.SFO" and "ICON0.PNG"(Game-Icon)  will be placed (hidden) as "[ISO-name].SFO" and "[ISO-name].PNG" at target-folder.
  If you use webMAN copy these 2 files(per game) to "/dev_hdd0/tmp/wmtmp/". This will save you the effort to mount each game at least once to make webMAN display it's game-icon.
- Aborted batch-conversions could be continued. Already finished conversions will be skipped.
- To patch ISOs under Windows 8(.1) click right on "PS3_ISO_TOOLS.exe" and choose "Run as administrator".


Regards
 Rudi
