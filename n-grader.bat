:: n-grader v4
:: build by nabil_aba
:: my-github: github.com/nabilaba
:: copyright 2022

@echo off
cls
if "%ProgramFiles(x86)%" == "C:\Program Files (x86)" goto 64bit
:32Bit
"%~dp0ansicon\x86\ansicon.exe" -p
goto cek64bitsupportdone

:64bit
"%~dp0ansicon\x64\ansicon.exe" -p
:cek64bitsupportdone

for /f "delims=" %%i in ('git rev-parse --show-toplevel') do set rootGit=%%i
for /f "delims=" %%i in ('git rev-parse --show-prefix') do set prefixGit=%%i
echo %rootGit%/%prefixGit%
echo.

echo [92mn-grader v4
echo build by nabil_aba[0m
echo.
echo List pilihan
for %%* in (.) do set n-grader-namafolder=%%~n*
echo 1. Test [96m%n-grader-namafolder%[0m saja
echo 2. Test [96m%n-grader-namafolder%[0m pakai benar salah
echo 3. Submit [96m%n-grader-namafolder%[0m ke Grader Ruangguru
echo 4. Cek versi gradle-cli
echo 5. Unduh grader-cli terakhir
echo. & goto milih

:test1
echo Okey, test [96m%n-grader-namafolder%[0m sedang berjalan
echo.
cd %rootGit%
grader-cli test %prefixGit%
echo.
set /p mausubmit= "Mau submit? (Y/N) "
if %mausubmit%==Y goto yakinsubmit
echo.
echo Yaudah
goto end

:test2
echo Okey, test [96m%n-grader-namafolder%[0m pakai benar salah sedang berjalan
echo.
cd %rootGit%
grader-cli test %prefixGit% -v
echo.
set /p mausubmit= "Mau submit? (Y/N) "
if %mausubmit%==Y goto yakinsubmit
echo.
echo Yaudah
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
cd %rootGit%
grader-cli submit %prefixGit%
echo Selamat.. tugas anda telah selesai
goto end

:cekversi
echo.
for /f %%i in ('grader-cli version') do set versi-grader-cli=%%i
echo grader-cli mu versi [93m%versi-grader-cli%[0m
goto end

:download
echo Tanyakan instruktur apakah ada update tidak sebelum mengunduh, daripada buang-buang kuota
set /p udahnanya= "Ada update? Jika iya, apakah mau download? (Y/N) "
if %udahnanya%==Y goto mendownload
echo.
echo Yaudah gajadi
goto end

:mendownload
echo.
echo Lokasi unduhan ada di folder Downloads PC masing-masing dengan nama gradle-cli.exe
echo.
if "%ProgramFiles(x86)%" == "C:\Program Files (x86)" goto grader64bit
:grader32bit
curl https://storage.googleapis.com/rg-grader/latest/grader-cli-windows-i386.exe --output "%USERPROFILE%\Downloads\grader-cli.exe"
goto end
:grader64bit
curl https://storage.googleapis.com/rg-grader/latest/grader-cli-windows-amd64.exe --output "%USERPROFILE%\Downloads\grader-cli.exe"
goto end

:milih
set /p pilihan= "Di folder [96m%n-grader-namafolder%[0m mau ngapain? "
if %pilihan%==1 goto test1
if %pilihan%==2 goto test2
if %pilihan%==3 goto yakinsubmit
if %pilihan%==4 goto cekversi
if %pilihan%==5 goto download

:gamilih
echo.
echo Pilihanmu ga ada di list
echo Pilih pakek nomer saja
echo.
goto milih

:end
echo.
echo Tekan Enter untuk menutup
pause >nul