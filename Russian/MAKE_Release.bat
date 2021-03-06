set ThisDir0="%~dp0."
call %ThisDir0%\Scripts\MAKE_AudioRussian.bat
call %ThisDir0%\Scripts\MAKE_Movies.bat
call %ThisDir0%\Scripts\MAKE_Russian.bat
call %ThisDir0%\Scripts\MAKE_SpeechRussian.bat
call %ThisDir0%\Scripts\MAKE_Splash.bat
call %ThisDir0%\Scripts\MAKE_TexturesRussian.bat

:: Copy base release files
xcopy /y /s %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDir%\*

:: Define archive name(s)
set ArchiveName=Generals-108-%TargetLanguage%-v1.0

:: Generate Archive(s)
tar.exe -a -c -C %GeneratedReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
