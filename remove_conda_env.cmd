echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test

echo Removing conda %targetenv% environment

call %root%\Scripts\activate.bat %root%
call conda env remove --name %targetenv%

echo Done

