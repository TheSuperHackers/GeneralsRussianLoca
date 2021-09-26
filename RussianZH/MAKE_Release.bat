set ThisDir0="%~dp0."
call %ThisDir0%\Scripts\MAKE_AudioRussianZH.bat
::call %ThisDir0%\Scripts\MAKE_INIRussianZH.bat
call %ThisDir0%\Scripts\MAKE_Movies.bat
call %ThisDir0%\Scripts\MAKE_RussianZH.bat
call %ThisDir0%\Scripts\MAKE_SpeechRussianZH.bat
call %ThisDir0%\Scripts\MAKE_Splash.bat
call %ThisDir0%\Scripts\MAKE_W3DRussianZH.bat

:: Copy base release files
xcopy /y /s %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDir%\*

:: Define archive name(s)
set ArchiveName=%TargetLanguage%ZH_v1.0

:: Generate Archive(s)
tar.exe -a -c -C %GeneratedReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
