# Julia course: from total beginner to power user

This repository is a collection of resources to teach everything about the Julia programming language.

These resources are used in the [Julia: from total beginner to power user](https://www.youtube.com/watch?v=ZZJJgQ2IzQQ&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk) Youtube playlist.

## Direct links to the notebooks

You can use the notebooks either by using the direct links provided here, or by downloading/cloning the repository (see below).

To use the direct link, open julia, then type `using Pluto`, and execute the line of code provided below. If you need to install Pluto first, see below.

1. Variables and basic types in Julia

    [![Variables and basic types: link to video](http://img.youtube.com/vi/Jip2Ym5DsxQ/0.jpg)](https://youtu.be/Jip2Ym5DsxQ "Variables and basic types")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/1-variables_and_basic_types.jl")
    ```

1. Arrays

    [![Arrays: link to video](http://img.youtube.com/vi/VKjIRDBk6qo/0.jpg)](https://youtu.be/VKjIRDBk6qo "Arrays")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/2-arrays.jl")
    ```

1. Tuples

    [![Tuples: link to video](http://img.youtube.com/vi/pYTw1LGbRm0/0.jpg)](https://youtu.be/pYTw1LGbRm0 "Tuples")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/3-tuples.jl")
    ```

1. Dictionaries

    [![Dictionaries: link to video](http://img.youtube.com/vi/3Anx7csWSkc/0.jpg)](https://youtu.be/3Anx7csWSkc "Dictionaries")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/4-dictionnaries.jl")
    ```

1. Basic operators

    [![Basic operators: link to video](http://img.youtube.com/vi/k2aGzLvN4uA/0.jpg)](https://youtu.be/k2aGzLvN4uA "Basic operators")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/5-basic_operators.jl")
    ```

1. String operators

    [![String operators: link to video](http://img.youtube.com/vi/yZwHgdAEx5Q/0.jpg)](https://youtu.be/yZwHgdAEx5Q "Strings")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/6-string_operators.jl")
    ```

1. Compound expressions (begin and let)

    [![begin and let: link to video](http://img.youtube.com/vi/zCvYmbP1esc/0.jpg)](https://youtu.be/zCvYmbP1esc "begin and let")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/7-compound_expressions.jl")
    ```

1. Conditional statements (if...else...)

    [![Conditional statements: link to video](http://img.youtube.com/vi/qNK9C3ewoGE/0.jpg)](https://youtu.be/qNK9C3ewoGE "Conditional statements")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/8-conditional_statements.jl")
    ```


1. For loops (eachindex, enumerate, variable scope...)

    [![For loops: link to video](http://img.youtube.com/vi/wTiVtP5tYPY/0.jpg)](https://youtu.be/wTiVtP5tYPY "Conditional statements")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/9-for_loops.jl")
    ```

2. Functions (short and long forms, do syntax, anonymous functions...)

    [![Functions: link to video](http://img.youtube.com/vi/xxx/0.jpg)](https://youtu.be/xxx "Functions")

    ```julia
    Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/10-functions.jl")
    ```

## Usage

### Pluto

Most of the resources are Pluto reactive notebooks. You know when a julia script (a `.jl` file) is a notebook when it starts with "### A Pluto.jl notebook ###". In this case, use Pluto to execute the file.

#### Install Pluto

To install Pluto, enter the package manager mode in Julia by pressing `]` in the REPL, and then execute the following code:

```julia
add Pluto
```

Then, each time you want to use Pluto, type the following command in the REPL (in julia mode):

```julia
using Pluto
```

#### Open a notebook

There are different ways to open a notebook, but it's always using the same function: `Pluto.run()`.

The most simple way is to just run it:

```julia
using Pluto
Pluto.run()
```

Then you'll have to navigate manually to your notebook.

A second way is to open a notebook by passing its path, *e.g.*:

```julia
Pluto.run(notebook = "1-variables_and_basic_types.jl")
```

And a third way is by using a notebook directly from the internet by passing its link, *e.g.*:

```julia
Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/content/1-variables_and_basic_types.jl")
```

Watch [this video](https://www.youtube.com/watch?v=jdEqGOv8ycc&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk&index=4) if you need more details about how to use Pluto.

### Download and instantiate

If you want to use the resources from this repository locally, the best way is to download a local copy (or clone it if you know GIT). To do so, click on the green button in this page called "Code":

![](www/clone_button.png)

And choose "Download ZIP":

![](www/Download_ZIP.png)

Then, unzip the file, and open the directory in VS Code, or just open Julia in a command prompt / terminal in this repository and use *e.g.*:

```julia
using Pluto
Pluto.run(notebook = "1-variables_and_basic_types.jl")
```

The resources are numbered, and their titles correspond to the Youtube videos they relate to.

## Acknowledgements

This repository uses the [template](https://github.com/greimel/pluto-course-template) provided by the **Computational Thinking** course [(computationalthinking.mit.edu)](https://computationalthinking.mit.edu)

## Build the website

> From PlutoPages/Website maintenance.md

Open this repository in VS Code, and install the recommended extensions.

To start running the development server, open the VS Code *command palette* (press `Cmd+Shift+P`), and search for **`Tasks: Run Task`**, then **`PlutoPages: run development server`**. The first run can take some time, as it builds up the notebook outputs cache. Leave it running.

This will start two things in parallel: the PlutoPages.jl notebook (which generates the website), and a static file server (with Deno_jll). It will open two tabs in your browser: one is the generation dashboard (PlutoPages), the other is the current site preview (Deno_jll).
 
Whenever you edit a file, PlutoPages will automatically regenerate! Refresh your browser tab. If it does not pick up the change, go to the generation dashboard and click the "Read input files again" button.

This workflow is recommended for writing static content, styles, and for site maintenance. But for writing Pluto notebooks, it's best to prepare the notebook first, and then run the site (because it re-runs the entire notebook on any change).