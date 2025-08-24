# using JDBC

_These instructions were initially written by ChatGPT, then edited by the instructor._

### Creating a PostgreSQL JDBC project in VS Code 

Follow these steps to set up a new Java project in VS Code to interact with PostgreSQL via JDBC:

1. **Install VS Code extensions**  
   Make sure you have the [Java Extension Pack](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack) installed in VS Code.  
   This gives you project support, autocompletion, and debugging.

1. **Create a new folder for your project**  
   For example:  `QueryExecutorProject/`

1. **Inside the project folder, create and populate subfolders:**
   
   Create a `src/` folder and `lib/` folder
   - Put your source file [`QueryExecutor.java`](java/QueryExecutor.java) into the `src/` folder.  
   - Put the external JAR [`postgresql-42.7.7.jar`](java/postgresql-42.7.7.jar)into the `lib/` folder.
  
1. **Open the project folder in VS Code**  
   - In VS Code, go to *File → Open Folder…* and select `QueryExecutorProject`.
  
1. **Tell VS Code about your JAR files**  
   - In the project root, create a `.vscode` folder (if it doesn’t exist).  
   - Inside it, create a file called `settings.json` with the following contents:

    ```json
    {
      "java.project.referencedLibraries": [
        "lib/**/*.jar"
      ]
    }
    ```

   This tells VS Code to include all JARs in the `lib/` folder.

1. **Edit Postgres settings in source code**  
   - Open `QueryExecutor.java`.  
   - Edit values such as `PG_PASSWORD`, `PG_PORT_NUMBER`, `schema_name` to match your installation of Postgres and the schema you wish to query.
   
1. **Run the program**  
   - Open `QueryExecutor.java`.  
   - You should see a **Run** and **Debug** button appear above the `main` method.  
   - Click **Run**, and VS Code will compile and run the project, using the JAR on the classpath.

---

At this point, your `QueryExecutor.java` can import and use classes from the external JAR, and VS Code will handle both editing and running.

