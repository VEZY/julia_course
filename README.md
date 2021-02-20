# Julia course: from total beginner to power user

This repository is a collection of resources to teach everything about the Julia programming language.

These resources are used in the [Julia: from total beginner to power user](https://www.youtube.com/watch?v=ZZJJgQ2IzQQ&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk) Youtube playlist.


## Direct links to the notebooks

You can use the notebooks either by using the direct links provided here, or by downloading/cloning the repository (see below).

To use the direct link, open julia, then type `using Pluto`, and execute the line of code provided below. If you need to install Pluto first, see below.

1- Variables and basic types in Julia:

```julia
Pluto.run(notebook = "[1-variables_and_basic_types.jl](https://raw.githubusercontent.com/VEZY/julia_course/main/1-variables_and_basic_types.jl)")
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
Pluto.run(notebook = "https://raw.githubusercontent.com/VEZY/julia_course/main/1-variables_and_basic_types.jl")
```

Watch [this video](https://www.youtube.com/watch?v=jdEqGOv8ycc&list=PLLiJ249IkzRFxZGALbKy75_ZyHxYCUmuk&index=4) if you need more details about how to use Pluto.

### Download and instantiate

If you want to use the resources from this repository locally, the best way is to download a local copy (or clone it if you know GIT). To do so, click on the green button in this page called "Code":

![](www/clone_button.png)

And choose "Download ZIP":

![](www/Download_ZIP.png)

Then, unzip the file, and open the directory in VS Code, or just open Julia in this repository.

Finally, enter the package manager mode in Julia by pressing `]` in the REPL and run the following command:

```julia
activate
instantiate
```

It will first activate the project, and then instantiate it, *i.e* download all packages used for this project.

The resources are numbered, and their titles correspond to the Youtube videos they relate to.
