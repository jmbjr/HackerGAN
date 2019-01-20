import mnist2png
import os
import gzip
import shutil

#should make this a variable. for now, gotta sync with the install script
trainingset='train-images-idx3-ubyte'
datasetdir='fashion_mnist'

with gzip.open('{}.gz'.format(trainingset), 'rb') as f_in:
    with open(trainingset, 'wb') as f_out:
        shutil.copyfileobj(f_in, f_out)

if not os.path.exists(datasetdir):
    os.mkdir(datasetdir)

mnist2png.extract_images(trainingset, datasetdir)


