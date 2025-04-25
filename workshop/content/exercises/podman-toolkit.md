
# 🧠 Podman AI Toolkit

This guide walks you through downloading, setting up, and running the **AI Toolkit** container using **Podman**.

---

## 📦 1. Download the Toolkit Container

> ⏬ **Note**: This image is large (~10GB)

```bash
podman pull quay.io/redhat-ai-services/rhai-toolbox

---

## 📂 2. Create a Local Directory to Mount

This shared directory will be accessible from both your host and the container.

```bash
mkdir ~/podman-shared
```

---

## 🚀 3. Run the Container

Mount the shared volume and expose the container’s UI port:

```bash
podman run -dit \
  --name ai-tools-container \
  -p 5001:5001 \
  -v ~/podman-shared:/mnt/shared \
  quay.io/redhat-ai-services/rhai-toolbox
```

---

## 💻 4. Exec into the Running Container

Use `bash` to open a shell inside the container:

```bash
podman exec -it ai-tools-container bash
```

Now you're inside the container and ready to explore or run AI tools.  
To start the Docling frontend UI:

```bash
docling-serve run --enable-ui
```

---

## 🌐 5. Access Docling UI from Localhost

Once the container is running and Docling UI is started, visit:

👉 [http://localhost:5001/ui/](http://localhost:5001/ui/)

---


