### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 1
#> video = "https://youtu.be/NdPMaDzpqW8"
#> image = "http://img.youtube.com/vi/NdPMaDzpqW8/0.jpg"
#> section = 10
#> order = 10
#> title = "Functions"
#> layout = "layout.jlhtml"
#> youtube_id = "NdPMaDzpqW8"
#> description = ""
#> tags = ["lecture", "course"]

using Markdown
using InteractiveUtils

# ╔═╡ 87ab7e19-a993-4d84-8aa5-692316191fb6
begin
using PlutoUI
TableOfContents()
end

# ╔═╡ 23ed4932-edaa-11ed-0d5e-73ae08d92ceb
md"""
# Functions in Julia
"""

# ╔═╡ 55f6ec9f-bdd3-46bd-9703-2e1719d02227
md"""
## What is a function?

A function is a block of code that performs a specific task. It takes some input, processes it, and returns some output. Functions are a fundamental building block of programming, and they’re used to organize code into reusable, modular pieces.
"""

# ╔═╡ b62c989d-2ac0-4ea9-b9a3-d4dabb0c0b8f
md"""
## Why are functions important?

Functions are important because they allow us to write code that is more readable, reusable, and maintainable. By breaking our code into smaller, self-contained pieces, we can make it easier to understand and debug. We can also reuse the same function in multiple places, which saves us time and effort.

A function is written like so:

```julia
function function_name(argument1, argument2)
	# Set of statements – Block of code
end
```
"""

# ╔═╡ d6e103e0-5cb1-4799-8c7d-5f372786b9a2
md"""
## Function example

Let's say we want to invest 10000€ on an account providing a 10% annual interest rate. How much will we get after ten years?

Well, the formula is rather simple:

$FV = PV * (1 + r)^n$

where FV is the future value, PV is the present value, r is the annual rate of return, and n is the number of years.

!!! warning
	Please note that this function is only an example and should not be considered as investment advice.

Now we can define a function that will implement the formula for calculating the future value of our investment, as shown below:
"""

# ╔═╡ 4206c4e9-b00b-4026-b742-7ac0f3c9b649
function future_value(investment, rate, years)
	investment * (1 + rate)^years
end

# ╔═╡ 0252f564-e0b8-49ee-8a23-f460541cf50c
md"""
And we can call the function using its name, and the corresponding values for the arguments between parenthesis:
"""

# ╔═╡ 4201a085-aac6-4e5c-b8c4-ab7cbc00ae8b
future_value(10000, 0.10, 10)

# ╔═╡ d173543a-b38e-4f8c-8335-be7991ed9384
md"""
Functions are useful because they allow you to organize your code into reusable, modular pieces, making it easier to read, write, and maintain. You can also pass functions as arguments to other functions, or return them as values. But we'll see that in a moment.
"""

# ╔═╡ 6ff63098-4dc1-4ccf-8293-65a0c368b76b
md"""
## Different forms of functions in Julia

### Long form

Julia has several ways to define and write functions. The long form we saw above is the most common, using the `function` and `end` keywords. This form is good for writing complex or multi-line functions.

Just for reference, here is the definition again:

```julia
function future_value(investment, rate, years)
	investment * (1 + rate)^years
end
```

### Short form

Another way to write functions is the short form, using the `=` sign and a single expression. This form is good for writing simple or one-line functions. For example, you can write the `` function like this:

```julia
future_value(investment, rate, years) = investment * (1 + rate)^years
```

### Anonymous functions

A third way to write functions is using anonymous functions, which are functions without a name. You can create an anonymous function using either the `->` syntax or the `function` syntax. For example, you can create an anonymous function that squares a number like this:

```julia
x -> x^2 # using ->
function (x) x^2 end # using function
```

!!! note
	The first syntax is usually preferred (using `->`)

When you have multiple arguments to the function, you can pass them as a tuple. To define our future value as an anonymous function, we would do this:

```julia
(investment, rate, years) -> investment * (1 + rate)^years
```

!!! note
	Notice how anonymous functions syntax is close to the short-form definition of a function. Remove the function name, and replace `=` with `->`.

Anonymous functions are helpful for passing them to other functions, such as map or filter, that take functions as arguments. They also are extensively used for manipulating `DataFrames`.

For example, you can use an anonymous function to square each element of an array like this:
"""

# ╔═╡ e390f2f4-4d4e-4a5f-8575-91515292d3b8
map(x -> x^2, [1, 2, 3])

# ╔═╡ 72a040c3-aa5e-4197-93fd-047da8a1f4e2
md"""
Or compute the future value of several investments like so:
"""

# ╔═╡ 5376a1d5-4b25-45de-a618-c0ba1a1c8bc2
map((investment, rate, years) -> investment * (1 + rate)^years, [1000.0, 5000.0], [0.15, 0.10], [10, 10])

# ╔═╡ 6279f4cc-bf84-4134-8f44-2d62e788ece7
md"""
## Passing arguments to functions

Arguments are the values that you pass to a function when you call it. They are used to provide data or information to the function. Julia has several ways to pass arguments to functions, depending on how you want to specify them or how the function expects them.

### Positional arguments

The simplest way to pass arguments is by position, meaning that the order of the arguments matters. This is what we used with the `future_value` function above. 

```julia
function future_value(investment, rate, years)
	investment * (1 + rate)^years
end
```

The first value provided to the function call will be given to the function's first argument: `investment`. The second will be given to `rate`, and the third to `years`. This is why we can call the function as follows:
"""

# ╔═╡ aab17c20-1776-4d62-b7b9-3207c01f6d9e
future_value(10000, 0.10, 10)

# ╔═╡ e5533a5f-5d9b-43f4-b62b-e1e33e36da0b
md"""
So, if you swap the order of the arguments, you will get a different result.

### Keyword arguments (kwargs)

Another way to pass arguments is by keyword, meaning that when we call the function, we use the argument name followed by an equal sign and the value (`arg=value`). This way, the order of the arguments does not matter, and we can also omit some arguments if they have default values. 

Keyword arguments are defined after a "`;`" in the argument lists. For example, our previous function would be rewritten like this:

```julia
function future_value(;investment, rate, years)
	investment * (1 + rate)^years
end
```

!!! note
	Notice the `;` after the first parenthesis.

This way, all our arguments have to be named when calling the function:

```julia
future_value(investment=10000, rate=0.10, years=10)
```

We can also mix positional and keyword arguments in the same function. For example, if we want users to name the third argument, we would define the function like so:

```julia
function future_value(investment, rate; years)
	investment * (1 + rate)^years
end
```

And now, users should call the function as:

```julia
future_value(10000, 0.10, years=10)
```

!!! note
	Notice that you can omit the semicolon when calling a function with keyword arguments.

### Default values

We can also define default values for some arguments. For example, if the function is regularly used to compute the future value over 10 years, we could define a default value for `years`:

```julia
function future_value(investment, rate, years=10)
	investment * (1 + rate)^years
end
```

This way, users can call the function providing values for only the two first arguments:

```julia
future_value(10000, 0.10)
```

And Julia will use a value of `10` for `years`.

A pretty nice usage of default values is when using them for `kwargs`:

```julia
function future_value(investment; rate=0.15, years=10)
	investment * (1 + rate)^years
end
```

Because now, users can change the value of `rate` and `years` independently of their position in the function argument list:

```julia
future_value(10000, years = 40)
```
"""

# ╔═╡ 20923c7f-5ea6-4e76-877d-ba5f55a64952
md"""
!!! warning
	Arguments with default values must always be positioned after the arguments that have no default value in the function definition. For example, the following would return an error:
	
	```julia
	function power(p=2, x)
	    return x^p
	end
	```
"""

# ╔═╡ 03c01329-f2e9-4a4a-8e46-0de3c3a022df
md"""
### Do-block syntax

When a function takes a function as its first argument, we can call it with the `do` syntax. This is especially useful when the function we want to pass has several lines.

Let's define a test function that takes a function as argument, and apply it over the second argument:
"""

# ╔═╡ 0dcb8427-31b2-4f35-a799-1e3de3a93c23
function apply_f(f, y)
	f(y)
end

# ╔═╡ b8f3a0ce-363f-4e2c-bb69-8ba1b596c894
md"""
Let's try it by passing the `sin` function with argument 2:
"""

# ╔═╡ 97290a3e-c5ef-4f8b-8db6-1d54cf36a34a
apply_f(sin, 2) # which is the same as sin(2)

# ╔═╡ 0bcc66b5-f35e-4911-a10c-640734d5c489
apply_f(x -> sin(x), 2) 

# ╔═╡ ef1f81f5-51d4-4a58-b271-86c81c68b1a4
md"""
Now if we have a more complicated function, we can use the `dot` syntax like so:
"""

# ╔═╡ bcf9980e-41c8-4252-95fa-cd9e94265526
apply_f(2) do y # The `y` here is the argument passed from the call (=2)
	# This is the code of the function
	x = sin(y + 2) * 3
	return x
end

# ╔═╡ e3aeacbe-7f2c-41e0-b410-bf4efaf5d603
md"""
This is very useful when we need to write a longer function that we would use only once.
"""

# ╔═╡ 1c5a488e-8c2c-4902-991a-7bfa9ab4da6f
md"""
## Return

By default, Julia returns the last evaluated value of the function. Depending on the source, it can be considered a good practice to explicitly `return` the last value for a long-form function definition.

It is also possible to return a value earlier using the `return` statement, for example with an `if` statement:
"""

# ╔═╡ 87370e3f-2960-4126-9093-39f85c183ccb
function test_max(x,y)
	if y < x
		return x
	end
	y
end

# ╔═╡ b2708799-0d22-49bb-ad95-3b3816aa32c9
test_max(1,2)

# ╔═╡ d91eb57c-2c3e-41dc-b548-db8765b436bc
test_max(3,2)

# ╔═╡ a81891c1-2985-4936-932a-0aaa6732ef0e
md"""
## Advanced function topics

In this section, we will cover some more advanced topics related to functions in Julia, such as varargs, argument scope, function composition, piping, and dot syntax.

### Varargs

Varargs are a way to write functions that can take an arbitrary number of arguments. You can write a varargs function by using the … syntax after the last positional argument. For example, you can write a function that sums any number of numbers like this:
"""

# ╔═╡ 1933ed3f-169a-4f58-ab71-a75a1f103122
function sum_all(x...)
    s = 0
    for a in x
        s += a
    end
    return s
end

# ╔═╡ 9090903d-dc84-4190-92ee-eff5f6d30fe6
md"""
This function has one varargs argument x, which is bound to a tuple of all the values passed to the function. You can iterate over this tuple using a for loop, and add each element to a variable s. You can call this function with any number of arguments like this:
"""

# ╔═╡ c1a5a581-bc5c-41d4-a5d9-085b253e4d7d
sum_all(1, 2, 3)

# ╔═╡ ec26788c-caf8-429d-b3b4-a238f0d61763
sum_all(1, 2, 3, 4, 5)

# ╔═╡ 7b3c326a-95ed-44db-9c0e-cb769954bc26
md"""
Varargs are useful for writing functions that can handle variable or unknown numbers of arguments, such as print or println.

### Function scope

The scope of a variable (or object) is the region of code where the variable is visible and can be used.

From the [wikipedia article](https://en.wikipedia.org/wiki/Scope_(computer_science)):

> The scope helps prevent name collisions by allowing the same name to refer to different objects – as long as the names have separate scopes[^1]. 

In Julia, arguments and variables are local to the function body, meaning they are not visible outside the function definition.

So, for example, if we define `x` as a global variable:
"""

# ╔═╡ 44abe57e-e71c-4dd3-a8db-d798e7774517
x = 1

# ╔═╡ d318a526-5099-4ae8-97eb-27e02ebdf19a
md"""
!!! note 
	`x` is a global variable because it is declared in the global scope, *i.e.* not in a function, a module...
"""

# ╔═╡ 265f03f3-52b7-4789-b857-3aed1847457c
md"""
And define a function that has `x` as an argument:
"""

# ╔═╡ 3e83306b-d499-46e7-91b1-126acdc6b962
function f(x) # local argument
    return x
end

# ╔═╡ b3077721-e4e6-42c0-9019-fa388d586a6c
md"""
Both `x` are unrelated, the `x` in the function is another variable internally:
"""

# ╔═╡ 888d1cd2-3a73-47c1-a381-061aabd5baea
f(2)

# ╔═╡ fd9cfc8b-04c7-4f62-8c08-8c4f81c01ed7
md"""
Notice that `f(2)` returns 2, not 1, meaning that the function `f` defines its own `x`.

### Argument scope

The default value of a function argument can be computed from the value of another argument, *e.g.*: 
"""

# ╔═╡ 8c3bd2f8-e60c-4e9f-acdc-a4924da2f4e1
function g(x,y=x*2)
    (;x, y)
end

# ╔═╡ f0ef9ad6-cb0c-4420-b02e-d01cd14fdd55
md"""
In this function, the default value for `y` is twice that of `x`. Let's see if it works:
"""

# ╔═╡ 4612c638-756f-487a-92f5-1770922d984a
g(2)

# ╔═╡ 081a6615-0637-4387-82d2-ddba9ad2c1c6
md"""
That is nice and all, but what happens if we reverse the position?
"""

# ╔═╡ 64aeaaad-ea9c-4145-8e54-08381847d112
function h(y=x*2, x=5)
	(;x, y)
end

# ╔═╡ 2601d38b-9e58-4d78-b65c-2562d343b607
h()

# ╔═╡ 9b622583-182c-41c2-8498-e2c4e73d2bb0
md"""
⚠️ Now that's a problem!⚠️ The `x` in `y=x*2` comes from the global scope! We can check that with the `@code_lowered` macro that shows us the underlying code that is produced when calling `h`:
"""

# ╔═╡ 3cfd08f6-5129-444a-9462-1d05f0ff059b
@code_lowered h()

# ╔═╡ a0c901a7-736a-4fbf-99c3-234ea3cd0f80
md"""
We see on the first line that x comes from `Main` (`Main.var"workspace#376".x`), which is the global scope.
"""

# ╔═╡ 7d9d1ff7-7a20-433b-a62c-5b0b16e25baf
md"""
So keep in mind this sentence from the Julia documentation:

> When optional and keyword argument default expressions are evaluated, only previous arguments are in scope.

This means that we should use this feature very carefully!
"""

# ╔═╡ 601cbb1d-4aaa-4486-a149-09a390765b75
md"""
### Function composition

!!! note 
	This whole section is paraphrased from Julia's documentation:

Function composition is when you combine functions together and apply the resulting composition to arguments. You use the function composition operator (∘) to compose the functions, so (f ∘ g)(args…) is the same as f(g(args…)). For example, you can compose the sqrt and + functions like this:
"""

# ╔═╡ c640d9d6-929d-441e-bf99-9191e10ae48a
(sqrt ∘ +)(3, 4) # what is does is sqrt(3 + 4)

# ╔═╡ f7857f67-4079-42e7-9054-bdae02a71c1f
md"""
This adds the numbers first, then finds the square root of the result. Function composition is useful for creating new functions from existing ones without having to write them explicitly.

Piping is when you apply a function to the previous function’s output. You use the pipe operator (|>) to pipe the functions together, so x |> f |> g is the same as g(f(x)). For example, you can pipe the + and sqrt functions like this:
"""

# ╔═╡ 0ce4dd31-aa65-4c82-b773-ecb3e7b58e9d
3 |> x -> x + 4 |> sqrt

# ╔═╡ 2c5cf5f8-ded4-43e0-b17b-399578e866db
md"""
This takes the value of 3, pipe it (=pass it) to the anonymous function that adds 4 to the input value, then pipe the resulting value to the square root function. Piping is useful for writing code in a clear and readable way, especially when using anonymous functions.

### Broadcasting

Broadcasting is done via the dot syntax (.). It applies a function elementwise to an array or a collection. For example, you can apply the sin function to each element of an array like this:
"""

# ╔═╡ 5fc7eea2-caf9-415f-b4b5-c19e9df1aff2
A = [1.0, 2.0, 3.0]

# ╔═╡ e9bf1ced-7157-4610-ae02-23d4030e978e
sin.(A) # returns [sin(1.0), sin(2.0), sin(3.0)]

# ╔═╡ 301d5880-928c-4169-abb6-2a5ef5a14703
md"""
Dot syntax is useful for performing vectorized operations on arrays or collections without having to write loops or map calls.
"""

# ╔═╡ 0caffce9-e7a5-42a7-b49d-125d857cebfd
md"""
## Conclusion

That’s it for this tutorial on functions in Julia! We’ve learned what functions are, why they’re important, and how to use them. I hope you found this tutorial helpful and informative. Thanks for watching!
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.52"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "f5c06f335ceddc089c816627725c7f55bb23b077"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "91bd53c39b9cbfb5ef4b015e8b582d344532bd0a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "716e24b21538abc91f6205fd1d8363f39b442851"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.7.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "e47cd150dbe0443c3a3651bc5b9cbd5576ab75b7"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.52"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "9673d39decc5feece56ef3940e5dafba15ba0f81"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.1.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

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

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "b7a5e99f24892b6824a954199a45e9ffcc1c70f0"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.7.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─87ab7e19-a993-4d84-8aa5-692316191fb6
# ╟─23ed4932-edaa-11ed-0d5e-73ae08d92ceb
# ╟─55f6ec9f-bdd3-46bd-9703-2e1719d02227
# ╟─b62c989d-2ac0-4ea9-b9a3-d4dabb0c0b8f
# ╟─d6e103e0-5cb1-4799-8c7d-5f372786b9a2
# ╠═4206c4e9-b00b-4026-b742-7ac0f3c9b649
# ╟─0252f564-e0b8-49ee-8a23-f460541cf50c
# ╠═4201a085-aac6-4e5c-b8c4-ab7cbc00ae8b
# ╟─d173543a-b38e-4f8c-8335-be7991ed9384
# ╟─6ff63098-4dc1-4ccf-8293-65a0c368b76b
# ╠═e390f2f4-4d4e-4a5f-8575-91515292d3b8
# ╟─72a040c3-aa5e-4197-93fd-047da8a1f4e2
# ╠═5376a1d5-4b25-45de-a618-c0ba1a1c8bc2
# ╟─6279f4cc-bf84-4134-8f44-2d62e788ece7
# ╠═aab17c20-1776-4d62-b7b9-3207c01f6d9e
# ╟─e5533a5f-5d9b-43f4-b62b-e1e33e36da0b
# ╟─20923c7f-5ea6-4e76-877d-ba5f55a64952
# ╟─03c01329-f2e9-4a4a-8e46-0de3c3a022df
# ╠═0dcb8427-31b2-4f35-a799-1e3de3a93c23
# ╟─b8f3a0ce-363f-4e2c-bb69-8ba1b596c894
# ╠═97290a3e-c5ef-4f8b-8db6-1d54cf36a34a
# ╠═0bcc66b5-f35e-4911-a10c-640734d5c489
# ╟─ef1f81f5-51d4-4a58-b271-86c81c68b1a4
# ╠═bcf9980e-41c8-4252-95fa-cd9e94265526
# ╟─e3aeacbe-7f2c-41e0-b410-bf4efaf5d603
# ╟─1c5a488e-8c2c-4902-991a-7bfa9ab4da6f
# ╠═87370e3f-2960-4126-9093-39f85c183ccb
# ╠═b2708799-0d22-49bb-ad95-3b3816aa32c9
# ╠═d91eb57c-2c3e-41dc-b548-db8765b436bc
# ╟─a81891c1-2985-4936-932a-0aaa6732ef0e
# ╠═1933ed3f-169a-4f58-ab71-a75a1f103122
# ╟─9090903d-dc84-4190-92ee-eff5f6d30fe6
# ╠═c1a5a581-bc5c-41d4-a5d9-085b253e4d7d
# ╠═ec26788c-caf8-429d-b3b4-a238f0d61763
# ╟─7b3c326a-95ed-44db-9c0e-cb769954bc26
# ╠═44abe57e-e71c-4dd3-a8db-d798e7774517
# ╟─d318a526-5099-4ae8-97eb-27e02ebdf19a
# ╟─265f03f3-52b7-4789-b857-3aed1847457c
# ╠═3e83306b-d499-46e7-91b1-126acdc6b962
# ╟─b3077721-e4e6-42c0-9019-fa388d586a6c
# ╠═888d1cd2-3a73-47c1-a381-061aabd5baea
# ╟─fd9cfc8b-04c7-4f62-8c08-8c4f81c01ed7
# ╠═8c3bd2f8-e60c-4e9f-acdc-a4924da2f4e1
# ╟─f0ef9ad6-cb0c-4420-b02e-d01cd14fdd55
# ╠═4612c638-756f-487a-92f5-1770922d984a
# ╟─081a6615-0637-4387-82d2-ddba9ad2c1c6
# ╠═64aeaaad-ea9c-4145-8e54-08381847d112
# ╠═2601d38b-9e58-4d78-b65c-2562d343b607
# ╟─9b622583-182c-41c2-8498-e2c4e73d2bb0
# ╠═3cfd08f6-5129-444a-9462-1d05f0ff059b
# ╟─a0c901a7-736a-4fbf-99c3-234ea3cd0f80
# ╟─7d9d1ff7-7a20-433b-a62c-5b0b16e25baf
# ╟─601cbb1d-4aaa-4486-a149-09a390765b75
# ╠═c640d9d6-929d-441e-bf99-9191e10ae48a
# ╟─f7857f67-4079-42e7-9054-bdae02a71c1f
# ╠═0ce4dd31-aa65-4c82-b773-ecb3e7b58e9d
# ╟─2c5cf5f8-ded4-43e0-b17b-399578e866db
# ╠═5fc7eea2-caf9-415f-b4b5-c19e9df1aff2
# ╠═e9bf1ced-7157-4610-ae02-23d4030e978e
# ╟─301d5880-928c-4169-abb6-2a5ef5a14703
# ╟─0caffce9-e7a5-42a7-b49d-125d857cebfd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
