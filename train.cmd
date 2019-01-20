echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test
set traincommit=develop
set fashiondir=fashion_mnist
set filetype=png

echo Trying to start training dataset

call %root%\Scripts\activate.bat %root%
call conda activate %targetenv%

cd HyperGAN
git checkout %traincommit%
cd ..

call hypergan train %fashiondir%  --sample_every 10 --sampler static_batch --format %filetype% --size 64x64x3 -b 8 -c wgan-gp --save_every 1000 --resize

echo Done Training
