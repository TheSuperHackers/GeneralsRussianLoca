# GeneralsRussianLoca
Russian Localization for Generals Zero Hour

#### Important folders and files
* Russian > Contains all russian source and build files for Generals
* RussianZH > Contains all russian source and build files for Generals Zero Hour
* Tools\Registry\ActivateEnglish.reg > Apply English language in game
* Tools\Registry\ActivateRussian.reg > Apply Russian language in game

#### Consideration
Native game languages are configured via registry key: REG_SZ: Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Electronic Arts\EA Games\Generals\Language. One can repurpose this language string to add entirely new languages, however this unfortunately will break all .bik videos from showing in game. Therefore Russian language files will be used in 'English' directories and language setting. User facing Russian language option needs to be emulated.
