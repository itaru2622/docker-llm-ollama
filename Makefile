img   ?=itaru2622/llm-ollama:bookworm
cName ?=ollama
wDir  ?=${PWD}
dDir  ?=${wDir}/data

port  ?=11434
model ?=llama3.2
cmd   ?=make llama_start model=${model}


build:
	docker build -t ${img} .
start:
	docker run -itd --name ${cName} -p ${port}:11434 \
        -v ${wDir}:/work -w /work \
        -v ${dDir}:/root/.ollama \
	${img} ${cmd}

llama_start::
	ollama serve &
	sleep 2
llama_start:: pull_model
	tail -f /dev/null

pull_model:
	if [ -z "`ollama show ${model}`" ]; then ollama pull ${model} ; fi

bash:
	docker exec -it ${cName} /bin/bash
stop:
	docker rm -f ${cName}
