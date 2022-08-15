### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ 91e59a74-0528-4e93-8689-ebabc1ff829b
using PlutoUI

# ╔═╡ c2596a60-c3cb-11ec-1a08-abf4528a9955
md"""
# Control flow: loops

## For loops

For loops help us execute code several times over. They are written like so:

```julia
for i in range
	[...]
end
```

The `for` loop can be read as:

> for each `i` value in `range`, execute the code in `[...]`:

The `range` expression can be any iterable object. It usually is a range, vector, tuple or string. 

Let's start with a simple range example:
"""

# ╔═╡ ec5370b1-c18e-4e21-87a1-dcb80110c771
for i in 1:3
	println(i)
end

# ╔═╡ 55dadc95-8e41-4d52-84da-07bfbcd2dbaa
md"""
As stated before, we can use any iterable in the for loop:

- a range:
"""

# ╔═╡ a00fc8b0-fa5b-415d-a5a4-1b7190b83e08
for i in 1:3
	println(i)
end

# ╔═╡ 6f9c7fb7-9249-4e9b-89c5-a57cf5ebe283
md"""
- A vector:
"""

# ╔═╡ 1525da6e-588d-4dd1-9fc1-d6929df863a7
for i in [3,4,5]
	println(i)
end

# ╔═╡ 0e2e983b-90bf-4bd2-9814-45caf12a13ab
md"""
- a tuple:
"""

# ╔═╡ 4489f4c4-356b-46b8-b3b3-41d24fd3efd9
for i in (7,4,1)
	println(i)
end

# ╔═╡ 7439bae4-8f59-418f-b5af-da6bf9c7509f
md"""
- a NamedTuple:
"""

# ╔═╡ 3b27cb5e-c666-4f9e-8ce7-29f4052fb631
for i in (a = 7, b = 4, c = 1)
	println(i)
end

# ╔═╡ 220ef4de-d145-459e-9b62-7a7d8d251d2c
md"""
- or a Dict:
"""

# ╔═╡ 5451a806-5229-49bc-a8e8-0ae29ba24e63
for i in Dict(:a => 7, :b => 4, :c => 1)
	println(i)
end

# ╔═╡ b9661b87-6e70-44b1-9dc8-fdde60944e3c
md"""
A nice synthax with dicts is that we can also use the keys and the values inside the loop as two different variables:
"""

# ╔═╡ 7aca216b-6c58-4b59-bda3-6cf2808e8e95
for (key,value) in Dict(:a => 1, :b => 2, :c => 3)
	println("key: ", key, ", value: ", value)
end

# ╔═╡ ccf3fa21-9aa7-4e96-b582-357680897aa4
md"""

Interesting, but not very useful. Loops are generally used to compute a value based on the range. It can be for example summing the values of a vector:
"""

# ╔═╡ 8c67fd66-a0cf-4e5c-88b5-3feb03432aad
begin
	x = 0
	rand_vec = rand(Float64, 10)
	for i in eachindex(rand_vec)
		println(i)
		global x += rand_vec[i]
	end
	x
end

# ╔═╡ 5d997430-e195-4aac-8d5f-3e188b125ae3
md"""
In this case we used `eachindex` to iterate over `rand_vec`. This loop mean:

> iterate over each value in `rand_vec`, and add each of these value (`rand_vec[i]`) to the global variable `x`.

The output is then the sum of all values in `rand_vec`. We'll see below why we need a `global` variable here.
"""

# ╔═╡ 05c09644-e316-489f-8297-17f62a16e643
md"""
## Helpers
"""

# ╔═╡ 63dd4c31-c255-4757-9cfb-33f47b8684a4
md"""
- `eachindex`: automatically iterate over all elements of an object 
"""

# ╔═╡ 17a645cd-ed3e-4a04-9875-26ca749b8376
for i in eachindex([2, 3, 5])
	println(i)
end

# ╔═╡ 644b9835-a597-4d37-9e7f-73509321868c
md"""
- `enumerate`: like `eachindex` iterate over all elements of an object, but gives the index **and** value of the iteration as a tuple
"""

# ╔═╡ b0fd2dc6-38c9-4e2e-a6f3-00b5e7259b8b
for i in enumerate([2, 3, 5])
	println(i)
end

# ╔═╡ 65896c65-5739-4866-aa22-b7ea105fd59d
for (index,value) in enumerate([2, 3, 5])
	println("index: ", index,", value: ", value)
end

# ╔═╡ 0946e28e-bc53-4d60-94d4-20fb44374d92
md"""
- `continue`: goes to the next iteration without executing the code below
"""

# ╔═╡ ff3bf9db-22fe-4c06-81d0-b774e0192a54
for i in 1:5
	i < 3 && continue # execute this line only if i < 3
	println(i)
end

# ╔═╡ 39563921-fbed-496a-90a3-24af69087eaf
md"""
- `break`: break the loop, *i.e* stop the iterations
"""

# ╔═╡ 68142e98-46df-4fd4-9bf7-e18efc6d6109
for i in 1:5
	i == 4 && break # stop the iterations if i == 4
	println(i)
end

# ╔═╡ a20a624e-879b-44da-aacd-d5d8048489dc
md"""
## Using two iterators

Sometimes we need to iterate over two iterators, for example if we need to iterate over the columns and rows of a matrix:
"""

# ╔═╡ 14bd9a0b-f757-4dde-a5ec-b6dbdaf7b905
let
	mat = zeros(3,3)
	
	for col in 1:3
		for row in 1:3
			mat[row,col] = row * col	
		end
	end
	
	mat
end

# ╔═╡ fd14d1af-33b5-413f-b0be-840b7ab2d7d7
md"""
Well this notation can be compacted to be on the same line of code such as:
"""

# ╔═╡ 490ec494-f450-4b3f-80c8-d92bc84768cc
let
	mat = zeros(3,3)
	
	for col in 1:3, row in 1:3
			mat[row,col] = row * col	
	end
	
	mat
end

# ╔═╡ 90e230bb-c589-48f0-b5ce-adaca2ca919a
md"""
!!! note
	Notice that we iterate on the rows of the matrix in the inner-for loop, and on the column in the outer-loop. This is because Julia stores the information in a column-major way, meaning two contiguous elements of the same column will also be contiguous in memory. Iterating over rows before columns ensures that we iterate over elements that are next to each other on the memory, which is faster.
"""

# ╔═╡ 7406c3c5-7703-41cf-89e9-e27932a13d47
md"""
## Array comprehension

In Julia, we can create objects directly from a loop, this is called array comprehension when creating an array. For example if we want to create an array filled with three random values, we would do:
"""

# ╔═╡ 7ecdd614-5a0b-4cde-9577-34bf3b7bc77b
[i for i in rand(Int, 3)]

# ╔═╡ be44e7d0-6520-4a75-a85a-d8b686bd9724
md"""
It also works for other types of objects such as `Dict`: 
"""

# ╔═╡ 9787a757-7832-440c-bf68-9b380426b185
Dict(key => value for key in [:🍎, :🍍, :🍑], value in [10, 3, 20])

# ╔═╡ 9447965a-9792-4641-8da3-545a2cee499c
md"""
## Scope
"""

# ╔═╡ c10fcd00-e8fe-4e4b-acc4-8dfea32bd005
md"""
!!! warning 
	This section is presented here for completeness only. The concept of variable scope will be introduced in a further tutorial. It is completely ok if you don't understand what is written below just yet. 
"""

# ╔═╡ e78f6a0a-c674-4805-8757-7e8611aee6d4
md"""
There are two things to keep in mind when using a `for` loop:

- The `for` loop introduces a local scope, it means that any variable created inside the loop is not available outside.

- The for loop cannot update a global variable if it already exist because it would be ambiguous. So either we explicitely declare it `local` to create a new local variable or `global` to update the global variable. 
"""

# ╔═╡ 93f57ac3-97aa-48d1-94ee-581d021c8879
md"""
Here is a failed attempt of updating a global variable (`a`) from within the `for` loop without telling Julia what to do: 
"""

# ╔═╡ c157e614-9e49-4cce-8d88-16a9f7de4041
begin
	a = 0
	for i in 1:3
		b = 1 + i
		a += b
	end
	(a, @isdefined b)
end

# ╔═╡ c6c306f6-61c9-402e-93f2-7f481d454341
md"""
!!! note
	It will work if you copy/paste the code in the REPL because it behaves a little bit differently to ease the interactive development, for example it helps developers to copy/paste code from within a function and will work as in the function.   
"""

# ╔═╡ 46cd4ec8-7f49-4110-9d7e-3342cbcd0118
md"""
Here it is obvious that our intent was to update the value of the global variable `a`. To do so, we have to say it explicitely inside the loop using the `global` keyword:
"""

# ╔═╡ 77cfe1ec-1c0e-49c3-916c-008774c4d8e7
begin
	a2 = 0
	for i in 1:3
		b = 1 + i
		global a2 += b
	end
	(a2, @isdefined b)
end

# ╔═╡ 0a8ff445-9367-4e4f-8922-13560e4d255a
md"""
Another simpler solution is to put the code inside a function:
"""

# ╔═╡ 158ef56a-9c76-4ca5-8205-0e06a7017417
begin
	function test()
		a = 0
		for i in 1:3
			b = 1 + i
			a += b
		end
		(a, @isdefined b)
	end

	test()
end

# ╔═╡ 381c010b-ab4d-4042-99ab-aadc7c17e063
md"""
This time it will work because the function introduces a local scope, so `a` already exists as a local variable, no need to tell Julia the for loop updates `a` from before, it is already obvious. 
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

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

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

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
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

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

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═91e59a74-0528-4e93-8689-ebabc1ff829b
# ╟─c2596a60-c3cb-11ec-1a08-abf4528a9955
# ╠═ec5370b1-c18e-4e21-87a1-dcb80110c771
# ╟─55dadc95-8e41-4d52-84da-07bfbcd2dbaa
# ╠═a00fc8b0-fa5b-415d-a5a4-1b7190b83e08
# ╟─6f9c7fb7-9249-4e9b-89c5-a57cf5ebe283
# ╠═1525da6e-588d-4dd1-9fc1-d6929df863a7
# ╟─0e2e983b-90bf-4bd2-9814-45caf12a13ab
# ╠═4489f4c4-356b-46b8-b3b3-41d24fd3efd9
# ╟─7439bae4-8f59-418f-b5af-da6bf9c7509f
# ╠═3b27cb5e-c666-4f9e-8ce7-29f4052fb631
# ╟─220ef4de-d145-459e-9b62-7a7d8d251d2c
# ╠═5451a806-5229-49bc-a8e8-0ae29ba24e63
# ╟─b9661b87-6e70-44b1-9dc8-fdde60944e3c
# ╠═7aca216b-6c58-4b59-bda3-6cf2808e8e95
# ╟─ccf3fa21-9aa7-4e96-b582-357680897aa4
# ╠═8c67fd66-a0cf-4e5c-88b5-3feb03432aad
# ╟─5d997430-e195-4aac-8d5f-3e188b125ae3
# ╟─05c09644-e316-489f-8297-17f62a16e643
# ╟─63dd4c31-c255-4757-9cfb-33f47b8684a4
# ╠═17a645cd-ed3e-4a04-9875-26ca749b8376
# ╟─644b9835-a597-4d37-9e7f-73509321868c
# ╠═b0fd2dc6-38c9-4e2e-a6f3-00b5e7259b8b
# ╠═65896c65-5739-4866-aa22-b7ea105fd59d
# ╟─0946e28e-bc53-4d60-94d4-20fb44374d92
# ╠═ff3bf9db-22fe-4c06-81d0-b774e0192a54
# ╟─39563921-fbed-496a-90a3-24af69087eaf
# ╠═68142e98-46df-4fd4-9bf7-e18efc6d6109
# ╟─a20a624e-879b-44da-aacd-d5d8048489dc
# ╠═14bd9a0b-f757-4dde-a5ec-b6dbdaf7b905
# ╟─fd14d1af-33b5-413f-b0be-840b7ab2d7d7
# ╠═490ec494-f450-4b3f-80c8-d92bc84768cc
# ╟─90e230bb-c589-48f0-b5ce-adaca2ca919a
# ╟─7406c3c5-7703-41cf-89e9-e27932a13d47
# ╠═7ecdd614-5a0b-4cde-9577-34bf3b7bc77b
# ╟─be44e7d0-6520-4a75-a85a-d8b686bd9724
# ╠═9787a757-7832-440c-bf68-9b380426b185
# ╟─9447965a-9792-4641-8da3-545a2cee499c
# ╟─c10fcd00-e8fe-4e4b-acc4-8dfea32bd005
# ╟─e78f6a0a-c674-4805-8757-7e8611aee6d4
# ╟─93f57ac3-97aa-48d1-94ee-581d021c8879
# ╠═c157e614-9e49-4cce-8d88-16a9f7de4041
# ╟─c6c306f6-61c9-402e-93f2-7f481d454341
# ╟─46cd4ec8-7f49-4110-9d7e-3342cbcd0118
# ╠═77cfe1ec-1c0e-49c3-916c-008774c4d8e7
# ╟─0a8ff445-9367-4e4f-8922-13560e4d255a
# ╠═158ef56a-9c76-4ca5-8205-0e06a7017417
# ╟─381c010b-ab4d-4042-99ab-aadc7c17e063
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
