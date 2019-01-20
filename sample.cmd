echo OFF

set root=C:\ProgramData\Anaconda3
set newenv=hypergan_test
set samplecommit=develop
set fashiondir=fashion_mnist
set filetype=png

call %root%\Scripts\activate.bat %root%
call conda activate %newenv%

cd HyperGAN
git checkout %samplecommit%
cd ..

call hypergan sample %fashiondir% --sampler batch_walk --format  %filetype%  --size 64x64x3 -b 1 -c wgan-gp --resize -z 2



