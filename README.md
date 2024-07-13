## <div align="center"> Any AI Agent Anywhere (A4) </div>
In the past two years there have been thousands of AI related startups formed, and just about every public company is mentioning “AI technology” in earnings calls to boost stock prices. What does the implementation of LLM technology actually look like? The core principles are not as complicated or as innovative as consulting companies charging clients millions of dollars would have the public believe. 

A4 is a project that aims to make it easy to call any AI model, on any hardware, in any agentic structure. This is done by containerizing the required software so proprietary LLM models can be called via API, and open-source models can perform inference locally or on provisioned hardware in the cloud. 

## Components

<b>Docker-Compose File: </b>
	Set up a container to run Jupyter Notebook files that have access to required API keys, a volume to persist project files, package dependencies, and an optional network connection to another docker container that has the software required to run models locally.

<b>Docker Volume: </b>
	Store all project files and any local documents that the LLM models should have access to.

<b>Docker File for Local Inference: </b>
	Set up a separate docker container that has Nvidia’s CUDA software, as well as Ollama and Meta’s Llama 3 open-source model installed. 

## Setup
<b>Jupyter Notebook Environment Configuration Commands:  </b>
-	docker build -t A4 .
-	docker compose up –build

<b>Access Notebook: </b>
-	http://localhost:8889/lab?token=dev 

<b>Local Inference Setup Commands: </b>
-	docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama --network ollama-network ollama/ollama
-	docker exec -it ollama ollama run llama3


## Results
Check demo.ipynb to see all models called from within a single notebook.  This project is simple and versatile. The complexity of adopting AI does not come from making an API call, and the value does not come from building yet another GPT wrapper. All organizations will need to build off of some version of this core foundation, and the challenge will be integrating LLM capabilities into already complex data pipelines and business procedures. 
