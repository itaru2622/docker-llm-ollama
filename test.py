#!/usr/bin/env python3

# starts: workaround ; add  code to ignore warning  """
import warnings
warnings.filterwarnings("ignore", message=".*Pydantic V1 functionality isn't compatible with.*")
# ends: workaround ; add  code to ignore warning  """

from langchain_ollama import ChatOllama

model = ChatOllama(model="llama3.2")
result = model.invoke("Hi, who is it?")
print(result.content)

