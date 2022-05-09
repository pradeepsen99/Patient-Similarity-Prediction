# Patient-Similarity-Prediction

This paper is an attempt at reproducing the results from the paper "A Novel Deep Similarity Learning Approach to Electronic Health Records Data" by Gupta et. al. 
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

This initiates the environment.sh script which should auto-install all of the required python dependenceis in a virtual environment (If you need a system wide install please modify environment.sh to delete the virtual env portions). After that it runs the main training code. Please ensure you use download.sh appropriately to ensure proper data is available to train the model. 

## Train

## Evaluation

## Pre-Trained models + data