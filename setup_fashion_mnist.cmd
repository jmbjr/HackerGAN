echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test
set fashionfile=train-images-idx3-ubyte
set gz=.gz
set fashionfilegz=%fashionfile%%gz%
set fashionbase=http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/
set fashionurl=%fashionbase%%fashionfilegz%
set fashiondir=fashion_mnist

IF  EXIST %fashionfilegz% (
	echo %fashionfilegz% EXISTS. Skipping downloading dataset.
) else (
	echo %fashionfilegz% doesn't exist. Downloading.
	curl -O %fashionurl%
)

call %root%\Scripts\activate.bat %root%
call conda activate %targetenv%
set envpath=%CONDA_PREFIX%
for %%F in (%envpath%) do set thisenv=%%~nxF

If EXIST %fashionfile% (
	echo %fashionfile% EXISTS. Skipping unzipping.
) else (
	echo %fashionfile% doesn't exist. Unzipping.
	
	if "%thisenv%" == "%targetenv%" (
		echo Unzipping fashion mnist dataset and extracting images.
		call python convert_fashion_mnist.py
	) else (
		echo Unable to activate %targetenv% conda environment. %envpath% / %thisenv%
		echo Program will now end. Run setup_conda_env.bat first and verify environment is properly installed.
		exit
	)	
)



