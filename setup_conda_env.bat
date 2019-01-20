set root=C:\ProgramData\Anaconda3
set newenv=hypergan_test
set hypergan=https://github.com/HyperGAN/HyperGAN.git
set hgfolder=HyperGAN
set traincommit=develop
set samplecommit=develop
set fashionfile=train-images-idx3-ubyte.gz
set fashionbase=http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/
set fashionurl=%fashionbase%%fashionfile%
set fashiondir=fashion_mnist
set filetype=png

echo OFF

echo %fashionfile%

del %fashionfile%
curl -O %fashionurl%

IF  EXIST %hgfolder% (
	echo %hgfolder% EXISTS. Please remove %hgfolder% repo folder before running this setup script again.
	echo Setup will now exit
	exit
)

git clone %hypergan%

call %root%\Scripts\activate.bat %root%

call conda update conda
call conda env remove --name %newenv%
call conda create -n %newenv% python=3.6 anaconda
call conda activate %newenv%
call pip install tensorflow-gpu hyperchamber nashpy pygame natsort opencv-python  

call python convert_fashion_mnist.py


cd HyperGAN
call python setup.py develop

git checkout %traincommit%
cd ..

call hypergan train %fashiondir%  --sample_every 10 --sampler static_batch --format %filetype% --size 64x64x3 -b 8 -c wgan-gp --save_every 1000 --resize
cd HyperGAN

git checkout %samplecommit%
cd ..

call hypergan sample %fashiondir% --sampler batch_walk --format  %filetype%  --size 64x64x3 -b 1 -c wgan-gp --resize -z 2



