### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 29c0f862-bbec-4ca6-938a-852fb5f9d802
using BenchmarkTools

# ╔═╡ 44907d2e-961d-11eb-10df-0941e04d14cb
md"""
# Tuples
"""

# ╔═╡ 554b0cbc-0369-41a2-ab8c-318df9f055de
md"""
A Tuple is, like an Array, an ordered set of elements. But there are a few differences between them: tuples are immutable, and they track the type of **each** element they hold. And this is exactly what makes tuples better for performance! 

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

# ╔═╡ a08d941f-c6c5-4705-b88c-c8f476cc9c64
md"""
## Benchmarking
"""

# ╔═╡ 54902a8d-d3a4-45c0-93f8-cde0015b8c0e
md"""
Let's benchmark the sum of an array from 1 to 1.000.000 either as an array or as a tuple:
"""

# ╔═╡ 4ef6e11c-3c07-4397-be31-4205f7dd543d
array_struct = collect(1:1000000)

# ╔═╡ ea754882-1f29-44dc-ad54-a1b790cc7feb
tuple_struct = (array_struct...)

# ╔═╡ 811722d3-061a-493d-b2d6-d1ea97d0f2a8
@benchmark sum(array_struct) # Array

# ╔═╡ 20171623-450b-4bee-ba07-14964e654d70
@benchmark sum(tuple_struct) # Tuple

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

# ╔═╡ Cell order:
# ╟─44907d2e-961d-11eb-10df-0941e04d14cb
# ╠═29c0f862-bbec-4ca6-938a-852fb5f9d802
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
# ╟─a08d941f-c6c5-4705-b88c-c8f476cc9c64
# ╟─54902a8d-d3a4-45c0-93f8-cde0015b8c0e
# ╠═4ef6e11c-3c07-4397-be31-4205f7dd543d
# ╠═ea754882-1f29-44dc-ad54-a1b790cc7feb
# ╠═811722d3-061a-493d-b2d6-d1ea97d0f2a8
# ╠═20171623-450b-4bee-ba07-14964e654d70
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