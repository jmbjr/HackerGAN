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

del %fashionfile%
curl -O %fashionurl%

call %root%\Scripts\activate.bat %root%
call conda activate %newenv%

call python convert_fashion_mnist.py



