set ThisDir1=%~dp0
call %ThisDir1%SETUP_Folders.bat

:: Define big file name(s)
set BigName=820_W3DRussianZH

:: Free folders of big file contents
del /f /q /s %GeneratedBigFilesUnpackedDir%\%BigName%
del /f /q    %GeneratedBigFilesDir%\%BigName%.big

:: Copy .big contents
xcopy /y %GameFilesDir%\Data\Russian\Art\W3D\*.* %GeneratedBigFilesUnpackedDir%\%BigName%\Data\Russian\Art\W3D\

:: Generate .big file(s)
%ToolsDir%\GeneralsBigCreator\GeneralsBigCreator.exe -source %GeneratedBigFilesUnpackedDir%\%BigName% -dest %GeneratedBigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /y %GeneratedBigFilesDir%\%BigName%.big %GeneratedReleaseUnpackedDir%\%BigName%.big*
