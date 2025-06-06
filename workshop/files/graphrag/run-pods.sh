#!/bin/sh
podman pod stop -i graphrag

# Set up required volumes
CURRENT_DIR=$(pwd)
echo "Current directory: $CURRENT_DIR"
mkdir -p $CURRENT_DIR/data
mkdir -p $CURRENT_DIR/plugins
mkdir -p $CURRENT_DIR/ollama

# Pull needed images
podman pull ollama/ollama
podman pull quay.io/gradde/llm-graph-builder-backend:v0.8
podman pull quay.io/gradde/llm-graph-builder-frontend:latest
podman pull neo4j:5.26.5-community

podman pod create --replace --name graphrag \
  -p 8000:8000 -p 8080:8080 -p 7474:7474 -p 7687:7687 -p 11434:11434 \
  -v $CURRENT_DIR/data:/data:Z -v $CURRENT_DIR/plugins:/plugins:Z -v $CURRENT_DIR/ollama:/root/.ollama:Z

# Run ollama
podman run -d --name ollama --replace --pod graphrag ollama/ollama
podman exec ollama ollama run llama3

#neo4j
podman run \
    -d --pod graphrag \
    --replace --name neo4j-apoc \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4J_PLUGINS=\[\"apoc\"\] \
    neo4j:5.26.5-community

#backend
podman run -d --pod graphrag --replace --name llm-graph-builder-backend \
  --env-file backend.env  quay.io/gradde/llm-graph-builder-backend:v0.8

#frontend

podman run -d --pod graphrag --replace --name llm-graph-builder-frontend \
  quay.io/gradde/llm-graph-builder-frontend:latest 
  
echo "\n\n"
echo "Neo4j is running on http://localhost:7474"
echo "Neo4j graph builder is running on http://localhost:8080"