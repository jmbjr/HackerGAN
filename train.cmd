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


call %root%\Scripts\activate.bat %root%
call conda activate %newenv%

cd HyperGAN
git checkout %traincommit%
cd ..

call hypergan train %fashiondir%  --sample_every 10 --sampler static_batch --format %filetype% --size 64x64x3 -b 8 -c wgan-gp --save_every 1000 --resize
cd HyperGAN

git checkout %samplecommit%
cd ..

call hypergan sample %fashiondir% --sampler batch_walk --format  %filetype%  --size 64x64x3 -b 1 -c wgan-gp --resize -z 2



