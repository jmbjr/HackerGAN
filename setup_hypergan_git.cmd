echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test
set hypergan=https://github.com/HyperGAN/HyperGAN.git
set hgfolder=HyperGAN

IF  EXIST %hgfolder% (
	echo %hgfolder% EXISTS. Please remove %hgfolder% repo folder before running this setup script again.
	echo You can run remove_hypergan_git.cmd to do this.
	echo Setup will now exit
	exit
)

git clone %hypergan%

call %root%\Scripts\activate.bat %root%
call conda activate %targetenv%

set envpath=%CONDA_PREFIX%
for %%F in (%envpath%) do set thisenv=%%~nxF

if %thisenv% == %targetenv% (
	echo Setting up HyperGAN develop mode
	cd HyperGAN
	call python setup.py develop
) else (
	echo Unable to activate %targetenv% conda environment.
	echo Program will now end. Run setup_conda_env.bat first and verify environment is properly installed.
	exit
)




