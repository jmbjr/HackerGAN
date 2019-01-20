echo OFF

set root=C:\ProgramData\Anaconda3
set targetenv=hypergan_test
set fashionfile=train-images-idx3-ubyte
set gz=.gz
set fashionfilegz=%fashionfile%%gz%
set fashionbase=http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/
set fashionurl=%fashionbase%%fashionfilegz%
set fashiondir=fashion_mnist

echo Removing all Fashion MNIST data

IF  EXIST %fashionfilegz% (
	echo Removing %fashionfilegz% 
	del %fashionfilegz%
)

IF  EXIST %fashionfile% (
	echo Removing %fashionfile% 
	del %fashionfile%
)

if Exist %fashiondir% (
	echo Deleting %fashiondir% folder and images.
	rmdir %fashiondir% /S
)

echo Done