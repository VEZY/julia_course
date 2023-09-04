### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 1
#> video = "https://youtu.be/Jip2Ym5DsxQ"
#> image = "http://img.youtube.com/vi/Jip2Ym5DsxQ/0.jpg"
#> section = 1
#> order = 1
#> title = "Variables and basic types in Julia"
#> layout = "layout.jlhtml"
#> youtube_id = "Jip2Ym5DsxQ"
#> description = ""
#> tags = ["lecture", "course"]

using Markdown
using InteractiveUtils

# ╔═╡ 3eb7b97f-1b41-432f-9cdd-b8baf3ca7ddf
begin
using PlutoUI
TableOfContents()
end

# ╔═╡ e5b53410-63cf-11eb-2532-358a68b59eb9
md"# Variables and basic types in Julia"

# ╔═╡ 16f1e0f0-63d0-11eb-2ee4-8f8be24866e8
md"## Variables"

# ╔═╡ 31972af0-63d0-11eb-3e22-bb3370a9e40d
md"""A variable is simply a name associated to any type of value. 

To declare a new variable, we use `=`, also named assignment operator:"""

# ╔═╡ 9d83cca0-63d0-11eb-0346-751060e8cab5
a = 1

# ╔═╡ ffed727d-b072-4797-9667-dc3a1c7e0109
a

# ╔═╡ ba8fdd70-63d0-11eb-0565-f3e77f3f802f
md"Instead of repeating the value, we can then use the variable directly:"

# ╔═╡ a8247100-63d0-11eb-0442-11949579c4ba
b = a + 2

# ╔═╡ f1641eb0-63d0-11eb-2ed0-d5ab1ce695ae
md"""You can name your variables as you want, except for some few reserved words such as `true`, `false`, `if`, `else`, because they are part of the language itself. We will see what they mean later. You can find the list of reserved keywords [here](https://docs.julialang.org/en/v1/base/base/#Keywords).

Julia also allow using **Unicode characters**, which is awesome!

See by yourself:
"""

# ╔═╡ e20a69a0-63d1-11eb-3f1e-159164d5e71d
α = 2

# ╔═╡ 2a77d330-63d2-11eb-16c3-d3be6a6d9975
md"α is written by typing `\alpha` and then `ctrl+enter`.
`ctrl+enter` is used for autocompletion. We can even use emojis: 
"

# ╔═╡ f85e81f0-63d1-11eb-2385-0196982bc487
🌴 = 25.0

# ╔═╡ 8ab14f10-63d2-11eb-3874-073f07427a26
md"And it is valid Julia code."

# ╔═╡ 257727a2-63d2-11eb-311b-0b14f3d0f747
α + 🌴

# ╔═╡ b6873b92-63d2-11eb-1a56-1d01d825cf01
md"As a sidenote, it is a convention to name your variable using lower case, and to separate words by underscores if needed, *e.g.*:"

# ╔═╡ e76d15e0-63d2-11eb-111e-8b0637007258
	savings = 5500.0

# ╔═╡ fa35e490-63d2-11eb-210d-0b44aeb5cbfa
bike_price = 5000.0

# ╔═╡ 68fb21b0-63d3-11eb-1792-45baa321e122
remaining_money = savings - bike_price

# ╔═╡ 6f7a56f0-63d3-11eb-113b-b11ac60caaed
md"If I buy this bike, I'll have $(remaining_money) € or $ or whatever on my account."

# ╔═╡ 8813c0d0-63d2-11eb-1723-3b802f8a9f54
md"## Basic types"

# ╔═╡ a067ae80-63d7-11eb-3d1e-39eae17d3434
md"### Listing basic types"

# ╔═╡ f4b09520-63d1-11eb-25d9-7564a91fa7d5
md"""
Values are all defined by a type. For example `1` is called an integer. We can see the type of a variable using `typeof()` 

The most basic types are:

- Integers, numbers with no fractional part:
"""

# ╔═╡ ba6332b0-63d1-11eb-17a5-0160686e19e7
cars = 10

# ╔═╡ 6fa8ab30-63d9-11eb-0ce9-0f64d74d9b96
md"And the actual name of the type is:"

# ╔═╡ fe28579e-63d6-11eb-31c6-59b910298cc2
typeof(cars)

# ╔═╡ ccd15a10-63d8-11eb-2cce-9b5b18f2f003
md"Note it is called an `Int64`, not just `Int`. This is because my machine has a 64-bit architecture. If you run on a 32-bits machine, you would get `Int32` by default. This is all technical details, but if you're interested you can find more information [here](https://docs.julialang.org/en/v1/manual/integers-and-floating-point-numbers/)"

# ╔═╡ 3279b400-63d6-11eb-093a-4539f1254a83
md"- Floating point numbers, meaning numbers with a fractional part:"

# ╔═╡ 3d9d6b0e-63d6-11eb-2cc1-39a76f290513
max_speed = 250.0

# ╔═╡ 0d5dc660-63d7-11eb-0458-29b554125fce
typeof(max_speed)

# ╔═╡ 53e9e240-63d6-11eb-00dc-098c64e573f1
md"- Characters, just one character defined using `'...'`:"

# ╔═╡ 61ffb030-63d6-11eb-059d-e912b2c828fb
rank = 'A'

# ╔═╡ 1204e040-63d7-11eb-2c61-e3f212329a44
typeof(rank)

# ╔═╡ 72e5b520-63d6-11eb-0463-3bd1d3643d15
md"""- Strings, one or several characters defined using `"..."`:"""

# ╔═╡ 7b9537e0-63d6-11eb-1d93-d3e253614910
brand = "Tesla"

# ╔═╡ 19752c40-63d7-11eb-0500-11c3318c9319
typeof(brand)

# ╔═╡ 48cab050-63dc-11eb-2f06-651fa9acbd54
md"""NB: A single character declared using `"..."` instead of `'...'` is still a String, not a character:"""

# ╔═╡ 69283610-63dc-11eb-1d97-25d73d0ce439
typeof("T")

# ╔═╡ 27efd680-63d7-11eb-0701-67d7c4fc2847
md"- Booleans, logical type, either `true` or `false`:"

# ╔═╡ 5c08ef5e-63d7-11eb-34d0-dfa5f605cc6c
is_awesome = true

# ╔═╡ 6cf7f500-63d7-11eb-285a-4db31a47e386
typeof(is_awesome)

# ╔═╡ 91be39d0-63dc-11eb-3275-f17059662b87
md"NB: `true` and `false` are written in lower case, and are reserved keywords, meaning you can cannot assign values to them."

# ╔═╡ 934d5790-63d7-11eb-3ff1-49bc42858003
md"### Conversion"

# ╔═╡ c4fdd4e0-63d7-11eb-338c-997af2ea699f
md"Some types can be converted one into another. To do so, you can use `convert()`, or the name of the type to convert into as follows:"

# ╔═╡ 34e61ce5-96ad-4a99-a0e3-57ee579834a3
typeof(cars)

# ╔═╡ d40d9330-63d7-11eb-2ca7-95207f940b2e
convert(Float64,cars)

# ╔═╡ b458b410-63d8-11eb-3860-8dca66bf91c7
md"or:"

# ╔═╡ b3875a50-63d8-11eb-25dc-f751d868901d
Float64(cars)

# ╔═╡ ad93f4e0-63d9-11eb-240b-f3a189a9c94c
md"We can also transform it into a string using `string()`:"

# ╔═╡ b8a905f0-63d9-11eb-221d-b11ce15217e9
cars_string = string(cars)

# ╔═╡ 13b8a362-63da-11eb-203d-89ba55e487d0
md"...and back into an integer using `parse()`:"

# ╔═╡ 1c771a40-63da-11eb-10a0-7b33fdaf574b
parse(Int,cars_string)

# ╔═╡ 9f525c00-63d9-11eb-08f0-c1e0b1dd9b91
md"Some types cannot be converted into another without loss of information. For example what if you convert a float like `2.2` into an integer? "

# ╔═╡ 89ce2162-63da-11eb-149a-8d58c6c324ed
Int(2.2)

# ╔═╡ 904c6c40-63da-11eb-3324-43f814d0e102
md"Julia returns an `InexactError` because there is a loss of information here (the `.2` part). But what about `2.0` then?"

# ╔═╡ b16d9020-63da-11eb-23a2-6b67ea2813c0
Int(2.0)

# ╔═╡ b62b3f40-63da-11eb-2206-951745a869ee
md"It works! Why? Because there is no loss of information here. What you should do in the case of `2.2`? Cut out some information:" 

# ╔═╡ 9d60cfc0-63da-11eb-093f-6b7f21c7d5fa
rounded = round(2.2)

# ╔═╡ 1db52310-63db-11eb-0c78-eb033ec18343
md"Now we can convert it into an integer safely:"

# ╔═╡ 15146d5e-63db-11eb-303d-0bc6c062359b
Int(rounded)

# ╔═╡ 3562b0e0-63db-11eb-18bc-514ffe3a0d56
md"There is also a shortcut for that:"

# ╔═╡ 40ca4ec0-63db-11eb-0aec-db92ee1848d2
round(Int,2.2)

# ╔═╡ 4602d330-63db-11eb-25f3-69cf04127264
md"You can also use other functions such as `floor()`, `ceil()` or `trunk()`."

# ╔═╡ 10c15500-63dd-11eb-17dc-67783d644ca2
md"### Promotion"

# ╔═╡ 18016940-63dd-11eb-1232-f15f2ce37d58
md"""Promotion is converting multiple values with different types into a single common type with the least loss of information. Not all types have a promotion rule, but Real numbers do:"""

# ╔═╡ 41b008f0-63dd-11eb-0975-7fbab120ad8b
promote(1.0,1)

# ╔═╡ 8c1e4b90-63dd-11eb-34a3-0d118a0eb642
md"Here `promote()` returned both arguments as floating point numbers."

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
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

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
# ╟─e5b53410-63cf-11eb-2532-358a68b59eb9
# ╟─16f1e0f0-63d0-11eb-2ee4-8f8be24866e8
# ╟─31972af0-63d0-11eb-3e22-bb3370a9e40d
# ╠═9d83cca0-63d0-11eb-0346-751060e8cab5
# ╠═ffed727d-b072-4797-9667-dc3a1c7e0109
# ╟─ba8fdd70-63d0-11eb-0565-f3e77f3f802f
# ╠═a8247100-63d0-11eb-0442-11949579c4ba
# ╟─f1641eb0-63d0-11eb-2ed0-d5ab1ce695ae
# ╠═e20a69a0-63d1-11eb-3f1e-159164d5e71d
# ╟─2a77d330-63d2-11eb-16c3-d3be6a6d9975
# ╠═f85e81f0-63d1-11eb-2385-0196982bc487
# ╟─8ab14f10-63d2-11eb-3874-073f07427a26
# ╠═257727a2-63d2-11eb-311b-0b14f3d0f747
# ╟─b6873b92-63d2-11eb-1a56-1d01d825cf01
# ╠═e76d15e0-63d2-11eb-111e-8b0637007258
# ╠═fa35e490-63d2-11eb-210d-0b44aeb5cbfa
# ╠═68fb21b0-63d3-11eb-1792-45baa321e122
# ╟─6f7a56f0-63d3-11eb-113b-b11ac60caaed
# ╟─8813c0d0-63d2-11eb-1723-3b802f8a9f54
# ╟─a067ae80-63d7-11eb-3d1e-39eae17d3434
# ╟─f4b09520-63d1-11eb-25d9-7564a91fa7d5
# ╠═ba6332b0-63d1-11eb-17a5-0160686e19e7
# ╟─6fa8ab30-63d9-11eb-0ce9-0f64d74d9b96
# ╠═fe28579e-63d6-11eb-31c6-59b910298cc2
# ╟─ccd15a10-63d8-11eb-2cce-9b5b18f2f003
# ╟─3279b400-63d6-11eb-093a-4539f1254a83
# ╠═3d9d6b0e-63d6-11eb-2cc1-39a76f290513
# ╠═0d5dc660-63d7-11eb-0458-29b554125fce
# ╟─53e9e240-63d6-11eb-00dc-098c64e573f1
# ╠═61ffb030-63d6-11eb-059d-e912b2c828fb
# ╠═1204e040-63d7-11eb-2c61-e3f212329a44
# ╟─72e5b520-63d6-11eb-0463-3bd1d3643d15
# ╠═7b9537e0-63d6-11eb-1d93-d3e253614910
# ╠═19752c40-63d7-11eb-0500-11c3318c9319
# ╟─48cab050-63dc-11eb-2f06-651fa9acbd54
# ╠═69283610-63dc-11eb-1d97-25d73d0ce439
# ╟─27efd680-63d7-11eb-0701-67d7c4fc2847
# ╟─5c08ef5e-63d7-11eb-34d0-dfa5f605cc6c
# ╠═6cf7f500-63d7-11eb-285a-4db31a47e386
# ╟─91be39d0-63dc-11eb-3275-f17059662b87
# ╟─934d5790-63d7-11eb-3ff1-49bc42858003
# ╟─c4fdd4e0-63d7-11eb-338c-997af2ea699f
# ╠═34e61ce5-96ad-4a99-a0e3-57ee579834a3
# ╠═d40d9330-63d7-11eb-2ca7-95207f940b2e
# ╟─b458b410-63d8-11eb-3860-8dca66bf91c7
# ╠═b3875a50-63d8-11eb-25dc-f751d868901d
# ╟─ad93f4e0-63d9-11eb-240b-f3a189a9c94c
# ╠═b8a905f0-63d9-11eb-221d-b11ce15217e9
# ╟─13b8a362-63da-11eb-203d-89ba55e487d0
# ╠═1c771a40-63da-11eb-10a0-7b33fdaf574b
# ╟─9f525c00-63d9-11eb-08f0-c1e0b1dd9b91
# ╠═89ce2162-63da-11eb-149a-8d58c6c324ed
# ╟─904c6c40-63da-11eb-3324-43f814d0e102
# ╠═b16d9020-63da-11eb-23a2-6b67ea2813c0
# ╟─b62b3f40-63da-11eb-2206-951745a869ee
# ╠═9d60cfc0-63da-11eb-093f-6b7f21c7d5fa
# ╟─1db52310-63db-11eb-0c78-eb033ec18343
# ╠═15146d5e-63db-11eb-303d-0bc6c062359b
# ╟─3562b0e0-63db-11eb-18bc-514ffe3a0d56
# ╠═40ca4ec0-63db-11eb-0aec-db92ee1848d2
# ╟─4602d330-63db-11eb-25f3-69cf04127264
# ╟─10c15500-63dd-11eb-17dc-67783d644ca2
# ╟─18016940-63dd-11eb-1232-f15f2ce37d58
# ╠═41b008f0-63dd-11eb-0975-7fbab120ad8b
# ╟─8c1e4b90-63dd-11eb-34a3-0d118a0eb642
# ╟─3eb7b97f-1b41-432f-9cdd-b8baf3ca7ddf
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
