:: n-grader v2
:: build by nabil_aba
:: my-github: github.com/nabilaba
:: copyright 2022

@echo off & setlocal
cls
if "%ProgramFiles(x86)%" == "C:\Program Files (x86)" goto 64bit
:32Bit
"%~dp0ansicon\x86\ansicon.exe" -p
goto cek64bitsupportdone

:64bit
"%~dp0ansicon\x64\ansicon.exe" -p
:cek64bitsupportdone

echo %cd%
echo.
echo [92mn-grader v2
echo build by nabil_aba[0m
echo.
for /f %%i in ('grader-cli version') do set versi-grader-cli=%%i
for %%* in (.) do set n-grader-namafolder=%%~n*
echo List sesuai grader-cli versi [93m%versi-grader-cli%[0m
echo 1. Test [96m%n-grader-namafolder%[0m saja
echo 2. Test [96m%n-grader-namafolder%[0m pakai benar salah
echo 3. Submit [96m%n-grader-namafolder%[0m ke Grader Ruangguru
echo. & goto milih

:test1
echo Okey, test [96m%n-grader-namafolder%[0m sedang berjalan
echo.
grader-cli test ../%n-grader-namafolder%
echo.
echo Sudah selesai
goto end

:test2
echo Okey, test [96m%n-grader-namafolder%[0m pakai benar salah sedang berjalan
echo.
grader-cli test ../%n-grader-namafolder% -v
echo.
echo Sudah selesai
goto end

:yakinsubmit
set /p yakinga= "Yakin mau submit? (Y/N) "
if %yakinga%==Y goto submit
echo.
echo Yaudah gajadi
goto end

:submit
echo Okey, submit [96m%n-grader-namafolder%[0m ke grader ruangguru sedang berjalan
echo.
grader-cli submit ../%n-grader-namafolder%
echo.
echo Sudah selesai
goto end

:milih
set /p pilihan= "Di folder [96m%n-grader-namafolder%[0m mau ngapain? "
if %pilihan%==1 goto test1
if %pilihan%==2 goto test2
if %pilihan%==3 goto yakinsubmit

:gamilih
echo.
echo Pilihanmu ga ada di list
echo Pilih pakek nomer saja
echo.

:end
echo.
echo Tekan Enter untuk menutup
pause >nul