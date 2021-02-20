### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ e5b53410-63cf-11eb-2532-358a68b59eb9
md"# Variables and basic types in Julia"

# ╔═╡ 16f1e0f0-63d0-11eb-2ee4-8f8be24866e8
md"## Variables"

# ╔═╡ 31972af0-63d0-11eb-3e22-bb3370a9e40d
md"""A variable is simply a name associated to any type of value. 

To declare a new variable, we use `=`, also named assignment operator:"""

# ╔═╡ 9d83cca0-63d0-11eb-0346-751060e8cab5
a = 1

# ╔═╡ a4804830-63d0-11eb-01f7-bbaa888fac09
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
md"α is written by typing `\alpha` and then `ctrl+tab`.
`ctrl+tab` is used for autocompletion. We can even use emojis: 
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
md"Some types cannot be converted into another without loss of information. For example what if you convert a double like `2.2` into an integer? "

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

# ╔═╡ Cell order:
# ╟─e5b53410-63cf-11eb-2532-358a68b59eb9
# ╟─16f1e0f0-63d0-11eb-2ee4-8f8be24866e8
# ╟─31972af0-63d0-11eb-3e22-bb3370a9e40d
# ╟─9d83cca0-63d0-11eb-0346-751060e8cab5
# ╠═a4804830-63d0-11eb-01f7-bbaa888fac09
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
# ╟─3d9d6b0e-63d6-11eb-2cc1-39a76f290513
# ╟─0d5dc660-63d7-11eb-0458-29b554125fce
# ╟─53e9e240-63d6-11eb-00dc-098c64e573f1
# ╠═61ffb030-63d6-11eb-059d-e912b2c828fb
# ╟─1204e040-63d7-11eb-2c61-e3f212329a44
# ╟─72e5b520-63d6-11eb-0463-3bd1d3643d15
# ╠═7b9537e0-63d6-11eb-1d93-d3e253614910
# ╟─19752c40-63d7-11eb-0500-11c3318c9319
# ╟─48cab050-63dc-11eb-2f06-651fa9acbd54
# ╠═69283610-63dc-11eb-1d97-25d73d0ce439
# ╟─27efd680-63d7-11eb-0701-67d7c4fc2847
# ╟─5c08ef5e-63d7-11eb-34d0-dfa5f605cc6c
# ╟─6cf7f500-63d7-11eb-285a-4db31a47e386
# ╟─91be39d0-63dc-11eb-3275-f17059662b87
# ╟─934d5790-63d7-11eb-3ff1-49bc42858003
# ╟─c4fdd4e0-63d7-11eb-338c-997af2ea699f
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
