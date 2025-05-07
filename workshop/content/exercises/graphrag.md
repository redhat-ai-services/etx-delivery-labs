# GraphRag demo

In this lab, we will be using neo4j's graph builder to augment our model with data fetched from a graph database. We will also use Neo4j's graph builder to parse plain text and turn it into a graph that will be inserted in the database. 

## Prerequisite

You need Ollama running and accesible on `http://localhost:11434` on your local environment. Your Ollama server needs to host the `llama3` model. You can check that ollama is running by running the following command:

```
curl http://localhost:11434
``` 

## 🛠️ Setting up the environment

1. Go into the `workshop/files/graphrag/` folder.
```sh
cd workshop/files/graphrag/
```

2. Start the Neo4j database, frontend and backend containers in a single pod. This may take a few minutes as the backend image is over 5GiB:

```sh
./start-pods.sh
```

3. Log into neo4j web UI at http://localhost:7474 . Then select `neo4j` for the Username, and `neo4j` as the password. Click `Connect`.

4. Neo4j asks you for a New password. Enter a new password (like `abcdefgh`) and click `Change password`

5. Open the Graph Builder Web UI at http://localhost:8080/ . Click on `Connect to Neo4j`. The provided parameters should be:
    - **Protocol**: `neo4j`
    - **URI**: `localhost:7687`
    - **Database**: `neo4j`
    - **Username**: `neo4j`
    - **Password**: Enter the password you created earlier (like `abcdefgh`)

> **Your environment is now ready to use!**


## 📄  Steps to Follow

1. In the LLM Model Dropdown at the bottom of the screen, selec the model `Ollama llama3`.

2. In the `Drag & Drop` zone in the top left corner, click on the link `browse`. Then select the file `Pokemons.txt` from this workshop's `workshop/content/files/graphrag` folder.

3. Once the file has been sucessfully uploaded, click on the checkbox to select it, then click `Generate Graph (1)` at the bottom of the screen. 

4. Once the graph has been generated, click on the graph button in the `Actions` column to view the graph. You can also ask questions about your graph in the Chat on the right side, such as `Who can evolve into Charizard?`