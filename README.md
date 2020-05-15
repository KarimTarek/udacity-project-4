[![CircleCI](https://circleci.com/gh/KarimTarek/udacity-project-4/tree/master.svg?style=svg)](https://circleci.com/gh/KarimTarek/udacity-project-4/tree/master)

## Project Summary

This project is about dockerizing a python app which is used to predict housing prices using a dockerfile first to build the docker image which will contain the app and all of its dependencies then we were supposed to run the docker image using docker run command and expose the required ports to the docker host to be able to test the API call. Then we had to setup minikube which is the development version of kubernetes to be able to deploy our image (which we had to publish publicly on docker hub) on the cluster and also expose the container port to the host via port forwarding. Finally we had to setup circleci to add some tests and make sure the lints checks pass successfully with every change we do to the github repo.

### How to run the python scripts

	1) to run the python script in standalone mode (just python):
		- Create a virtualenv and activate it
		- Open up the terminal and make sure you are in the project directory then run `make install` to install the necessary dependencies
		- run `python app.py`

	2) to run the python app using docker:
		- Open up the terminal and make sure you are in the project directory then run `./run_docker.sh` to build the image using the dockerfile included and run it using docker
		- test using `./make_prediction` and a prediction should return

	3) to run the python app on kubernetes:
		- Make sure you installed minikube and that the vms are up and running then run `./run_kubernetes.sh` to get the image from docker hub then spin up a pod and port forward the ports exposed by the container to the host
		- test using `./make_prediction` and a prediction should return

### Folder Structure
	- .circleci/config.yml: This folder holds the configuration for circleci to be able to test the whole app whenever anyone changes/pushes to the repository
	
	- upload_docker.sh: This script is responsible for logging into docker hub, tagging the image that we want to push then pushing it to the required repository with a specific tag
	
	- run_kubernetes.sh: This script is responsible for running a pod using the image we pushed to docked hub earlier with 'upload_docker.sh' and port forward the exposed port of the container to the host to be able to test it using 'make_prediction.sh'

	- run_docker.sh: This script is used to build the application using the Dockerfile specified in the directory as well as running it ater the build process is complete

	- requirements.txt: This file holds all the dependencies that we will need to run our python app

	- output_txt_files: This folder contains the output files required for the project submission which includes the docker_out.txt and kubernetes_out.txt that contain logs related to each case

	- make_prediction.sh: This file is used to make an API POST call to the python app to get a price prediction based on the features provided

	- app.py: This is the flask application which holds all the endpoints which the application provides

	- Dockerfile: The docker file which is use to build the housing market price app image

	- model_data: Folder containing the data in which the model was trained on

	- Makefile: The Makefile includes instructions on environment setup and lint tests