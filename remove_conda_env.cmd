echo OFF

set root=C:\ProgramData\Anaconda3
set newenv=hypergan_test

call %root%\Scripts\activate.bat %root%
call conda env remove --name %newenv%



