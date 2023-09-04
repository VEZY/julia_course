### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 1
#> video = "https://www.youtube.com/watch?v=k2aGzLvN4uA"
#> image = "http://img.youtube.com/vi/k2aGzLvN4uA/0.jpg"
#> section = 5
#> order = 5
#> title = "Basic operators"
#> layout = "layout.jlhtml"
#> youtube_id = "k2aGzLvN4uA"
#> description = ""
#> tags = ["lecture", "course"]

using Markdown
using InteractiveUtils

# ╔═╡ a8c574f0-b3e0-475a-8d49-422c0f47e1fe
begin
using PlutoUI
TableOfContents()
end

# ╔═╡ c819a820-13d1-11ec-174e-31eef4e20fc4
md"""
# Basic operators

Operators are symbols used to perform for example a basic mathematical operation. Some are very easy and straighforward, some are a little bit more complicated.

Let's start by the simple ones.

## Numeric operators

They include +, -, / and *, and are simply used as with a calculator as follows:
"""

# ╔═╡ 63b315e1-6bab-48d2-9992-6e6598bdf5fb
1 + 2

# ╔═╡ e874c232-256c-4d9f-a214-e526192be0cd
1 - 2

# ╔═╡ 4c362d08-3b79-44e3-8b48-0f9231526dca
1 * 2

# ╔═╡ f9ec2db0-d20a-4aac-ad24-66df4c7e6bde
1 / 2

# ╔═╡ 2222f963-31d7-460c-940f-4b544b3bc8a2
md"""
There is also the equal sign to assign a value to a variable:
"""

# ╔═╡ 36732368-836f-46bb-9a75-b75b10890505
a = 1

# ╔═╡ 9cb19c7e-9218-4f37-be67-c1e5d7b5a883
a

# ╔═╡ e43721b6-d642-4b6e-88ff-2bc48635effa
md"""
There's the integer division using ÷ (`\div` + tab)
"""

# ╔═╡ cc9cff27-b864-475b-b162-0503dc308432
1 ÷ 2

# ╔═╡ 98f549a9-1757-4e7c-bfac-0bf0d951b10d
md"""
To get the reminder of a division, we use the modulus, which is defined by the percent sign:
"""

# ╔═╡ 0272780b-6ace-499a-bf2b-441b9a148de4
1 % 2

# ╔═╡ 9f59bff0-bc85-4f36-b92c-d84e25cbdd9e
md"""
This is especially usefull if you want to know if the value of a variable is odd or even. To do so, you would use the remainder of the division by 2, which gives 0 for an even number, and 1 for an odd number:  
"""

# ╔═╡ 7ed2ed34-f811-40c5-b6d2-17b7263f934c
a % 2

# ╔═╡ 00b8743b-8597-4fea-82d9-c191bfe73050
b = 2

# ╔═╡ 72ffc8b6-8543-42d2-b0bf-1640ccfcdea7
b % 2

# ╔═╡ 1df480ee-375f-421f-bfe6-cac883d290e3
md"""
To raise a value to the power of a number, we can use the caret:
"""

# ╔═╡ 278e7cb7-f760-4df2-8bdf-c87f1b8f5bec
2^4

# ╔═╡ 74bb4a3d-1d27-4555-8a47-98472ead2c9a
md"""
There are some short-hands if you want to update the value of a variable:
"""

# ╔═╡ ebc07294-3d9b-4973-b2b6-1afb535dc1ae
let
var = 1
var += 1
end

# ╔═╡ 73ced44d-503a-46a7-b1df-4db81e21375c
let
var = 1
var -= 1
end

# ╔═╡ 4293c2a4-cbd5-4b22-8b4a-280bbdacd1c8
let
var = 1
var *= 2
end

# ╔═╡ 1c238add-1c4f-4236-9943-6b9e7f45d8ab
let
var = 1
var /= 2
end

# ╔═╡ 6aa9bc63-bbf2-4b6e-9690-13ff4344c460
md"""
## Comparison operators

Some operators can be used to compare two values. They always return a boolean value: either `true` or `false`.

Greater than:
"""

# ╔═╡ 81ef192e-8e24-4865-8d79-06568e33390e
2 > 1 

# ╔═╡ 2ee4020f-debb-4d0d-b25c-889f0f821d02
md"""
Greater or equal to:
"""

# ╔═╡ 6703e50a-18f1-4286-a5a7-2e18a28dc9ac
2 >= 1 

# ╔═╡ 682bc70c-8ab9-40da-a231-df3f998d3562
md"""
The opposite:
"""

# ╔═╡ c7b5b7b7-3766-4a20-b847-f6ce2a077ace
2 < 1 

# ╔═╡ 9e48d85f-61a8-4e93-9cc7-079f33359f0c
2 <= 1 

# ╔═╡ daf09d9e-556d-4e2c-9e35-d78b0f61cd26
md"""
Testing equality:
"""

# ╔═╡ cce83b75-2ce6-489d-b7f6-05853fd6d056
2 == 1

# ╔═╡ 5f68213a-6d1d-4b3a-a7b3-c0abfbaa305b
md"""
!!! note
	Note that equality is done using `==`, which is not the same than `=`, used to assign a value to a variable.
"""

# ╔═╡ 9e9b02b8-f47d-494f-9332-7701903e6810
md"""
To test inequality, we use `!=`:
"""

# ╔═╡ 37d52bfb-6965-4ecd-804f-98d9f7c1b01b
2 != 1

# ╔═╡ bc6ad01a-f7ec-4538-8115-73ba67406943
md"""
## Boolean operators

There are also the logical tests using `!` ("not"), `&&` ("and") and `||` ("or") on boolean values (`true` or `false`).

### Negation

The `!` operator negates the boolean value of the statement:
"""

# ╔═╡ 83f6f3fd-ab7e-4ebb-8285-b49188a1f50b
!false

# ╔═╡ dcbbe212-23aa-4ff9-9fda-f1f0d67b3f95
!true

# ╔═╡ 8bbe84a0-93de-4bb9-8995-caed6bc920c7
md"""
So this:
"""

# ╔═╡ f0752ae9-5401-49fc-8ddc-d07302499185
2 > 1

# ╔═╡ b88e0721-cf58-4f85-b54a-4514982e2218
md"""
Is equivalent to this:
"""

# ╔═╡ 0a8e65d5-7043-4f66-8987-c2e56e09d223
!(2 <= 1)

# ╔═╡ 729ae192-df5b-47a3-a245-9d40e8014f5a
md"""

### Logical "and"

The logical "and" (`&&`) returns `true` only if the right-hand side and left-hand side values of the operator are both `true`:
"""

# ╔═╡ f032b44b-16b0-4383-8076-97d110249fb5
true && true

# ╔═╡ 4d44dd47-ff82-417a-b248-cacdac6d91d4
true && false

# ╔═╡ 0de3bcfb-f4e0-43cc-b407-ececfbb1d8bf
md"""
### Logical "or"
"""

# ╔═╡ c2b86ba3-d54e-4191-9efb-a70e0f706516
md"""
The logical "or" returns true if at least one is true:
"""

# ╔═╡ 8e7cce54-9217-4ad0-978e-67fa21cb6fd5
true || false

# ╔═╡ 4f5d628f-de89-43a0-9a50-d79d39d8fd44
false || false

# ╔═╡ f91b3d97-a611-4a5e-8cf6-3e45eb052ff1
md"""
In reality you'll use variables instead of boolean values directly. For example you could say that `c` is equal to `true` in the case both `a` and `b` are bellow 3:
"""

# ╔═╡ ff6e339d-89ba-4df9-b674-4602dd4549a9
c = a < 3 && b < 3

# ╔═╡ 2f44b8ec-3414-4903-b5a2-ea7c819b3b86
md"""
### Conditional execution
"""

# ╔═╡ a0cf3510-a2f1-4b8d-9e95-54b49f37d926
md"""
The nice thing with Julia is that it tests the conditions incrementally because we know that if the first condition is `false` in a `&&` statement, the whole statement will be false, and if the first condition is `true` in a `||` statement, the whole statement will be `true`. We can use that as a tool to conditionally execute a line of code.
"""

# ╔═╡ 98fa4586-e163-40a5-9084-c9a1cb4c350b
a == 1 && "a is equal to 1!"

# ╔═╡ 8dc5efc6-6c25-45d7-a944-6f229eef9b49
b == 1 && "b is equal to 1!"

# ╔═╡ 986244f3-b4eb-4d16-ab5f-7585a44d3784
b == 1 || "b is not equal to 1!"

# ╔═╡ 102364c0-98a9-411b-94c7-cd129c99f04a
md"""
The concept of conditional execution is very important, and we will see it in more details in a coming video.
"""

# ╔═╡ 0da85da4-18eb-431e-972a-426e73f16781
md"""
## Vectorizing operators

All operators we just saw are applied to one value at a time. But very often we want to apply an operator over a sequence of values stored in an Array for example. 

To do so, we can use the vectorized version of the operators by adding a dot right before it. This is called broadcasting. We will see more details about that in another video.
"""

# ╔═╡ 5356fedc-2524-4b32-8559-a0ba5ae2f5cf
a_vec = [1, 2, 3]

# ╔═╡ 7e0b0477-e72d-4bf5-a059-63993cf0035b
md"""
For example adding a single value to a vector of values using the `+` sign will return an error:
"""

# ╔═╡ 0d905737-2738-4564-9273-139a84aa100d
a_vec + 2

# ╔═╡ 13b1edec-9ae6-4a0b-b8ed-2f63df2e6792
md"""
THe error is a `MethodError`, because there is no method implemented for the `+` function with a vector of integer and an integer.

Using the vectorized version will work perfectly:
"""

# ╔═╡ 02a4c901-8c29-42ec-8864-fe5d4c70f46b
a_vec .+ 2

# ╔═╡ 6515d475-294a-40c4-9ac7-8e3ef15e8f89
md"""
!!! note
	In practice, the vectorized version applies the `+` function sequentially over the values of the `a_vec` array, and then return the results back as an array.
"""

# ╔═╡ e087cd30-f78f-40a4-95f5-87bfcf05fbe7
md"""
There are other ways to do so, such as the for loops or array comprehension, but we will see that in another video.
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
# ╟─c819a820-13d1-11ec-174e-31eef4e20fc4
# ╠═63b315e1-6bab-48d2-9992-6e6598bdf5fb
# ╠═e874c232-256c-4d9f-a214-e526192be0cd
# ╠═4c362d08-3b79-44e3-8b48-0f9231526dca
# ╠═f9ec2db0-d20a-4aac-ad24-66df4c7e6bde
# ╟─2222f963-31d7-460c-940f-4b544b3bc8a2
# ╠═36732368-836f-46bb-9a75-b75b10890505
# ╠═9cb19c7e-9218-4f37-be67-c1e5d7b5a883
# ╟─e43721b6-d642-4b6e-88ff-2bc48635effa
# ╠═cc9cff27-b864-475b-b162-0503dc308432
# ╟─98f549a9-1757-4e7c-bfac-0bf0d951b10d
# ╠═0272780b-6ace-499a-bf2b-441b9a148de4
# ╟─9f59bff0-bc85-4f36-b92c-d84e25cbdd9e
# ╠═7ed2ed34-f811-40c5-b6d2-17b7263f934c
# ╠═00b8743b-8597-4fea-82d9-c191bfe73050
# ╠═72ffc8b6-8543-42d2-b0bf-1640ccfcdea7
# ╟─1df480ee-375f-421f-bfe6-cac883d290e3
# ╠═278e7cb7-f760-4df2-8bdf-c87f1b8f5bec
# ╟─74bb4a3d-1d27-4555-8a47-98472ead2c9a
# ╠═ebc07294-3d9b-4973-b2b6-1afb535dc1ae
# ╠═73ced44d-503a-46a7-b1df-4db81e21375c
# ╠═4293c2a4-cbd5-4b22-8b4a-280bbdacd1c8
# ╠═1c238add-1c4f-4236-9943-6b9e7f45d8ab
# ╟─6aa9bc63-bbf2-4b6e-9690-13ff4344c460
# ╠═81ef192e-8e24-4865-8d79-06568e33390e
# ╟─2ee4020f-debb-4d0d-b25c-889f0f821d02
# ╠═6703e50a-18f1-4286-a5a7-2e18a28dc9ac
# ╟─682bc70c-8ab9-40da-a231-df3f998d3562
# ╠═c7b5b7b7-3766-4a20-b847-f6ce2a077ace
# ╠═9e48d85f-61a8-4e93-9cc7-079f33359f0c
# ╟─daf09d9e-556d-4e2c-9e35-d78b0f61cd26
# ╠═cce83b75-2ce6-489d-b7f6-05853fd6d056
# ╟─5f68213a-6d1d-4b3a-a7b3-c0abfbaa305b
# ╟─9e9b02b8-f47d-494f-9332-7701903e6810
# ╠═37d52bfb-6965-4ecd-804f-98d9f7c1b01b
# ╟─bc6ad01a-f7ec-4538-8115-73ba67406943
# ╠═83f6f3fd-ab7e-4ebb-8285-b49188a1f50b
# ╠═dcbbe212-23aa-4ff9-9fda-f1f0d67b3f95
# ╟─8bbe84a0-93de-4bb9-8995-caed6bc920c7
# ╠═f0752ae9-5401-49fc-8ddc-d07302499185
# ╟─b88e0721-cf58-4f85-b54a-4514982e2218
# ╠═0a8e65d5-7043-4f66-8987-c2e56e09d223
# ╟─729ae192-df5b-47a3-a245-9d40e8014f5a
# ╠═f032b44b-16b0-4383-8076-97d110249fb5
# ╠═4d44dd47-ff82-417a-b248-cacdac6d91d4
# ╟─0de3bcfb-f4e0-43cc-b407-ececfbb1d8bf
# ╟─c2b86ba3-d54e-4191-9efb-a70e0f706516
# ╠═8e7cce54-9217-4ad0-978e-67fa21cb6fd5
# ╠═4f5d628f-de89-43a0-9a50-d79d39d8fd44
# ╟─f91b3d97-a611-4a5e-8cf6-3e45eb052ff1
# ╠═ff6e339d-89ba-4df9-b674-4602dd4549a9
# ╟─2f44b8ec-3414-4903-b5a2-ea7c819b3b86
# ╟─a0cf3510-a2f1-4b8d-9e95-54b49f37d926
# ╠═98fa4586-e163-40a5-9084-c9a1cb4c350b
# ╠═8dc5efc6-6c25-45d7-a944-6f229eef9b49
# ╠═986244f3-b4eb-4d16-ab5f-7585a44d3784
# ╟─102364c0-98a9-411b-94c7-cd129c99f04a
# ╟─0da85da4-18eb-431e-972a-426e73f16781
# ╠═5356fedc-2524-4b32-8559-a0ba5ae2f5cf
# ╟─7e0b0477-e72d-4bf5-a059-63993cf0035b
# ╠═0d905737-2738-4564-9273-139a84aa100d
# ╟─13b1edec-9ae6-4a0b-b8ed-2f63df2e6792
# ╠═02a4c901-8c29-42ec-8864-fe5d4c70f46b
# ╟─6515d475-294a-40c4-9ac7-8e3ef15e8f89
# ╟─e087cd30-f78f-40a4-95f5-87bfcf05fbe7
# ╟─a8c574f0-b3e0-475a-8d49-422c0f47e1fe
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
