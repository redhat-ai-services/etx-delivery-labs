FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

USER root

# Add Microsoft repo for SQL Server tools
RUN curl -sSL https://packages.microsoft.com/config/rhel/9/prod.repo -o /etc/yum.repos.d/mssql-release.repo && \
    rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
    ACCEPT_EULA=Y dnf install -y \
        msodbcsql18 \
        mssql-tools18 && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> /etc/profile.d/mssql-tools.sh && \
    dnf clean all

# Install system packages using dnf
RUN dnf -y update && \
    dnf -y install \
    git \
    nodejs \
    npm \
    wget \
    unzip \
    podman \
    skopeo \
    jq \
    tmux \
    java-17-openjdk-devel \
    && dnf clean all

USER 1001

# Install Python environment managers and tools
RUN pip install --upgrade pip && \
    pip install \
    micropipenv \
    uv \
    poetry \
    jupyter \
    promptfoo \
    langchain \
    llama-index \
    vllm \
    chromadb \
    faiss-cpu

# Install docling with PyTorch CPU support
# Run via: docling
RUN pip install docling --extra-index-url https://download.pytorch.org/whl/cpu

# Install docling-serve with UI support
# Run via: docling-serve run --enable-ui
# Note: This will start the docling-serve UI on port 50001
RUN pip install "docling-serve[ui]"

# Install HuggingFace ClI
# Run via: huggingface-cli
RUN pip install "huggingface_hub[cli]"

# Install VSCode YAML linter extension (Red Hat)
# Run via: code-server --bind-addr 0.0.0.0:8080 --auth none
# Note: This will start the vscode server UI on port 8080 without requiring a password
RUN code-server --install-extension redhat.vscode-yaml

USER root
# Install OpenShift CLI (Needs SuperUser privileges)
RUN curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    tar -xzf openshift-client-linux.tar.gz -C /usr/local/bin oc kubectl && \
    chmod +x /usr/local/bin/oc /usr/local/bin/kubectl && \
    rm -f openshift-client-linux.tar.gz

# Install AWS CLI
# Run via: aws
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Install Ollama (Needs SuperUser privileges)
# Run via: export OLLAMA_HOST=0.0.0.0 && ollama serve
# Note: This will start the ollama server on port 11434
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install AnythingLLM
RUN git clone https://github.com/Mintplex-Labs/anything-llm.git /opt/anything-llm && \
    cd /opt/anything-llm && \
    npm install

USER 1001
WORKDIR /opt/workspace
# Install Quarkus CLI
RUN curl -Ls https://sh.jbang.dev | bash -s - trust add https://repo1.maven.org/maven2/io/quarkus/quarkus-cli/ && \
    curl -Ls https://sh.jbang.dev | bash -s - app install --fresh --force quarkus@quarkusio

# Optional: Pull LangChain4j starter project (Java)
RUN git clone https://github.com/langchain4j/langchain4j-examples.git langchain4j-examples

# Expose port for ollama
EXPOSE 11434

# Expose port for docling-serve UI
EXPOSE 5001

# Expose port for code-server
EXPOSE 8080

CMD ["bash"]
