echo OFF

set samplesdir=samples
set savesdir=saves

if Exist %samplesdir% (
	echo Deleting %samplesdir% folder and images.
	rmdir %samplesdir% /S
)

if Exist %savesdir% (
	echo Deleting %savesdir% folder and images.
	rmdir %savesdir% /S
)
