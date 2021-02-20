# Julia course: from total beginner to power user

This repository is a collection of resources to teach everything about the Julia programming language.

These resources are used in the [Julia: from total beginner to power user](https://www.youtube.com/watch?v=ZZJJgQ2IzQQ&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk) Youtube playlist.

## Usage

### Download and instantiate

If you want to use those resources, the best way is to download a local copy (or clone it if you know GIT). To do so, click on the green button called "Code":

![](www/clone_button.png)

And choose "Download ZIP":

![](www/Download_ZIP.png)

Then, unzip the file, and open the directory in VS Code, or just open Julia in this repository.

Finally, open the package manager mode in Julia by pressing `]` in the REPL and run the following command:

```julia
activate
instantiate
```

It will first activate the project, and then instantiate it, *i.e* download all packages used for this project.

The resources are numbered, and their titles correspond to the Youtube videos they relate to.

### Pluto

Some of the resources are Pluto reactive notebooks. You'll know when you see the script (a `.jl` file) starts with "### A Pluto.jl notebook ###". In this case, use Pluto to execute the file:

```julia
using Pluto
Pluto.run()
# Or by passing the file path directly, e.g.:
Pluto.run(notebook = "1-variables_and_basic_types.jl")
```

Watch [this video](https://www.youtube.com/watch?v=jdEqGOv8ycc&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk&index=4) if you need more details about how to use Pluto.
