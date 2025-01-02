### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 08c94eb5-9296-4c31-9668-e32a9c6a008d
using PlutoUI

# ╔═╡ b05f56a0-ad69-11ef-34d8-d19daf838b87
md"""
# Julia's Type System

This notebook explores Julia's type system, including basic types, custom types, abstract types, parametric types, and more.

---

## 1. Introduction

In most programming languages, *types* are the foundation that determines how data is represented and manipulated. **Understanding types** will help you write code that’s both **high-performance** and **highly flexible**, two hallmarks of Julia's design. **Dynamic typing** in Julia means you can write quick scripts and prototypes without worrying about declaring types everywhere, but you can also leverage **type annotations** when you need speed or clarity (we'll dive next into this).
  
### Why Learn About Types?

1. **Performance**  
   Julia’s compiler uses type information to generate optimized machine code. Even if you don’t explicitly annotate your variables, Julia’s type inference does a lot behind the scenes. Still, knowing how types work helps you **avoid pitfalls** and **write more efficient functions**.

2. **Polymorphism and Generic Programming**  
   Julia’s type system allows you to write **generic code** that works on many different types. With **parametric types**, you can make data structures or functions that adapt to a variety of use cases, such as working seamlessly with both `Int` and `Float64`.

3. **Multiple Dispatch**  
   Multiple dispatch is one of Julia’s standout features, and it’s **deeply rooted** in the type system. Understanding types is the key to mastering how Julia chooses which method to call based on the types of **all** arguments (we'll see this in the next video).

4. **Code Organization and Clarity**  
   When you define custom types, you can **model real-world concepts** (like geometric shapes, network requests, domain-specific data) in a clear, structured way. This promotes better organization, readability, and maintainability of your code.

5. **Community and Ecosystem**  
   Many Julia libraries rely on advanced usage of the type system for features like automatic differentiation, symbolic math, and high-performance linear algebra. By understanding types, you’ll be better equipped to **understand**, **contribute to**, and even **debug** these libraries.

By the end of this notebook, you’ll have a **solid grasp of how Julia’s type system works** and how you can leverage it to write elegant, efficient, and maintainable code. Let’s dive in!

## 2. What Are Types in Programming?

We'll use the `supertype` function to explore Julia's type hierarchy.
"""

# ╔═╡ 496a442d-c624-4f51-b559-193937cf11b3
type_hierarchy = [
    ("Int64", supertype(Int64)),
    ("Integer", supertype(Integer)),
    ("Signed", supertype(Signed)),
    ("Number", supertype(Number)),
    ("Any", supertype(Any))
]

# ╔═╡ b45976a0-80b9-4a4f-abfe-9277aeb54c96
md"""
Let's display the type hierarchy from `Int64` up to `Any`:
"""

# ╔═╡ c22b6cae-e638-4299-b77f-55243cea7463
for (child, parent) in type_hierarchy
    println("supertype($child): $parent")
end

# ╔═╡ 8ed20bd3-2531-4a96-b323-c002db900cc4
md"""
## 3. Type Hierarchy in Julia

- Visual diagram
- Concrete vs Abstract types
- Basic type relationships
"""

# ╔═╡ 9b1c0392-7562-491f-85e6-adc82342e809
md"""
## 3. Dynamic vs. Static Typing

Julia is dynamically typed; variables can change types.
"""

# ╔═╡ 9bd8bd74-89ff-44b5-990a-979745559c50
let
    x = 10
    @show typeof(x)

    x = 10.0
    @show typeof(x)

    x = "Hello"
    @show typeof(x)
end

# ╔═╡ 4ddc3e1d-8d36-42f1-9d04-addda3b98690
md"""

## 4. Type Annotations and Declarations

While Julia doesn’t require type annotations, you can use them for clarity or performance optimization.
"""

# ╔═╡ 85a518a2-55bc-4344-8c3e-6dd7e296f9d8
let
    x::Int64 = 10    # x is explicitly declared as Int64
    @show typeof(x)
end

# ╔═╡ a4f66681-56f4-4dca-bff0-28a85f202489
md"""
We can modify the value of `x` by another `Int64` value:
"""

# ╔═╡ 949ced56-547b-487d-9c50-f2c1a4d3da7a
let
    x::Int64 = 10
    x = 100
end

# ╔═╡ 35895100-4699-4f8f-bc1f-7b08463b3f1e
md"""
But it is no possible to change the type of its value, *e.g.* if we change its value by a `String`, Julia will throw an error. If you're curious about it, you can try and execute the code below:

```julia
let
x::Int64 = 10
x = "Hello"
end
```
"""

# ╔═╡ a1401ad2-bdc0-4cfb-b6d1-5b0d22ba99db
md"""
## 5. Defining Custom Types with struct

### 5.1 Composite Types (Immutable Structs)

Defining an immutable struct
"""

# ╔═╡ d220e6e1-e679-49e1-9709-944d0cc5c875

struct Point
    x::Float64
    y::Float64
end

# ╔═╡ a0611d47-26ff-49ff-9f74-25283d83c580
md"""
Creating an instance of Point
"""

# ╔═╡ 8b05a5d8-92e9-452a-a9f8-a1db17105c28
p = Point(2.0, 3.5)

# ╔═╡ 2c27f764-cb28-46fa-bd98-67e1b1b56ead
p_type = typeof(p)

# ╔═╡ 45a627bf-c8a6-474a-a6be-9f25b9351e6f
p

# ╔═╡ 999f4253-b607-4666-bbc4-d970e4f8c275
md"""
### 5.2 Mutable Structs

Defining a mutable struct
"""

# ╔═╡ 01ee99ef-6bf8-4436-b760-5ed96875a897
mutable struct MutablePoint
    x::Float64
    y::Float64
end

# ╔═╡ 787a157c-7c6c-415b-8152-921521dcfb48


# ╔═╡ 0251fa63-1a7f-4237-b1d3-de1d64f74845
md"""
Creating and modifying an instance of MutablePoint:
"""

# ╔═╡ 410a3a44-2f4c-4eba-926c-9e85facb6c3d
let
    mp = MutablePoint(2.0, 3.5)
    @show mp.x, mp.y
    mp.x = 5.0
    @show mp.x, mp.y
end

# ╔═╡ fbe7d700-aba1-4584-9ab2-118edf99805f
md"""

## 6. Abstract Types and Type Hierarchies

Defining abstract types and subtypes
"""

# ╔═╡ 5de811a8-b77a-4137-ac3b-90c39ee2c39a
abstract type Shape end

# ╔═╡ e6a80b5a-8ee6-4e7f-bff7-84b1ecb4ee15
struct Circle <: Shape
    radius::Float64
end

# ╔═╡ 6cdab66e-0751-4cc6-ad64-c7bd48d2653d
struct Rectangle <: Shape
    width::Float64
    height::Float64
end

# ╔═╡ 593ef5f1-ab37-4dba-bfce-0560d15c766e
md"""
Creating instances
"""

# ╔═╡ 5715c06b-6463-41c1-8eda-f13d2415671a
c = Circle(5.0)

# ╔═╡ 19540901-9e6a-4f2f-b1de-7789f27f54d1
r = Rectangle(4.0, 6.0)

# ╔═╡ 3d919e2a-85d3-48b4-a924-6dccb82cbf69
md"""

## 7. Parametric Types

### 7.1 Defining Parametric Structs

Defining a parametric struct
"""

# ╔═╡ 238a7eba-8cf6-4f62-ad88-fb72fa0ed6bb
struct ParametricPoint{T}
    x::T
    y::T
end

# ╔═╡ 3f237c5a-c158-4cb6-b691-b52f9c36cc40
md"""
Creating instances with different types
"""

# ╔═╡ b6968cb4-0cea-4b43-9795-a899eed377ad
p_int = ParametricPoint(2, 3) # ParametricPoint{Int64}

# ╔═╡ c865c52c-4501-46ad-bc1c-4dbfa2567576
p_float = ParametricPoint(2.5, 3.5) # ParametricPoint{Float64}

# ╔═╡ 149cfc2a-ea8d-4409-82b6-2423be324133
p_str = ParametricPoint("x", "y") # ParametricPoint{String}

# ╔═╡ 2572034d-c1a2-43e5-b315-8e24cf853e04
md"""
### 7.2 Type Constraints (Optional)

Parametric Types with Type Constraints
"""

# ╔═╡ d8df6041-0047-4e90-81ab-16be0e378f2a
struct NumberPoint{T<:Number}
    x::T
    y::T
end

# ╔═╡ 859443a4-232a-4417-b411-487d6b261458
md"""
Valid instance:
"""

# ╔═╡ 5f166203-d012-4856-bac5-c150e5bf6958
np = NumberPoint(1.0, 2.0)  # NumberPoint{Float64}

# ╔═╡ d63703fe-b55c-4509-a874-053b07c6a59a
md"""
Attempting to create an instance with non-Number types will result in an error.
Let's try by passing a string instead of a number (this will throw an error if uncommented):
"""

# ╔═╡ 48d892fc-84dd-49bc-ac72-4f980fbe3a27
# np_invalid = NumberPoint("a", "b")  # Error: String is not a subtype of Number

# ╔═╡ f2c810dd-eec1-42f3-b736-68ee440f5356
md"""
## 8. Union and UnionAll Types

Union types allow us to restrict the possible types to a given set of types. For example, we could define a variable `x` that can be an Int64 or Float64:
"""

# ╔═╡ 4218c61f-006e-4b9c-91ef-03b9322d7006
let
    x = Union{Int64,Float64}(10)
    @show x typeof(x)
    x = 3.14
    @show x
    @show x typeof(x)
end

# ╔═╡ d7c4d227-f631-4ce3-bdf5-9819770cef63
md"""
Attempting to set `x` to something different than an `Int64` or a `Float64` would result in an error.
"""

# ╔═╡ 541c9ac0-515b-426a-af85-e37e7c57a7c8
md"""
## 9. Types as First-Class Citizens

Types are just ordinary things in Julia. For example, we can assign a type to a variable:
"""

# ╔═╡ dabd3e49-7d90-4a09-b071-7892ab99caae
T = Int64

# ╔═╡ 14a29a19-c39a-4414-ba10-756ff7a7300e
md"""
And then use it as we would with a type:
"""

# ╔═╡ e1c1f8c9-ed00-47b9-a02a-4fe0ef8e48ba
let
    x::T = 5  # x is an Int64 with value 5
end

# ╔═╡ ad613b50-dd4a-4c47-9218-804280562219
md"""
We can also pass types to functions:
"""

# ╔═╡ 9efaab28-d8b5-43b5-8ca6-83e68221c29c
function create_zero(T)
    T(0)
end

# ╔═╡ fb41cda0-6ffa-4386-a470-37f365ec01fa
create_zero(Float64)

# ╔═╡ 169a384c-48bd-441d-8119-c255457ecd0b
create_zero(Int)

# ╔═╡ 0d3887bf-a69f-4b61-ac30-bf7c36f33369
md"""

## 11. Why Most Julia Users Don’t Explicitly Use Types

Function are generally defined as generic as possible, without type annotations, which allows for passing any type as input:
"""

# ╔═╡ cc8c52ca-3f95-4598-9db6-adc7b9bf7af9
function add(a, b)
    a + b
end

# ╔═╡ 50f92e8c-af57-4ca3-a7d7-751bc989cb5c
md"""
Adding integers:
"""

# ╔═╡ e7835e12-4f9b-4e2b-b980-756630c549cc
add(2, 3)               # Integers

# ╔═╡ 74e7a7f1-712d-4d7c-98fa-e1f9e8799d81
md"""
Adding floats:
"""

# ╔═╡ 2dce7ce8-490e-4768-a22d-4be438a449c4
add(2.5, 3.5)

# ╔═╡ 4dd6ab3a-21a1-458b-adc1-53c7595899a7
md"""
Adding floats and ints behaves like adding floats:
"""

# ╔═╡ b9131bb3-021f-4635-8a8b-f2955ca3e7dd
add(2.5, 3)

# ╔═╡ 9c771049-c8fc-415b-b929-bed4c9c8bf45
md"""
Julia’s compiler infers types and optimizes the function for performance without explicit type annotations. We'll see more details about this in the next video.
"""

# ╔═╡ 8e807104-0aa7-413f-99ff-44f33c319348
md"""
# References
"""

# ╔═╡ 0758d564-d4f3-4f57-867d-05851cecdc40
PlutoUI.TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.60"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.1"
manifest_format = "2.0"
project_hash = "8aa109ae420d50afa1101b40d1430cf3ec96e03e"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eba4810d5e6a01f612b948c9fa94f905b49087b0"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.60"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─b05f56a0-ad69-11ef-34d8-d19daf838b87
# ╠═496a442d-c624-4f51-b559-193937cf11b3
# ╟─b45976a0-80b9-4a4f-abfe-9277aeb54c96
# ╠═c22b6cae-e638-4299-b77f-55243cea7463
# ╠═8ed20bd3-2531-4a96-b323-c002db900cc4
# ╟─9b1c0392-7562-491f-85e6-adc82342e809
# ╠═9bd8bd74-89ff-44b5-990a-979745559c50
# ╟─4ddc3e1d-8d36-42f1-9d04-addda3b98690
# ╠═85a518a2-55bc-4344-8c3e-6dd7e296f9d8
# ╟─a4f66681-56f4-4dca-bff0-28a85f202489
# ╠═949ced56-547b-487d-9c50-f2c1a4d3da7a
# ╟─35895100-4699-4f8f-bc1f-7b08463b3f1e
# ╠═a1401ad2-bdc0-4cfb-b6d1-5b0d22ba99db
# ╠═d220e6e1-e679-49e1-9709-944d0cc5c875
# ╟─a0611d47-26ff-49ff-9f74-25283d83c580
# ╠═8b05a5d8-92e9-452a-a9f8-a1db17105c28
# ╠═2c27f764-cb28-46fa-bd98-67e1b1b56ead
# ╠═45a627bf-c8a6-474a-a6be-9f25b9351e6f
# ╟─999f4253-b607-4666-bbc4-d970e4f8c275
# ╠═01ee99ef-6bf8-4436-b760-5ed96875a897
# ╠═787a157c-7c6c-415b-8152-921521dcfb48
# ╟─0251fa63-1a7f-4237-b1d3-de1d64f74845
# ╠═410a3a44-2f4c-4eba-926c-9e85facb6c3d
# ╟─fbe7d700-aba1-4584-9ab2-118edf99805f
# ╠═5de811a8-b77a-4137-ac3b-90c39ee2c39a
# ╠═e6a80b5a-8ee6-4e7f-bff7-84b1ecb4ee15
# ╠═6cdab66e-0751-4cc6-ad64-c7bd48d2653d
# ╟─593ef5f1-ab37-4dba-bfce-0560d15c766e
# ╠═5715c06b-6463-41c1-8eda-f13d2415671a
# ╠═19540901-9e6a-4f2f-b1de-7789f27f54d1
# ╟─3d919e2a-85d3-48b4-a924-6dccb82cbf69
# ╠═238a7eba-8cf6-4f62-ad88-fb72fa0ed6bb
# ╟─3f237c5a-c158-4cb6-b691-b52f9c36cc40
# ╠═b6968cb4-0cea-4b43-9795-a899eed377ad
# ╠═c865c52c-4501-46ad-bc1c-4dbfa2567576
# ╠═149cfc2a-ea8d-4409-82b6-2423be324133
# ╟─2572034d-c1a2-43e5-b315-8e24cf853e04
# ╠═d8df6041-0047-4e90-81ab-16be0e378f2a
# ╟─859443a4-232a-4417-b411-487d6b261458
# ╠═5f166203-d012-4856-bac5-c150e5bf6958
# ╟─d63703fe-b55c-4509-a874-053b07c6a59a
# ╠═48d892fc-84dd-49bc-ac72-4f980fbe3a27
# ╟─f2c810dd-eec1-42f3-b736-68ee440f5356
# ╠═4218c61f-006e-4b9c-91ef-03b9322d7006
# ╟─d7c4d227-f631-4ce3-bdf5-9819770cef63
# ╟─541c9ac0-515b-426a-af85-e37e7c57a7c8
# ╠═dabd3e49-7d90-4a09-b071-7892ab99caae
# ╟─14a29a19-c39a-4414-ba10-756ff7a7300e
# ╠═e1c1f8c9-ed00-47b9-a02a-4fe0ef8e48ba
# ╟─ad613b50-dd4a-4c47-9218-804280562219
# ╠═9efaab28-d8b5-43b5-8ca6-83e68221c29c
# ╠═fb41cda0-6ffa-4386-a470-37f365ec01fa
# ╠═169a384c-48bd-441d-8119-c255457ecd0b
# ╟─0d3887bf-a69f-4b61-ac30-bf7c36f33369
# ╠═cc8c52ca-3f95-4598-9db6-adc7b9bf7af9
# ╟─50f92e8c-af57-4ca3-a7d7-751bc989cb5c
# ╠═e7835e12-4f9b-4e2b-b980-756630c549cc
# ╟─74e7a7f1-712d-4d7c-98fa-e1f9e8799d81
# ╠═2dce7ce8-490e-4768-a22d-4be438a449c4
# ╟─4dd6ab3a-21a1-458b-adc1-53c7595899a7
# ╠═b9131bb3-021f-4635-8a8b-f2955ca3e7dd
# ╟─9c771049-c8fc-415b-b929-bed4c9c8bf45
# ╟─8e807104-0aa7-413f-99ff-44f33c319348
# ╠═08c94eb5-9296-4c31-9668-e32a9c6a008d
# ╠═0758d564-d4f3-4f57-867d-05851cecdc40
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
