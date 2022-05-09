# Patient-Similarity-Prediction

This repository is an attempt at reproducing the results from the paper "A Novel Deep Similarity Learning Approach to Electronic Health Records Data" by Gupta et. al. 
```
V. Gupta, S. Sachdeva and S. Bhalla, ”A Novel Deep Similarity Learning Approach to Electronic Health Records Data,” in IEEE Access, vol. 8, pp. 209278-209295, 2020, doi: 10.1109ACCESS.2020.3037710.
```
The data was obtained from the ORBDA dataset. From Sundvall et. al.
```
Teodoro, D., Sundvall, E., Jo  ̃ao Junior, M., Ruch, P., amp; Miranda Freire, S. (2018). Orbda: An openehr benchmark dataset for performance assessment of Electronic Health Record Servers. PLOS ONE, 13(1). https://doi.org/10.1371/journal.pone.0190028
```

## Dependencies

This project uses python's venv module. You will need it installed to have some of the helper scripts work, namely ```run.sh``` and ```environment.sh```. All of the specific requirements are outlined in ```requirements.txt``` which also contains the specific versions of the libraries used. The helper scripts use pip3 so you'll need that installed. 

The enture model training and eval uses PyTorch as the main framework. It should be able to run on CPU and CUDA based systems. Significant effort went into trying to make this codebase compatible with AMD Rocm but was not successful. 

All of this codebase assumes a UNIX based system. Nothing was tested for a Windows environment but the code should *mostly* work albeit with undefined behavior.

## Usage

To run the application a helper script has been created to automate the process of installing the relevant dependencies. 

Please run these commands in order:
* ```chmod +x run.sh```
* ```./run.sh```

This initiates the ```environment.sh``` script which should auto-install all of the required python dependenceis in a virtual environment (If you need a system wide install please modify ```environment.sh``` to delete the virtual env portions). After that it runs the main training code. 

### Data Download

Please ensure you use ```download.sh``` to download all the data and to ensure proper data is available to train the model. 

## Train

To run training on the model with the csv data, simple use the ```run.sh``` shell script to auto run training.

To have more fine grained control over the training process, please use the Jupyter notebook and use the specific model needed. Available models are: CNN_Softmax, CNN_Euclidean, CNN_Cosine and a custom version of CNN_Softmax with an added convolution layer. The models are custom PyTorch modules.

If you need custom data, please modify data_processing.py and generate your own csv file. This can also be done via the provided Jupyter notebook.

## Evaluation

Similar to training, to run evaluation of the model with the csv data. Simply use the ```run.sh``` shell script to auto run evaluation. The model should auto run eval every epoch and generate F1, Recall, Precision and Accuracy scores. 

## Pre-Trained models + data

The pretrained models with the corresponding weights are available in the /models directory. 

For downloading the data please use the ```download.sh``` shell script to auto download all of the required data.

## Results

If you setup the environment and run the training on the same data you should get results of CNN_Softmax, CNN_Euclidean, CNN_Cosine and a custom version of CNN_Softmax with an added convolution layer as such:

<img src="https://github.com/pradeepsen99/Patient-Similarity-Prediction/blob/master/images/results.png"></img>

These results prove that the paper is reproducible.
