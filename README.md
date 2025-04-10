# n8n + Ollama Integration Stack

A complete automation stack combining n8n workflow automation with Ollama's local language models, pre-configured with popular AI models.

## Features

- **n8n** workflow automation platform
- **Ollama** with pre-loaded models:
  - `deepseek-r1:1.5b` - General purpose model
  - `gemma3:4b` - Google's efficient model
  - `llama3.1:8b` - Meta's advanced model
  - `deepseek-coder-v2:16b` - Code generation specialist
- PostgreSQL database for n8n
- Docker network isolation
- Persistent storage volumes

## Prerequisites

- Docker 20.10.10+
- Docker Compose 2.12.0+
- 8GB RAM minimum (16GB recommended)
- 20GB free disk space

## Installation

1. **Clone the repository**
   ```
   git clone https://github.com/yourusername/n8n-ollama-stack.git
   cd n8n-ollama-stack
   ```

2. **Start the services**
   ```
   docker compose up -d
   ```

3. **Verify installation**
   ```
   docker compose ps
   ```

## Usage

### Access Services

| Service  | URL                      | Port  |
|----------|--------------------------|-------|
| n8n      | http://localhost:5678    | 5678  |
| Ollama   | http://localhost:11434   | 11434 |

### Basic Operations

**Check available models:**
```
curl http://localhost:11434/api/tags
```

**Run model inference:**
```
curl -X POST http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama3.1:8b",
    "prompt": "Explain quantum computing in simple terms",
    "stream": false
  }'
```

### n8n Integration Example

1. Create new workflow
2. Add **HTTP Request** node
3. Configure with:
   - Method: POST
   - URL: `http://ollama:11434/api/generate`
   - JSON Body:
     ```
     {
       "model": "deepseek-coder-v2:16b",
       "prompt": "Write Python code to calculate Fibonacci sequence",
       "stream": false
     }
     ```

## Model Specifications

| Model Name               | Size  | Best For                  |
|--------------------------|-------|---------------------------|
| deepseek-r1:1.5b         | 1.5B  | General tasks             |
| gemma3:4b                | 4B    | Efficient inference       |
| llama3.1:8b              | 8B    | Complex reasoning         |
| deepseek-coder-v2:16b    | 16B   | Code generation           |

## Troubleshooting

**Common Issues:**
- **Models not loading**: Check Ollama logs:
  ```
  docker logs ollama
  ```
- **Connection refused**: Verify network connectivity:
  ```
  docker exec n8n curl -v http://ollama:11434
  ```
- **Low memory**: Reduce concurrent models or upgrade hardware

**Verify Model Availability:**
```
docker exec ollama ollama list
```

## Advanced Configuration

**Add new models:**
1. Edit `docker-compose.yml`
2. Add new `ollama pull <model>` commands
3. Redeploy:
   ```
   docker compose up -d --force-recreate ollama
   ```

**Resource Limits:**
Add to ollama service in compose file:
```
deploy:
  resources:
    limits:
      memory: 16G
      cpus: '4'
```

## License
MIT License - Free for personal and commercial use

```

This setup provides:
1. Complete Docker configuration with multiple AI models
2. Detailed documentation for users
3. Pre-configured integration between n8n and Ollama
4. Persistent storage for all components
5. Network isolation for security

The README includes:
- Installation instructions
- Usage examples
- Troubleshooting guide
- Model specifications
- Advanced configuration options

To use this stack:
1. Save both files in a new directory
2. Run `docker compose up -d`
3. Access n8n at `http://localhost:5678`
4. Start building AI-powered workflows using the pre-loaded models
