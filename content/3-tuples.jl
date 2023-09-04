### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 1
#> video = "https://youtu.be/pYTw1LGbRm0"
#> image = "http://img.youtube.com/vi/pYTw1LGbRm0/0.jpg"
#> section = 3
#> order = 3
#> title = "Tuples in Julia"
#> layout = "layout.jlhtml"
#> youtube_id = "pYTw1LGbRm0"
#> description = ""
#> tags = ["lecture", "course"]

using Markdown
using InteractiveUtils

# ╔═╡ 5cde2f8b-2baa-4001-ac1b-5e4d172b087c
begin
using PlutoUI
TableOfContents()
end

# ╔═╡ 44907d2e-961d-11eb-10df-0941e04d14cb
md"""
# Tuples
"""

# ╔═╡ 554b0cbc-0369-41a2-ab8c-318df9f055de
md"""
A Tuple is, like an Array, an ordered set of elements. But there are a few differences between them: tuples are immutable, and they track the type of **each** element they hold. And this is exactly what makes tuples better for performance (_in some cases_)!

Immutability means that once a tuple is declared, we can't change its values.
"""

# ╔═╡ f44c3eec-305d-4945-9715-87a0d26fa2d8
md"""
## Declaration
"""

# ╔═╡ 82950568-8a20-486d-9d3d-a282f6a3d895
md"""
A tuple is declared using a set of parenthesis, and values separated by comas:
"""

# ╔═╡ d8a13e64-c360-4c52-8814-a6b47da14ac8
t = (1,2.0,"3",'4')

# ╔═╡ 2c168e2b-5166-4b32-acc6-f7da7d8ff173
md"""
We can also force the type of the elements using `Tuple` instead:
"""

# ╔═╡ bd3c2922-74c6-4f8f-9934-fcfd6bbee06f
Tuple{Float64, Float64}((1,2.0))

# ╔═╡ 9b5bed59-e176-4088-a324-bae601f2f647
md"""
But it only works if the types of the elements match the one given, or if there's a method for converting one from the other.

To get the type of the values stored in a tuple, we can use `typeof`:
"""

# ╔═╡ cd224da6-fd6a-4847-bb8c-900bb1c190f9
typeof(t)

# ╔═╡ 8b5e6f95-d691-4858-8f88-1125e3fa3cbc
md"""
## Indexing

Because the values are ordered in Tuples, we can index them like arrays:

"""

# ╔═╡ d4b1ac79-896d-41fb-9031-70816c14212c
t[1]

# ╔═╡ c40193e6-6684-4ad7-a901-5ea7362721cc
t[2:end]

# ╔═╡ ef2b058b-7609-4866-a248-7c79b15af516
md"""
## Immutability
"""

# ╔═╡ 8605dd08-bcfb-4e7f-8110-7681dbfc9607
md"""
Tuples are immutable, so we cannot modify their values once declared:
"""

# ╔═╡ 36d961d1-48cd-4c32-8c18-738fcda3906f
t[2] = 3.0

# ╔═╡ f75696b8-7881-4364-a6cf-b5250b5bc1b0
md"""
Immutability can be inconvenient for most usages, but it allows much faster computations. In short and badly explained, your computer knows that immutable structures are not allowed to change over time, so it can move it closer to where the computation happens. If you want more details about that, search for the "heap" and "stack" keywords on the internet.

**But you don't have to understand this at this point, just remember that Tuples make your code fast!**

If you're really interested though, watch the video from Christopher Rackauckas on Youtube, it is very nice and complete (starting at the point he is talking about it):
"""

# ╔═╡ 34826080-d034-49d4-bac7-b7ebd8bdbe7e
html"""<iframe width="560" height="315" src="https://www.youtube.com/embed/M2i7sSRcSIw?start=713" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

# ╔═╡ 7fd450c5-cef6-428d-a6ec-c9543855264d
md"""
[This video](https://www.youtube.com/watch?v=OdQSWuG78Sk) from appskill is also very nice. It is a little bit less technical than the one presented by C. Rackauckas. Note that it is presented for Python, but it is the same for Julia.
"""

# ╔═╡ 27cdab0f-b63f-47a7-b41a-21526c4064fd
md"""
!!! note
	Tuples are very fast for small collections (<32), but slower for larger ones. Prefer using [`StaticArrays.jl`](https://github.com/JuliaArrays/StaticArrays.jl) for this purpose.
"""

# ╔═╡ ec30fbeb-c3eb-4840-a160-b88e88da098d
md"""
## Named tuples
"""

# ╔═╡ f04632ef-7317-464f-a3f4-569605bddb58
md"""
Named tuples associate a name to each value of a tuple. It is declared using a key and a value such as: `(key1 = value1, key2 = value2)`. For example we can declare a named tuple as follows:
"""

# ╔═╡ 0fec09f2-a7c2-40da-87ae-16a86cb56b71
fruits = (apples = 2, bananas = 10, mangos = 3)

# ╔═╡ e96e0d8b-f9f2-46e5-9186-673490b8f200
md"""
To declare a named tuple with a single value, use a coma after the value with no following values, *e.g.*:
"""

# ╔═╡ 946c4244-43d5-49f7-a590-7505d34c2214
a = (1,)

# ╔═╡ 8b7cc509-db43-4863-aee5-a63cb5306d4b
typeof(a)

# ╔═╡ 954c18cc-9285-40f8-b58a-c1245fe85e97
md"""
Because if you don't, it would be considered just a value as it is:
"""

# ╔═╡ faf3b0d0-ab89-42b2-adc6-4429d5352f5b
a2 = (1)

# ╔═╡ 8913c3c7-94ce-4fe6-9fb0-1c7ad91b18d1
typeof(a2)

# ╔═╡ 40c2a077-6d73-46b4-ad4c-6f6e3c03f241
md"""
We can also of course use functions inside the tuple declaration:
"""

# ╔═╡ b52fece2-6b9a-40fb-b52e-37f520ad4a78
(fruits = sum(fruits),)

# ╔═╡ 31a43fe0-8935-44ea-949c-253abde9ef55
md"""
Named tuples have another advantage, we can get a value using its associated name (or key):
"""

# ╔═╡ 49a65821-1d57-4956-a53a-022108ee95fc
fruits.bananas

# ╔═╡ c15ae38e-1c34-40a2-a85b-9f7a32513068
md"""
To list all the keys, we simply use `keys()`:
"""

# ╔═╡ 78d4ed35-a598-48b3-b5a4-1d78b6b58daa
keys(fruits)

# ╔═╡ f2f87137-9e05-4e65-92a2-2ab231722f3e
md"""
And to get all the values, we can use `values()`:
"""

# ╔═╡ 260a279c-3ba2-4dee-96f2-4067e786eaf0
values(fruits)

# ╔═╡ 2690b4fe-f59f-4e1c-915d-922f387bdb7f
md"""
If you want to force the type of an element, use the `@NamedTuple` macro instead:
"""

# ╔═╡ f7a1b6de-75a0-42d4-b612-9f6b74c7023f
@NamedTuple{a::Float64,b::String}((1,"casava"))

# ╔═╡ 4d25895c-0077-484e-83e1-2b78049554cf
md"""
## Recursive Tuples
"""

# ╔═╡ b04fcd8f-e918-4633-9f20-e322dd58e0cf
md"""
We can use tuples inside tuples as follows:
"""

# ╔═╡ e67912cb-74ff-4706-bd20-f83911c962d5
rec_tuple = (fruits = (banana = 2, peach = 5), vegetables = (zucchini = 2, pumpkin = 2))

# ╔═╡ 87de008a-5d64-40d5-8b40-cd5aef61926d
md"""
Then we can still index recursively by chaining the dot syntax:
"""

# ╔═╡ 03ba9fe1-f0f4-4fd2-b3b9-5608c8284a92
zucc = rec_tuple.vegetables.zucchini

# ╔═╡ 7fa8ff01-ca5d-4e7c-a7ec-613c5798310c
md"""
Or by chaining indexing:
"""

# ╔═╡ 215c3fee-2169-415f-ab5c-2023facb18d4
peach = rec_tuple[1][2]

# ╔═╡ 7e44191b-fe23-4d08-a4e0-da76ed55ff69
md"""
## Usefull functions
"""

# ╔═╡ 2787d850-d75e-489d-8540-f995ef159096
md"""
- Length, to get the length of a tuple:
"""

# ╔═╡ 1efad4a7-8c68-4dbf-8c33-dce232af823f
length(fruits)

# ╔═╡ 3b065782-0416-404a-bd36-1addaf07bf80
md"""
- Splatting -*i.e.* providing values as if they were single arguments- is done using `...`:
"""

# ╔═╡ 3db6aba1-e197-43b0-91e5-6e7f5e7755e1
(fruits...,5)

# ╔═╡ 02d7a6c1-6a85-460e-902c-6f0772c4852b
md"""
Check if a tuple is empty:
"""

# ╔═╡ 155bbbde-50ff-4d73-a4e5-406731fc3061
isempty(a)

# ╔═╡ 675ccace-5aba-4710-a7c3-504677877ae4
md"""
## References

- [official documentation](https://docs.julialang.org/en/v1/manual/types/#Tuple-Types)
- [geeksforgeeks](https://www.geeksforgeeks.org/tuples-in-julia/)
- [tutorialspoint](https://www.tutorialspoint.com/julia/julia_tuples.htm)
- [sodocumentation.net](https://sodocumentation.net/julia-lang/topic/6675/tuples)
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
# ╟─44907d2e-961d-11eb-10df-0941e04d14cb
# ╟─554b0cbc-0369-41a2-ab8c-318df9f055de
# ╟─f44c3eec-305d-4945-9715-87a0d26fa2d8
# ╟─82950568-8a20-486d-9d3d-a282f6a3d895
# ╠═d8a13e64-c360-4c52-8814-a6b47da14ac8
# ╟─2c168e2b-5166-4b32-acc6-f7da7d8ff173
# ╠═bd3c2922-74c6-4f8f-9934-fcfd6bbee06f
# ╟─9b5bed59-e176-4088-a324-bae601f2f647
# ╠═cd224da6-fd6a-4847-bb8c-900bb1c190f9
# ╟─8b5e6f95-d691-4858-8f88-1125e3fa3cbc
# ╠═d4b1ac79-896d-41fb-9031-70816c14212c
# ╠═c40193e6-6684-4ad7-a901-5ea7362721cc
# ╟─ef2b058b-7609-4866-a248-7c79b15af516
# ╟─8605dd08-bcfb-4e7f-8110-7681dbfc9607
# ╠═36d961d1-48cd-4c32-8c18-738fcda3906f
# ╟─f75696b8-7881-4364-a6cf-b5250b5bc1b0
# ╟─34826080-d034-49d4-bac7-b7ebd8bdbe7e
# ╟─7fd450c5-cef6-428d-a6ec-c9543855264d
# ╟─27cdab0f-b63f-47a7-b41a-21526c4064fd
# ╟─ec30fbeb-c3eb-4840-a160-b88e88da098d
# ╟─f04632ef-7317-464f-a3f4-569605bddb58
# ╠═0fec09f2-a7c2-40da-87ae-16a86cb56b71
# ╟─e96e0d8b-f9f2-46e5-9186-673490b8f200
# ╠═946c4244-43d5-49f7-a590-7505d34c2214
# ╠═8b7cc509-db43-4863-aee5-a63cb5306d4b
# ╟─954c18cc-9285-40f8-b58a-c1245fe85e97
# ╠═faf3b0d0-ab89-42b2-adc6-4429d5352f5b
# ╠═8913c3c7-94ce-4fe6-9fb0-1c7ad91b18d1
# ╟─40c2a077-6d73-46b4-ad4c-6f6e3c03f241
# ╠═b52fece2-6b9a-40fb-b52e-37f520ad4a78
# ╟─31a43fe0-8935-44ea-949c-253abde9ef55
# ╠═49a65821-1d57-4956-a53a-022108ee95fc
# ╟─c15ae38e-1c34-40a2-a85b-9f7a32513068
# ╠═78d4ed35-a598-48b3-b5a4-1d78b6b58daa
# ╟─f2f87137-9e05-4e65-92a2-2ab231722f3e
# ╠═260a279c-3ba2-4dee-96f2-4067e786eaf0
# ╟─2690b4fe-f59f-4e1c-915d-922f387bdb7f
# ╠═f7a1b6de-75a0-42d4-b612-9f6b74c7023f
# ╟─4d25895c-0077-484e-83e1-2b78049554cf
# ╟─b04fcd8f-e918-4633-9f20-e322dd58e0cf
# ╠═e67912cb-74ff-4706-bd20-f83911c962d5
# ╟─87de008a-5d64-40d5-8b40-cd5aef61926d
# ╠═03ba9fe1-f0f4-4fd2-b3b9-5608c8284a92
# ╟─7fa8ff01-ca5d-4e7c-a7ec-613c5798310c
# ╠═215c3fee-2169-415f-ab5c-2023facb18d4
# ╟─7e44191b-fe23-4d08-a4e0-da76ed55ff69
# ╟─2787d850-d75e-489d-8540-f995ef159096
# ╠═1efad4a7-8c68-4dbf-8c33-dce232af823f
# ╟─3b065782-0416-404a-bd36-1addaf07bf80
# ╠═3db6aba1-e197-43b0-91e5-6e7f5e7755e1
# ╟─02d7a6c1-6a85-460e-902c-6f0772c4852b
# ╠═155bbbde-50ff-4d73-a4e5-406731fc3061
# ╟─675ccace-5aba-4710-a7c3-504677877ae4
# ╟─5cde2f8b-2baa-4001-ac1b-5e4d172b087c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
