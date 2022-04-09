:: n-grader
:: build by nabil_aba
:: hasil natap leptop satu hari satu malam
:: my-github: github.com/nabilaba
:: copyright 2022

@echo off
cls
echo %cd%
for /f %%i in ('grader-cli version') do set versi-grader-cli=%%i
echo ********************************
echo *         n-grader v1          *
echo *      build by nabil_aba      *
echo ********************************
echo.
for %%* in (.) do set n-grader-namafolder=%%~n*
echo List sesuai grader-cli versi %versi-grader-cli%
echo 1. Test "%n-grader-namafolder%" saja
echo 2. Test "%n-grader-namafolder%" pakai benar salah
echo 3. Submit "%n-grader-namafolder%" ke Grader Ruangguru
echo.
set /p pilihan= "Di folder "%n-grader-namafolder%" mau ngapain? "
IF %pilihan%==1 (
echo Okey, test %n-grader-namafolder% sedang berjalan
grader-cli test ../%n-grader-namafolder%
echo.
)
if %pilihan%==2 (
echo Okey, test %n-grader-namafolder% pakai benar salah sedang berjalan
grader-cli test ../%n-grader-namafolder% -v
echo.
)
if %pilihan%==3 (
echo Okey, submit %n-grader-namafolder% ke grader ruangguru sedang berjalan
grader-cli test ../%n-grader-namafolder%
echo.
)
echo Dah ya, Tekan Enter untuk keluar
pause >nul