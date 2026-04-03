ARG base=python:3.14-trixie
FROM ${base}
ARG base=python:3.14-trixie

RUN apt update; apt install -y curl gnupg2 vim git make

# https://python.langchain.com/docs/integrations/chat/ollama/
RUN curl -fsSL https://ollama.com/install.sh | sh
RUN pip install  pydantic ollama langchain langgraph langchain-ollama langchain-mcp-adapters
RUN echo "set mouse-=a" > /root/.vimrc;

#ARG model=llama3.3
#RUN ollama pull ${model}

ENV OLLAMA_HOST=0.0.0.0:11434
CMD ollama serve
