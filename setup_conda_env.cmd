echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test

echo Trying to create new conda environment %targetenv%

call %root%\Scripts\activate.bat %root%

call conda update conda
call conda activate %targetenv%

set envpath=%CONDA_PREFIX%
for %%F in (%envpath%) do set thisenv=%%~nxF

if %thisenv% == %targetenv% (
	echo Target conda env, %targetenv%, already exists. Skipping conda env creation
) else (
	echo Creating conda environment %targetenv%
	call conda create -n %targetenv% python=3.6 anaconda
	call conda activate %targetenv%
	call pip install tensorflow-gpu hyperchamber nashpy pygame natsort opencv-python  
)

echo Done setting up conda env




