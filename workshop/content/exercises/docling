# Docling

Docling simplifies document processing, parsing diverse formats — including advanced PDF understanding — and providing seamless integrations with the gen AI ecosystem.

## Features

* 🗂️ Parsing of [multiple document formats][supported_formats] incl. PDF, DOCX, XLSX, HTML, images, and more
* 📑 Advanced PDF understanding incl. page layout, reading order, table structure, code, formulas, image classification, and more
* 🧬 Unified, expressive [DoclingDocument][docling_document] representation format
* ↪️ Various [export formats][supported_formats] and options, including Markdown, HTML, and lossless JSON
* 🔒 Local execution capabilities for sensitive data and air-gapped environments
* 🤖 Plug-and-play [integrations][integrations] incl. LangChain, LlamaIndex, Crew AI & Haystack for agentic AI
* 🔍 Extensive OCR support for scanned PDFs and images
* 🥚 Support of Visual Language Models ([SmolDocling](https://huggingface.co/ds4sd/SmolDocling-256M-preview)) 🆕
* 💻 Simple and convenient CLI

To run docling locally:

```
python3 -m venv venv
source venv/bin/activate
pip install docling 
```

```
docling --from pdf --to md --output converted-downloads/ --ocr-engine tesseract RedHat.pdf
```

If you want to run via the GUI use the container based docling-serve to access locally on localhost:5001
```
podman run -p 5001:5001 -e DOCLING_SERVE_ENABLE_UI=true quay.io/docling-project/docling-serve
```