
# 🛠️ Prerequisite Setup

## 1. Install Podman Desktop

Podman Desktop is a container management tool similar to Docker, but daemonless.

**Steps:**
1. Visit the [Podman Installation Guide](https://podman.io/getting-started/installation).
2. Download and install Podman Desktop for your operating system.
3. Launch Podman Desktop and ensure containers and pods can be created.
4. Verify Podman works by running:

   ```bash
   podman info
   ```

---

## 2. Install Ollama

Ollama allows you to run open-source language models locally.

**Steps:**
1. Visit [https://ollama.com/](https://ollama.com/)
2. Download the installer for your OS and follow the instructions.
3. Pull and list models:

   ```bash
   ollama pull llama2
   ollama pull granite3.2
   ollama list
   ```

---

## 3. Install Docling

Docling is a lightweight tool for building linguistic documentation.

**Install with pip:**

```bash
pip install docling
```

### Run `docling serve` in a Container Using Podman

```bash
podman run -p 5001:5001 -e DOCLING_SERVE_ENABLE_UI=true quay.io/docling-project/docling-serve
```

Then open a browser and go to: [http://localhost:5001](http://localhost:5001)

🔗 GitHub: [docling-project/docling-serve](https://github.com/docling-project/docling-serve)

---

## 4. Install HuggingFace Hub CLI

```bash
pip install huggingface_hub
huggingface-cli --help
```

---

## 5. Install Node.js and npm

**For Windows, macOS, or Linux:**
1. Visit [https://nodejs.org](https://nodejs.org)
2. Download the **LTS version** (recommended).
3. Run the installer — it installs both Node.js and npm.
4. After install, check versions:

   ```bash
   node -v
   npm -v
   ```

---

## 6. Setup the Toolkit Container

(You can expand this section with specific steps or commands if available.)
