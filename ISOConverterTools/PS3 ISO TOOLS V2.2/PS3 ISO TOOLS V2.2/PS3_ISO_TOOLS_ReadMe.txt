*****************************************************************
*                       PS3 ISO TOOLS V2.1                      *
* by Rudi Rastelli                                              *
*****************************************************************
* Credits:                                                      *
* @Estwald for "extractps3iso" & "patchps3iso"                  *
* @Rip Cord for "resign_eboot", "resprx", "resspu" & "selfinfo" *
* @erbse68, Dennis S., @masa3108 for testing                    *
*****************************************************************

Description:
************
"PS3 ISO TOOLS" is an all-in-one tool for ODE- and CFW-users and features:

- ISO-Generator to convert PS3-Folder-Format-Game(s) 2 PS3-ISO-Format-Game(s) (splitted big-files automatically will be joined) 
- ISO-Extractor to convert PS3-ISO-Format-Game(s) 2 PS3-Folder-Format-Game(s) (big-files will be optionaly splitted)
- ISO-Splitter  to split single PS3-ISO(s) for use on a FAT32 device ("*.iso.0", "*.iso.1", ...etc)
- ISO-Joiner    to join splitted PS3-ISO(s) into single PS3-ISO(s)
- ISO-Modifier  to rename single or splitted PS3-ISO(s) according to game-info found in "PARAM.SFO"-file
                to add '[auto]'- and '[online]'-tags to ISO-filename(s) (regarding the 'webMAN_mod' functionality)
                to hide/un-hide parts of splitted ISO(s) ("*.iso.1", "*.iso.2", ...etc)
                to extract and save "PARAM.SFO" and "ICON0.PNG" as "[ISO-name].SFO" respectively "[ISO-name].PNG" within ISO-folder
- ISO-Patcher   to 'dirty' patch single or splitted PS3-ISO(s) to a lower firmware version (down to 4.20)... JUST FOR CFW FROM 4.20
- Game-Patcher  to 'properly' patch PS3-Folder-Format-Game(s) to firmware version 3.55... FOR ODE- AND CFW-USERS


Usage:
******
Pretty self-explanatory(I hope)... read the tool-tips


Notes:
******
- It's important to set up your PS3-System on main window, because PS3 ISO TOOLS will make some preselections depending from that.

- To batch-convert games, select a folder containing several games in folder-format(recursive scan)

- All other tools, with the exception of ISO-Patcher, support batch-operation as well. Just multi-select the ISOs you like to process.

- If you select a FAT32-drive as target for folder-format to ISO-format conversion the resulted ISO(s) will be split even without selecting the split-option

- As default ISO-name(s) will NOT contain special ASCII-characters 0-31, 126-255 and also NOT /\:*?"<>| ... This is to avoid problems with webMAN
  (You can allow usage of special ASCII-characters 126-255, like '™' or '®' in "ISO-conversion-Options")

- After conversion/extraction a log-file will be shown, which compares size and number of files.

- 'Proper' patching is possible only for 3.55, because ps3-private-keys above 3.55, which are needed for signing, are not yet released to the public. 
  

Tipps:
******
- If you've choosen to extract "PARAM.SFO" and "ICON0.PNG"(Game-Icon) while converting to ISO-format, the 2 files will be placed hidden as "[ISO-name].SFO" and "[ISO-name].PNG" at target-folder.
  If you use webMAN copy these 2 files(per game) to "/dev_hdd0/tmp/wmtmp/". This will save you the effort to mount each game at least once to make webMAN display it's game-icon.

- Make sure game-folder or any file inside game-folder isn't opened in any way before starting conversion.

- Aborted batch-conversions could be continued. Already finished conversions will be skipped.

- Find the options to patch a game to a lower firmware within the "Create ISO(s) Options".
  First try the default options("If needed"). Then game(s) will only be patched when it's firmware version is higher as the set firmware version of your PS3-System
  If PS3 ISO TOOLS does not patch anything and game doesn't work try the "Always"-Option.
  The "Don't Create ISO(s)"-Option is just for CFW-Users who wan't to just patch the Game(s) in PS3-Folder-Format without creating an ISO(s) subsequently

- Two zip files will be created while patching. They will be stored in 2 different folders named "ORIGINAL_FILES_ARCHIVE" and "PATCHED_FILES_ARCHIVE". One contains
  backups of the original files which needs patching. And the other one the patched files. In order to restore just unzip the zip-file containing the original files
  to the game-folder and you're done.
  
- 1st try your game(s) without installed game-update(s)

Regards
 Rudi
