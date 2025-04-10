#!/bin/bash

echo "Pulling models into Ollama container..."

docker exec ollama ollama pull deepseek-r1:1.5b
docker exec ollama ollama pull gemma3:4b
docker exec ollama ollama pull llama3.1:8b
docker exec ollama ollama pull deepseek-coder-v2:16b

echo "Model pulling completed."

docker exec -it ai-ollama-1 ollama pull ollama pull gemma3:4b
docker exec -it ai-ollama-1 ollama pull deepseek-r1:1.5b
docker exec -it ai-ollama-1 ollama pull deepseek-r1:1.5b

docker exec -it ai-ollama-1 ollama pull llama3.1:8b 

