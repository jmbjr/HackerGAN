set root=C:\ProgramData\Anaconda3
set newenv=hypergan_test

echo OFF

call %root%\Scripts\activate.bat %root%

call conda update conda
call conda env remove --name %newenv%
call conda create -n %newenv% python=3.6 anaconda
call conda activate %newenv%
call pip install tensorflow-gpu hyperchamber nashpy pygame natsort opencv-python  



