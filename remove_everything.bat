

call ./remove_conda_env.cmd
call ./remove_hypergan_git.cmd
call ./remove_fashion_mnist.cmd
call ./remove_saves_and_samples.cmd

set pycachedir=__pycache__

if Exist %pycachedir% (
	echo Deleting %pycachedir% folder and files.
	rmdir %pycachedir% /S
)
