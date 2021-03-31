### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ bb7a1f18-84c1-4c0a-807d-dc5575a7dd0c
begin 
	using PlutoUI
	PlutoUI.TableOfContents()
end

# ╔═╡ c879bad0-7944-11eb-3cc5-6d068e87585a
md"# Arrays"

# ╔═╡ 0a8c911e-9dd2-4f7e-868b-1cd845135c53
md"## Definition"

# ╔═╡ 34558e07-9821-49a5-957b-7ef713fa9a6b
md"An array is an ordered collection of elements. The [Wikipedia webpage](https://en.wikipedia.org/wiki/Array_data_type) tells us that it relates to the mathematical concepts of vectors (1d array), matrices (2d arrays) and tensors (multi-dimensional arrays)."

# ╔═╡ cda72a9e-6ec1-4746-a6f8-e0926b5a50d9
md"## Creating an array"

# ╔═╡ daf15091-45a3-4419-beb3-643d324a1f70
md"### Empty array"

# ╔═╡ 92370118-f98d-453b-99d2-0bf053204278
md"We can create an empty array using the following commands:"

# ╔═╡ 45fcb20b-e604-458c-80d2-d96324d8a63b
a = []

# ╔═╡ 8933fc3c-ccfe-4fa8-98af-270fc8e15280
md"`a` is an empty array, and it is of type `Any` which means it can store any type of values. This is the most general declaration of an array here, because we don't assume the type of the elements that will be stored in the array. It is very practical, but adds some limitations in terms of performance."

# ╔═╡ d3e2cdd5-2dd8-45e2-8f3d-f15d39c18d1b
md"The prefered way when we now the type of the elements we will store is to declare it as follows:"

# ╔═╡ 49090226-6636-4464-b496-1e0b83e5655f
a2 = Array{Float64,1}()

# ╔═╡ 792b67f0-f1f1-4b4a-a720-aecffab167c6
md"Now if we ask Julia what is the type of `a2`:"

# ╔═╡ 7a150c77-11b6-4525-836f-1e371ba91e70
typeof(a2)

# ╔═╡ 94ad54e0-b6a0-4872-94e4-532cfd237acf
md"It returns: $(typeof(a2)). We can also use directly `eltype()` to get the type of the elements in an `Array`:"

# ╔═╡ 9b364eae-7060-4034-9924-1490fd88d275
eltype(a2)

# ╔═╡ 70cb6051-c849-4d14-84b6-3d7b48b42ebc
md"There is also a short hand to `Array{Float64,1}()`:"

# ╔═╡ 6743a46c-4f24-4eca-b4a3-18de4dc9618a
a_float = Float64[]

# ╔═╡ 34f5b3dc-0331-4e32-aaf2-7807fb1855e9
md"And it works with other types, *e.g.*:"

# ╔═╡ 72fd91e2-e83d-4173-8c29-c3f7e3ca7fb2
a3 = Int64[]

# ╔═╡ 189853b7-212b-41ec-95ba-be4993b842ac
eltype(a3)

# ╔═╡ f881789b-9cae-4de3-86e3-624f732aed82
md"### With values"

# ╔═╡ 7e554061-1ed9-4cdc-aa02-f6d7565106b7
md"We can directly instantiate an `Array` by providing values:"

# ╔═╡ 7f9e7e08-6021-4406-a09c-419f4c64b30d
[1, 2]

# ╔═╡ d13f18d8-fa64-4d80-97c7-dd392358f579
md"Or using the function directly:"

# ╔═╡ 78959d1d-b522-4567-8353-73fac5e9d120
Int64[1.0,2.0]

# ╔═╡ c45e1610-c944-40e5-b7c6-c48c8bd1c626
md"Julia tries to promote the values by default to specialise the `Array`, meaning making an `Array` of one specific type:"

# ╔═╡ 0fde7f3d-cde2-4381-89b7-4234d76f3855
[1.0, 1]

# ╔═╡ 9b5093ba-e389-4a7b-a152-40311dcea1e6
md"Here Julia promoted the `Float64` and `Int64` given as inputs into `Float64`. But if it can't, it will make an `Array` with element type `Any`:"

# ╔═╡ 48f5b4e6-83ad-4886-ac57-7aba4e42c7ca
[1.0, 1, "1"]

# ╔═╡ c95603b0-3ddd-4f9a-b59d-12af2b2f492b
md"There is a short-hand to make `Arrays` filled with zeros or ones of a certain type:"

# ╔═╡ 7e2fc580-8ea9-4409-b3e2-2e94a550a81a
zeros(Int64,5)

# ╔═╡ 088555de-40a0-4e84-8c64-8b4c8121dcca
zeros(Float64,5)

# ╔═╡ 2b9c0567-3cf7-47e8-a595-ab4f2f0fcb18
md"Or using any sequence:"

# ╔═╡ 57d80a18-57cb-424c-afca-dba5924bb8f2
collect(1:10)

# ╔═╡ 5e4a882d-608d-47d4-b594-1b33857646ac
md"### Multiple dimensions"

# ╔═╡ 2337fdaf-40d9-4d21-bb19-ac98defef41a
md"""We only made one-dimensional arrays -also called Vectors- until here, but we can make arrays of any dimensions. Let's make an Array of increased dimension:

- one dimension (*i.e.* Vector)
"""

# ╔═╡ 5009bbdb-79fe-49f0-b642-0a866e202136
zeros(Int64, 5)

# ╔═╡ ad0e06ce-7670-4205-94c3-81aa576fa30f
md"- two dimensions (*i.e.* Matrix)"

# ╔═╡ f3aaca99-af7b-468d-b2eb-571a2c664903
zeros(Int64,5,2)

# ╔═╡ fecb5933-8410-4622-98ea-862c8fb8ab59
md"""Note that a matrix can be declared using `[` too using a space to make a new column, and a new line (or `;`) for a new row:

- using a new line:
"""

# ╔═╡ d9f43a57-e061-4f4a-9bd3-c4dcdac4fb25
[1 2 
 3 4
 5 6]

# ╔═╡ d3cc12a3-8251-444c-93e9-c5c09527d034
md"- using `;`:"

# ╔═╡ a152378c-db20-45f2-af28-6546b577d9fe
[1 2; 3 4; 5 6]

# ╔═╡ 0abc7154-9a2c-4547-9ebd-02f80d2b8ecf
md"- three dimensions (*i.e.* Tensor)"

# ╔═╡ 6ebef395-d692-448f-ae12-491c385f8dd2
zeros(Int64,5,2,2)

# ╔═╡ a04c4b0c-365c-4032-8884-bd2b2df040bf
md"etc..."

# ╔═╡ 5778335e-0b31-423c-9ca1-8a8b9add3680
md"## Working with arrays"

# ╔═╡ 50fedd78-95c0-4c24-86e0-d6fe7ab99a65
md"Let's make a vector and a matrix first:"

# ╔═╡ 1baf26a7-8af0-4473-86d9-497ab2546051
vec = [1,3,5,7]

# ╔═╡ 2b4dbfbb-173d-43fb-8e3f-0827536814e3
mat = [1 2
	   3 4
	   5 6
	   7 9]

# ╔═╡ 8b7fa713-9b89-46dc-b4fa-da2e348fd18e
md"### Indexing"

# ╔═╡ 8f74faf5-829e-4c08-8463-5695e574af82
md"""Indexing is made using `[`. For example we would type `vec[index]` to get the value in `vec` stored at `index`:"""

# ╔═╡ 75a44b16-5279-4d08-ba6a-dce7ea21db15
vec[2]

# ╔═╡ 8fef9d3e-b549-4a80-8314-d0a19cf6f1c1
md"Similarly, `mat[index_1, index_2]` will return the value in `mat` stored at `index_1` in the first dimension (the rows) and `index_2` in the second dimension (the columns):"

# ╔═╡ ce4bafc7-4ce2-4349-a0ec-d350ef4853f2
mat[3,2]

# ╔═╡ ae116904-1ced-43bc-a007-997123a32ffd
md"""There are some usefull keywords to index. For example use `:` to get all values in a dimension.

- All rows and first column only: 
"""

# ╔═╡ 5d3771f0-0b75-4ea2-8fd5-1047e1a35779
mat[:,1]

# ╔═╡ d642b188-9e7c-493f-a9e4-711cf03227e8
md"- All columns and first row only:"

# ╔═╡ a95aaf6c-ff91-4c3c-a83a-d71afdb94878
mat[1,:]

# ╔═╡ 91e738e6-9238-4a48-ae58-0bea688e6c90
md"or to get a range of values:"

# ╔═╡ 5e2387f1-5dd7-4b49-91e4-96d057ed31fa
mat[1:3,:]

# ╔═╡ 60efc230-9ada-4de9-896a-c5d37d7fa9e0
md"or `end` to get the last value:"

# ╔═╡ 4d38a50e-57ff-461d-8af9-9f1f188521e4
mat[1,end]

# ╔═╡ b4a2e4b8-f16f-4fbd-baba-687f7468ca7f
md"We can also index using booleans:"

# ╔═╡ a939313b-1c86-492d-9993-545066bd8cd4
values_we_want = [false,true,false,false]

# ╔═╡ fca126bf-b5d6-47b5-bbe9-994f7acad0fe
vec[values_we_want]

# ╔═╡ 862f073e-8006-4671-a8e0-a6cf2024ae68
md"This is a very convenient feature because it allows us to index with more complex approaches, *e.g.*:"

# ╔═╡ f630778e-1887-4fe3-9f35-c4e286e45cba
vec[vec .> 3]

# ╔═╡ c58f05ad-dd0b-482f-9891-514b960b8bb4
md"We will see those kind of operations in a different notebook."

# ╔═╡ 67208966-c604-4889-b06e-f385647990d1
md"### Add or remove elements"

# ╔═╡ c764ac39-8d2a-4fa1-b3f3-96a24ba5527d
md"#### At the end of the array:"

# ╔═╡ 9fc4cb37-69fd-446c-95fe-30abb7559601
md"We can add elements to the end of an array using `push!`:"

# ╔═╡ 47e8bdbc-ad36-447c-8f79-f78626814be1
begin
	vectmp1 = copy(vec)
	push!(vectmp1,10)
	vectmp1
end

# ╔═╡ b0d77b3e-9674-449a-be5f-a5790a4d4089
md"""

!!! note

	We would simply use `push!(vec,10)` outside of a Pluto notebook (*e.g.* in a Julia script). But Pluto doesn't like when we mutate a variable (meaning changing its value) at several different places in the notebook. So we apply a trick here, were we put the code in a `begin ... end` statement to make it a single statement, and apply `push!` on a copy of the vector (here `vectmp1`). If it is too complicated, no worries, just consider this big blob of code just as if it was only written `push!(vec,10)`. 
"""

# ╔═╡ d94f73bb-0e3f-42ea-8e8f-7e3e982836fa
md"And remove the last element using `pop!`:"

# ╔═╡ 23a8f2fa-9153-4eec-a876-db97a999b943
begin
	vectmp2 = copy(vec)
	pop!(vectmp2)
	vectmp2
end

# ╔═╡ f530fe3b-1b0d-472a-b330-d12a46e68c22
md"""
!!! note
	Note the `!` at the end of the name of the functions. Functions ending with a `!` in Julia mutate their first argument, meaning they modify it "in-place". Those functions generally have their non-mutating counterpart without the `!` that computes the result and return it, but don't modify the object given as the first argument. But we'll get into that in a further notebook.
"""

# ╔═╡ 8fbfb20a-5f5e-422e-9b59-90513050b3b8
md"#### At the beginning of the array:"

# ╔═╡ 60608c63-2b59-474e-92a2-3800e6254792
md"We can add or remove elements at the beginning of the array using `pushfirst!` and `popfirst!`:"

# ╔═╡ f153b213-1d4a-4481-ba83-29b1f8131963
begin
	vectmp3 = copy(vec)
	pushfirst!(vectmp3,0)
end

# ╔═╡ a99f7d96-654a-46b0-91a2-9120ab30af44
begin
	vectmp4 = copy(vec)
	popfirst!(vectmp4)
	vectmp4
end

# ╔═╡ 1cb1ec65-48d9-47f1-8a3d-f3767fa03ad2
md"""
!!! note

We are still applying the `begin .. end` trick here because we're inside of a Pluto notebook (and it's the case of many following functions that only exist in a mutating form). Just use `pushfirst!(vec,0)` and `popfirst!(vec)` outside of Pluto.
"""

# ╔═╡ 33c34e8f-c5b6-43a8-a329-12fc55949a2e
md"#### Anywhere in the array:"

# ╔═╡ fad8c97c-7cd6-4c30-bc44-4242653c0e96
md"We can add or remove elements anywhere in the array using `insert!` and `deleteat!`:"

# ╔═╡ 56d63b69-e6bf-4140-8494-9ad36af2382c
begin
	vectmp5 = copy(vec)
	insert!(vectmp5,2,15)
end

# ╔═╡ 4d7f948d-666d-4038-9a68-fe2a8ab09b82
begin
	vectmp6 = copy(vec)
	deleteat!(vectmp6,2)
end

# ╔═╡ 7d06e1cb-ebe9-42cb-a717-f5ee01f3492a
md"### Concatenate"

# ╔═╡ 2cb2f5ad-10e4-4369-ae9e-3ab09665de68
md"We can concatenate several one-dimensional arrays together using `append!` (at the end) and `prepend!` (at the beginning):"

# ╔═╡ 3337c025-6bf9-4fae-b8f9-7fb0bb004451
vec2 = [30,31,32]

# ╔═╡ 4fbc1851-7d17-4907-95c8-cb7862c4e73a
begin
	vectmp7 = copy(vec)
	append!(vectmp7,vec2)
end

# ╔═╡ aab84642-b9fa-48f3-bb97-76d0d8b01d79
begin
	vectmp8 = copy(vec)
	prepend!(vectmp8,vec2)
end

# ╔═╡ 0e38f381-b0b4-4137-86c1-118077f3bf89
md"And you can still use `deleteat!`, but now using a range:"

# ╔═╡ dcb40e07-31cf-449c-b37a-f6ebb89fb65a
begin
	vectmp9 = copy(vec)
	deleteat!(vectmp9,1:3)
end

# ╔═╡ 8d8e2770-ffb7-4c4b-a624-786edac752e4
md"For more complex arrays we can use `hcat` and `vcat` (and it works with vectors too):"

# ╔═╡ 6a8e56f1-f797-45d3-896e-64d5c39f6023
hcat(vec,vec)

# ╔═╡ 7dcbf14a-04a4-4693-9918-b4164853cfaf
hcat(mat,[10,11,12,13])

# ╔═╡ a3883207-0020-4959-9b70-049998963bf0
vcat(mat,[10 11])

# ╔═╡ 4e1cacbc-2824-4823-a9a2-f1736129bf2f
md"We can also simply use `[` to make a new array:"

# ╔═╡ eec05d6a-ae8c-49c0-88e3-2fa19a458dfc
[mat; [10 11]]

# ╔═╡ c886a9f1-ece9-4e30-a42e-819de1e60794
[mat [10,11,12,13]]

# ╔═╡ 8a7c9b3f-e4e8-49d3-ae2f-da6d116963d7
md"### Reshape"

# ╔═╡ 62635c8c-8f21-42a9-9522-3440872aed4d
md"We can change the dimensions of an Array, or reshaping it using `reshape`. For example we can reshape vec to a 2x2 matrix:"

# ╔═╡ ff69b3ec-2c54-48ce-98d7-14fbf197982c
reshape(vec,2,2)

# ╔═╡ 17d44621-6264-466d-9459-a5cda803a7c3
md"""
Or reshape `mat` into a vector:
"""

# ╔═╡ 2c596432-756b-4670-b0b4-79d45664685f
reshape(mat,8)

# ╔═╡ aa7cc737-788c-499c-acc0-a0be06d03e10
md"""
If we are not sure about the size of our matrix, we can also use `:`: 
"""

# ╔═╡ aa55dbcf-1491-4183-967a-959f72870fd0
reshape(mat,:)

# ╔═╡ 6aafc7b2-f28b-42a7-b181-d7385ba1359b
md"## Further information"

# ╔═╡ 959ea351-1b13-49ef-9c96-0fe1d4c7b886
md"""
There are some basic functions such as `length` or `size` to get the length of an array, and the size for each dimension:
"""

# ╔═╡ 414af929-a7d3-45b6-ac05-3fe05870bae9
length(mat)

# ╔═╡ e48e5fb2-5cbd-4413-b384-289599a588c1
size(mat)

# ╔═╡ f01961ff-e8ae-4219-9bc4-669c18f12f9c
md"""
We will see in another notebook that arrays are very powerfull, and that we can make more complex operations such as finding a value in an array using a function, sorting, or doing mathematical operations.

If you want more information, you can visit the [official documentation here](https://docs.julialang.org/en/v1/manual/arrays/)
"""

# ╔═╡ Cell order:
# ╟─bb7a1f18-84c1-4c0a-807d-dc5575a7dd0c
# ╟─c879bad0-7944-11eb-3cc5-6d068e87585a
# ╟─0a8c911e-9dd2-4f7e-868b-1cd845135c53
# ╟─34558e07-9821-49a5-957b-7ef713fa9a6b
# ╟─cda72a9e-6ec1-4746-a6f8-e0926b5a50d9
# ╟─daf15091-45a3-4419-beb3-643d324a1f70
# ╟─92370118-f98d-453b-99d2-0bf053204278
# ╠═45fcb20b-e604-458c-80d2-d96324d8a63b
# ╟─8933fc3c-ccfe-4fa8-98af-270fc8e15280
# ╟─d3e2cdd5-2dd8-45e2-8f3d-f15d39c18d1b
# ╠═49090226-6636-4464-b496-1e0b83e5655f
# ╟─792b67f0-f1f1-4b4a-a720-aecffab167c6
# ╠═7a150c77-11b6-4525-836f-1e371ba91e70
# ╟─94ad54e0-b6a0-4872-94e4-532cfd237acf
# ╠═9b364eae-7060-4034-9924-1490fd88d275
# ╟─70cb6051-c849-4d14-84b6-3d7b48b42ebc
# ╠═6743a46c-4f24-4eca-b4a3-18de4dc9618a
# ╟─34f5b3dc-0331-4e32-aaf2-7807fb1855e9
# ╠═72fd91e2-e83d-4173-8c29-c3f7e3ca7fb2
# ╠═189853b7-212b-41ec-95ba-be4993b842ac
# ╟─f881789b-9cae-4de3-86e3-624f732aed82
# ╟─7e554061-1ed9-4cdc-aa02-f6d7565106b7
# ╠═7f9e7e08-6021-4406-a09c-419f4c64b30d
# ╟─d13f18d8-fa64-4d80-97c7-dd392358f579
# ╠═78959d1d-b522-4567-8353-73fac5e9d120
# ╟─c45e1610-c944-40e5-b7c6-c48c8bd1c626
# ╠═0fde7f3d-cde2-4381-89b7-4234d76f3855
# ╟─9b5093ba-e389-4a7b-a152-40311dcea1e6
# ╠═48f5b4e6-83ad-4886-ac57-7aba4e42c7ca
# ╟─c95603b0-3ddd-4f9a-b59d-12af2b2f492b
# ╠═7e2fc580-8ea9-4409-b3e2-2e94a550a81a
# ╠═088555de-40a0-4e84-8c64-8b4c8121dcca
# ╟─2b9c0567-3cf7-47e8-a595-ab4f2f0fcb18
# ╠═57d80a18-57cb-424c-afca-dba5924bb8f2
# ╟─5e4a882d-608d-47d4-b594-1b33857646ac
# ╟─2337fdaf-40d9-4d21-bb19-ac98defef41a
# ╠═5009bbdb-79fe-49f0-b642-0a866e202136
# ╟─ad0e06ce-7670-4205-94c3-81aa576fa30f
# ╠═f3aaca99-af7b-468d-b2eb-571a2c664903
# ╟─fecb5933-8410-4622-98ea-862c8fb8ab59
# ╠═d9f43a57-e061-4f4a-9bd3-c4dcdac4fb25
# ╟─d3cc12a3-8251-444c-93e9-c5c09527d034
# ╠═a152378c-db20-45f2-af28-6546b577d9fe
# ╟─0abc7154-9a2c-4547-9ebd-02f80d2b8ecf
# ╠═6ebef395-d692-448f-ae12-491c385f8dd2
# ╟─a04c4b0c-365c-4032-8884-bd2b2df040bf
# ╟─5778335e-0b31-423c-9ca1-8a8b9add3680
# ╟─50fedd78-95c0-4c24-86e0-d6fe7ab99a65
# ╠═1baf26a7-8af0-4473-86d9-497ab2546051
# ╠═2b4dbfbb-173d-43fb-8e3f-0827536814e3
# ╟─8b7fa713-9b89-46dc-b4fa-da2e348fd18e
# ╟─8f74faf5-829e-4c08-8463-5695e574af82
# ╠═75a44b16-5279-4d08-ba6a-dce7ea21db15
# ╟─8fef9d3e-b549-4a80-8314-d0a19cf6f1c1
# ╠═ce4bafc7-4ce2-4349-a0ec-d350ef4853f2
# ╟─ae116904-1ced-43bc-a007-997123a32ffd
# ╠═5d3771f0-0b75-4ea2-8fd5-1047e1a35779
# ╟─d642b188-9e7c-493f-a9e4-711cf03227e8
# ╠═a95aaf6c-ff91-4c3c-a83a-d71afdb94878
# ╟─91e738e6-9238-4a48-ae58-0bea688e6c90
# ╠═5e2387f1-5dd7-4b49-91e4-96d057ed31fa
# ╟─60efc230-9ada-4de9-896a-c5d37d7fa9e0
# ╠═4d38a50e-57ff-461d-8af9-9f1f188521e4
# ╟─b4a2e4b8-f16f-4fbd-baba-687f7468ca7f
# ╠═a939313b-1c86-492d-9993-545066bd8cd4
# ╠═fca126bf-b5d6-47b5-bbe9-994f7acad0fe
# ╟─862f073e-8006-4671-a8e0-a6cf2024ae68
# ╠═f630778e-1887-4fe3-9f35-c4e286e45cba
# ╟─c58f05ad-dd0b-482f-9891-514b960b8bb4
# ╟─67208966-c604-4889-b06e-f385647990d1
# ╟─c764ac39-8d2a-4fa1-b3f3-96a24ba5527d
# ╟─9fc4cb37-69fd-446c-95fe-30abb7559601
# ╠═47e8bdbc-ad36-447c-8f79-f78626814be1
# ╟─b0d77b3e-9674-449a-be5f-a5790a4d4089
# ╟─d94f73bb-0e3f-42ea-8e8f-7e3e982836fa
# ╠═23a8f2fa-9153-4eec-a876-db97a999b943
# ╟─f530fe3b-1b0d-472a-b330-d12a46e68c22
# ╟─8fbfb20a-5f5e-422e-9b59-90513050b3b8
# ╟─60608c63-2b59-474e-92a2-3800e6254792
# ╠═f153b213-1d4a-4481-ba83-29b1f8131963
# ╠═a99f7d96-654a-46b0-91a2-9120ab30af44
# ╟─1cb1ec65-48d9-47f1-8a3d-f3767fa03ad2
# ╟─33c34e8f-c5b6-43a8-a329-12fc55949a2e
# ╟─fad8c97c-7cd6-4c30-bc44-4242653c0e96
# ╠═56d63b69-e6bf-4140-8494-9ad36af2382c
# ╠═4d7f948d-666d-4038-9a68-fe2a8ab09b82
# ╟─7d06e1cb-ebe9-42cb-a717-f5ee01f3492a
# ╟─2cb2f5ad-10e4-4369-ae9e-3ab09665de68
# ╠═3337c025-6bf9-4fae-b8f9-7fb0bb004451
# ╠═4fbc1851-7d17-4907-95c8-cb7862c4e73a
# ╠═aab84642-b9fa-48f3-bb97-76d0d8b01d79
# ╟─0e38f381-b0b4-4137-86c1-118077f3bf89
# ╠═dcb40e07-31cf-449c-b37a-f6ebb89fb65a
# ╟─8d8e2770-ffb7-4c4b-a624-786edac752e4
# ╠═6a8e56f1-f797-45d3-896e-64d5c39f6023
# ╠═7dcbf14a-04a4-4693-9918-b4164853cfaf
# ╠═a3883207-0020-4959-9b70-049998963bf0
# ╟─4e1cacbc-2824-4823-a9a2-f1736129bf2f
# ╠═eec05d6a-ae8c-49c0-88e3-2fa19a458dfc
# ╠═c886a9f1-ece9-4e30-a42e-819de1e60794
# ╟─8a7c9b3f-e4e8-49d3-ae2f-da6d116963d7
# ╟─62635c8c-8f21-42a9-9522-3440872aed4d
# ╠═ff69b3ec-2c54-48ce-98d7-14fbf197982c
# ╟─17d44621-6264-466d-9459-a5cda803a7c3
# ╠═2c596432-756b-4670-b0b4-79d45664685f
# ╟─aa7cc737-788c-499c-acc0-a0be06d03e10
# ╠═aa55dbcf-1491-4183-967a-959f72870fd0
# ╟─6aafc7b2-f28b-42a7-b181-d7385ba1359b
# ╟─959ea351-1b13-49ef-9c96-0fe1d4c7b886
# ╠═414af929-a7d3-45b6-ac05-3fe05870bae9
# ╠═e48e5fb2-5cbd-4413-b384-289599a588c1
# ╟─f01961ff-e8ae-4219-9bc4-669c18f12f9c
