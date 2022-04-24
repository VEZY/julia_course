### A Pluto.jl notebook ###
# v0.19.2

using Markdown
using InteractiveUtils

# ╔═╡ 28cc7fa0-c3cf-11ec-0785-0df4a922acf7
md"""
## Compound Expressions

A compound expression is a sequence of statements. 

## Begin...end

If you followed through the previous videos of the tutorial, you already made acquaintance with one of them: the `begin...end` statement.

The `begin...end` statement is used when we want to execute several expressions as if they where executed as a single one. The `begin...end` always returns the last evaluated expression.

Let's take an example:
"""

# ╔═╡ 87084987-db67-4a2a-82f4-6075884e7e54
x = begin
	a = 1
	b = 2
	a + b
end

# ╔═╡ 10365f8e-cb88-4205-9d9f-ffe4cc1a8b15
md"""
Here we put three lines of code inside the `begin...end` statement. We first define the value of `a`, then the value of `b`, and we evaluate their sum. The result of the sum is then returned by the whole expression and assigned to the variable `x`.

All variables created inside the `begin...end` statement are available to the global scope. We can access the value of `a`:
"""

# ╔═╡ 53b44815-5157-4d00-b58f-e1850320d147
a

# ╔═╡ 130967d8-726a-4542-a018-72c359020405
md"""
And the value of `b`:
"""

# ╔═╡ 3e2c281d-e7d3-4cde-b8b1-a89641a32a3e
b

# ╔═╡ 9e9c6afe-f8bf-453b-87ee-99c32e597d50
md"""
And of course the value of `x` too:
"""

# ╔═╡ 3780dae1-6695-49ff-be65-db6fdc990320
x

# ╔═╡ bb119f12-a502-4c90-98fe-a04a8def4a77
md"""
I know that your next question is probably that we could simply not use the `begin...end` statement at all. In this case yes, we could define it like so instead:

```julia
a = 1
b = 2
x = a + b
```

And this would be way more readable. But keep in mind that it is only a rather bad example for keeping it simple. You'll see examples where they are quite usefull in further videos. And actually Pluto notebooks are a good example for that, because if you need to put several lines of code inside a single cell, you are required to use a `begin...end` statement.   
"""

# ╔═╡ 3db818e3-043a-4133-b85c-64a3f3d91530
md"""
## Let...end

Another nice expression that we encountered previously is the `let...end` statement. This one is very similar to the `begin...end` statement, but has one more interesting property: all variables created inside are local variables, meaning they are not exposed to the global scope. 

Let's take an example to better understand. Let's define an expression equivalent to the previous one using `let...end`:
"""

# ╔═╡ 485760ec-e72f-42e3-9a4c-506cbf2fa99a
y = let
	c = 1
	d = 2
	c + d
end

# ╔═╡ 64988325-8a5f-4e46-917a-3e289f0b8f5d
md"""
Ok, seems to be same no? Yes, but the difference is that this time the `c` and `d` variables are not available to us.
"""

# ╔═╡ 683e1fbf-a288-43fe-bf99-ee8d89f20596
c

# ╔═╡ e04f0202-0329-4e16-99a6-b4499ca5722a
md"""
To avoid the error we can test if a variable exist in the global scope using the `@isdefined` macro:
"""

# ╔═╡ e03c5319-1d3e-4132-86db-f9cde880b122
@isdefined c

# ╔═╡ 57b8706f-a0c4-4c98-8d22-afcae590c405
@isdefined d

# ╔═╡ 02a43c78-48bd-4b01-95a4-a2486b603c16
md"""
Another usefull thing of `let...end` is that we can assign the values of outside variables with the same name inside the `let...end` statement, and the variable inside would be a totally different variable:
"""

# ╔═╡ b0f51d40-1086-4afa-86cb-dc4ff756d59d
z = 1

# ╔═╡ 4599c507-64aa-4f25-8cee-2059e54a9c0f
res = let z = z
	z = z + 1
end

# ╔═╡ 44dbb163-871e-40d7-becf-eb916112f227
md"""
What is the value of res know? Well we see it right above, it is 2. Because it is the result of the last evaluated expression inside the `let...end` statement. But what is the value of `z` now?

If you followed, the value of `z` didn't change, because we changed the value of a totally different `z`, the one inside the `let...end` statement that creates a new scope:
"""

# ╔═╡ f7fd84a2-f53d-40b4-8eda-117f4ac511da
z

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─28cc7fa0-c3cf-11ec-0785-0df4a922acf7
# ╠═87084987-db67-4a2a-82f4-6075884e7e54
# ╟─10365f8e-cb88-4205-9d9f-ffe4cc1a8b15
# ╠═53b44815-5157-4d00-b58f-e1850320d147
# ╟─130967d8-726a-4542-a018-72c359020405
# ╠═3e2c281d-e7d3-4cde-b8b1-a89641a32a3e
# ╟─9e9c6afe-f8bf-453b-87ee-99c32e597d50
# ╠═3780dae1-6695-49ff-be65-db6fdc990320
# ╟─bb119f12-a502-4c90-98fe-a04a8def4a77
# ╟─3db818e3-043a-4133-b85c-64a3f3d91530
# ╠═485760ec-e72f-42e3-9a4c-506cbf2fa99a
# ╟─64988325-8a5f-4e46-917a-3e289f0b8f5d
# ╠═683e1fbf-a288-43fe-bf99-ee8d89f20596
# ╟─e04f0202-0329-4e16-99a6-b4499ca5722a
# ╠═e03c5319-1d3e-4132-86db-f9cde880b122
# ╠═57b8706f-a0c4-4c98-8d22-afcae590c405
# ╟─02a43c78-48bd-4b01-95a4-a2486b603c16
# ╠═b0f51d40-1086-4afa-86cb-dc4ff756d59d
# ╠═4599c507-64aa-4f25-8cee-2059e54a9c0f
# ╟─44dbb163-871e-40d7-becf-eb916112f227
# ╠═f7fd84a2-f53d-40b4-8eda-117f4ac511da
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
