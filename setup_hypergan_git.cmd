set root=C:\ProgramData\Anaconda3
set newenv=hypergan_test
set hypergan=https://github.com/HyperGAN/HyperGAN.git
set hgfolder=HyperGAN

echo OFF

IF  EXIST %hgfolder% (
	echo %hgfolder% EXISTS. Please remove %hgfolder% repo folder before running this setup script again.
	echo Setup will now exit
	exit
)

git clone %hypergan%

call %root%\Scripts\activate.bat %root%
call conda activate %newenv%

cd HyperGAN
call python setup.py develop


