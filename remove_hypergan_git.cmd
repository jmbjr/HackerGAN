echo OFF

set hypergan=https://github.com/HyperGAN/HyperGAN.git
set hgfolder=HyperGAN

IF  EXIST %hgfolder% (
	echo Deleting %hgfolder% repo
	rmdir %hgfolder% /S
) ELSE (
	echo %hgfolder% doesn't exist. exiting.
	exit
)


