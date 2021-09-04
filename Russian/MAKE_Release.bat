set ThisDir0=%~dp0
call %ThisDir0%Scripts\MAKE_AudioRussian.bat
call %ThisDir0%Scripts\MAKE_INIRussian.bat
call %ThisDir0%Scripts\MAKE_Movies.bat
call %ThisDir0%Scripts\MAKE_Russian.bat
call %ThisDir0%Scripts\MAKE_SpeechRussian.bat
call %ThisDir0%Scripts\MAKE_TexturesRussian.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\* %GeneratedReleaseUnpackedDir%\*

:: Define archive name(s)
set ArchiveName=Russian

:: Generate Archive(s)
tar.exe -a -c -C %GeneratedReleaseUnpackedDir% -f %ReleaseDir%\%ArchiveName%.zip *.*
