### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# ╔═╡ d794dbb2-0254-4808-80ea-75f184586ad8
begin
	using PlutoUI
	PlutoUI.TableOfContents()
end

# ╔═╡ 32785fd3-0adb-4b61-a8dc-c920904d66ea
using OrderedCollections

# ╔═╡ 3a242ea0-a518-11eb-0c88-d541f2d52fb8
md"""
# Dictionaries
"""

# ╔═╡ ea932952-cb4c-4876-9dc4-3a2b56cf4761
md"""
A dictionary is an **unordered collection** of key-value pairs of elements.

## Declaration

The best way to understand what it means is by looking at one:
"""

# ╔═╡ 61cb5c19-2c9b-4484-b95b-c54c2bc4066e
dict = Dict("🍌" => 4, "🍓" => 15)

# ╔═╡ 94d9dbe3-4042-4bdf-9d14-7acc165514cc
md"""
As we can see a dictionary is declared using the `Dict` function, and then elements are declared using the `key => value` pair syntax. The keys can be of any type as long as they all share the same type (*i.e.* all `String`). The values can be of any type, and the type of the values can differ between one and the other (although it is not recommanded for performance reasons). For example the same using symbols as keys, and integer and string for the values:
"""

# ╔═╡ 874a6524-8f3c-4bc0-bc6e-9e8fec402e56
Dict(:🍌 => 4, :🍓 => "this is not the season")

# ╔═╡ 45835257-6034-4d64-be18-68c966d96603
md"""
And here's an example with integers:
"""

# ╔═╡ a0be3db2-a1a0-4405-b453-87b933d76ce2
Dict(1234 => 4, 999 => 15)

# ╔═╡ 9f81f1e8-f3c2-4fa4-8469-2d605a418481
md"""
Because it is used to retreive a value, each key in a dictionary must be unique. You couldn't retreive a value if it shared the same index as one another.

Please note also that a dictionary is unordered, meaning we can't index into a dictionary by using the order we used to declare our `key=>value` pairs.
"""

# ╔═╡ de10d9d7-3669-4999-8309-f6c0452f5f10
md"""
We can also declare a dictionary in two steps using the zip function:

- first we declare our keys and values separately:
"""

# ╔═╡ 349fbaf2-1d6e-41c8-a05e-49a1f2d12ac1
mykeys = (:🍌, :🍓)

# ╔═╡ 449eb41a-b5ac-422e-95c7-8baf36bb21f0
myvalues = (4, 15)

# ╔═╡ ae9376e7-3fc0-4668-a495-4338e139385d
md"""
And then we use the zip function to create a `key=>value` pair for each pair of element inside our dictionary:
"""

# ╔═╡ bb28ae8d-5bc2-4056-9c75-9983362c6716
Dict(zip(mykeys,myvalues))

# ╔═╡ 602bc23f-1acc-44a5-8986-cadea9c7f461
md"""
#### Empty dictionary
"""

# ╔═╡ 73dac266-f783-4406-91c7-27a08c4e4e60
md"""
We can declare an empty dictionary using `Dict()`, and even constrain the types of the keys and the values that will be added as follows:
"""

# ╔═╡ de471d5a-3ca7-4f6a-b955-ec38cc88660b
constrained_dict = Dict{String,Float64}()

# ╔═╡ e1856197-b467-465c-ba4c-032282c989eb
constrained_dict["a"] = 2

# ╔═╡ 83c526bb-5db2-4a30-bcfa-7476faaf9f55
constrained_dict["a"]

# ╔═╡ 7e1dbf59-df69-417a-8578-b34bb403848d
constrained_dict["b"] = "test"

# ╔═╡ 73055842-a630-4403-8233-f0a774258323
md"""
## Indexing
"""

# ╔═╡ 70339c78-0e43-404b-a7f3-b5e837915ebb
md"""Indexing a dictionary is made using `[` along with the key of choice. For example we would type `dict[key]` to get the value in `dict` stored in `key`:"""

# ╔═╡ 9ea3f3db-2421-4e43-a706-7b7f7c0b1959
dict["🍓"]

# ╔═╡ 7a00c43e-d7a8-40c0-bcfa-594b3f4e7161
md"""
Remember that dictionaries are not ordered, but we can still reproduce the behavior of an array just for fun using integers as keys:
"""

# ╔═╡ 26e9f223-690d-4063-8185-ef3ce0b5e622
array_dict = Dict(1 => "first value", 2 => "second value")

# ╔═╡ cca40559-57dd-4827-a334-cd437b6a475d
array_dict[2]

# ╔═╡ 18fc5ca7-febe-40a4-bfa8-ef5a8c0b547c
md"""
If we want to index a value that does not exist yet in the dictionary, it returns an error:
"""

# ╔═╡ ae2b5a5e-9a3a-49e4-8fff-cc5ef26ed173
array_dict[3]

# ╔═╡ 37c1ceae-e993-4b36-96df-c088d3ab006b
md"""
We can check if a key exists using `haskey`:
"""

# ╔═╡ a609fc58-3ade-41ac-8325-56a7a66e2a3b
haskey(array_dict,2)

# ╔═╡ 6e36762d-e0d6-45b1-958d-f0602bdd11a5
md"""
And if we're not sure if a key exist and want to return a default value if not, there's `get`:
"""

# ╔═╡ bee06854-8bbd-4c92-953d-46c18520707c
get(array_dict,1,"default value") # The key exists, so it returns its value

# ╔═╡ ddb11f15-b000-4276-9c06-30b9d1e9936c
get(array_dict,3,"default value") # The key does not exist, it returns the default one

# ╔═╡ 693fac53-b2b6-489b-a7aa-93ea5eab8165
md"""
If you want to get all values or all keys at once, use `keys` and `values` like for arrays:
"""

# ╔═╡ de829c74-37f4-4fe8-8e81-da3c729e2019
keys(dict)

# ╔═╡ b08a7e04-6106-4ff6-baa3-b153eb627eba
values(dict)

# ╔═╡ 296be6bc-0ee2-4d2b-b8e5-8b730a974162
md"""
!!! note
	As we can see `keys` and `values` return a `KeySet` and a `ValueIterator` respectively. But we can use `collect` to get them as arrays.
"""

# ╔═╡ 9f0b1f62-f9f2-45b8-8fda-fe02a99fa602
collect(values(dict))

# ╔═╡ f106e0b7-7b17-4564-8ba8-a9ba0c4c413a
md"""
## Filter
"""

# ╔═╡ 6a22a2b0-8c8d-4f52-99ae-d37bc2f1ef87
md"""
Filtering values is rather simple, just use the filer function 🙂. It works by providing a filtering function as the first argument:
"""

# ╔═╡ 4751e962-d173-4047-aeee-7c562d15ca8d
filter(x -> iseven(x.second), dict)

# ╔═╡ fae3a4ab-222a-4b4e-a617-9f8199194dc7
md"""
!!! note
	`x -> iseven(x.second)` is an anonymous function, we'll get into that in the future. What it does here is testing if the value of a `key=>value` pair is even or not, and returns `true` if so, and `false` if not. `filter` then filters out the values that are not even, *i.e.* the ones that return `false`.
"""

# ╔═╡ 6bbe9f7c-17b1-4566-89b4-6247fd937256
md"""
## Mutate
"""

# ╔═╡ d0371dc1-5f08-4f1d-a79f-f4bd954eb974
md"""
Dictionaries are easy to work with. We can add new elements using `push!`, merge two dictionaries using `merge` and delete elements using either `pop!` or `delete!`.

Let's see an example using the dict we previously declared. Here's a reminder of which elements it holds:
"""

# ╔═╡ 28ff01f9-681c-400b-b62b-e3524dcfe2c1
dict

# ╔═╡ b19e99d0-3729-4255-808b-4261fd68145a
md"""
#### Add elements
"""

# ╔═╡ c895188a-8b24-45d7-a862-18110c8b7fd1
md"""
Now let's add a new element:
"""

# ╔═╡ f7dbbd52-a2da-478f-89b0-e712f945103c
begin
	dict_tmp = copy(dict)
	push!(dict_tmp, "🍒" => 30)
end

# ╔═╡ 15ac5ad1-8843-4be6-9337-5c41fe8589cf
md"""

!!! note

	If we were outside of Pluto, we would simply use `push!(dict, "🍒" => 30)`. Pluto is designed around reactivity, so it is generally bad practice to mutate a variable inside a Pluto notebook. We would normally prefer assigning the results to a new variable. I use a trick here to still be able to show you an example with a mutating function (i.e. one that change the value of its input argument directly). The trick is to put the code in a `begin ... end` statement to make it as a single statement, and apply `push!` on a copy of `dict` (here `dict_tmp`) so `dict` is never changed. If it is too complicated, no worries, just consider this big blob of code just as if it was only written `push!(dict, "🍒" => 30)`.
"""

# ╔═╡ 9c7974c3-6e50-44d5-b5ec-cb535280e610
md"""
#### Merge dictionaries
"""

# ╔═╡ e04a56ef-7d7a-47da-9380-28e3fe9e4720
md"""
We can merge two dictionaries into a single one using `merge`:
"""

# ╔═╡ 8e132c33-2d5a-48d2-a6d7-c2d7fdc5b2b5
dict2 = Dict("🍆" => 2, "🍅" => 4)

# ╔═╡ 85fac12d-02f4-4598-884f-82a93b29dae0
merge(dict,dict2)

# ╔═╡ 8e27d819-d58a-42b9-bf63-e9ab6c01576e
md"""
#### Delete elements
"""

# ╔═╡ 93732551-1730-41da-ab86-dbaa3732dfa0
md"""
To delete an element from a dictionary, you can either use `pop!`:
"""

# ╔═╡ fda3a3b9-7e06-422c-9b46-668c923c53e7
begin
	dict_tmp2 = copy(dict)
	pop!(dict_tmp2, "🍌")
end

# ╔═╡ e6e1515d-a893-44e9-a5e3-c6e191dfaa2d
md"""
You can see it returns 4 here. That is because `pop!` returns the value of the element it just removed, and it is very useful sometimes! We can check the newly created `dict_tmp2` and see if there still is the banana element:
"""

# ╔═╡ 1d68302e-0fbf-4e60-8bd4-97d90c5ee0b1
dict_tmp2

# ╔═╡ 2b0361ec-b65b-426c-80a5-b5bfa95a6730
md"""
Nope, it was removed as expected.
"""

# ╔═╡ bab7580c-228e-4bd1-91c5-e476f1c97ad5
md"""
If you prefer to get the remaining elements instead of the one removed, you can use `delete!`:
"""

# ╔═╡ f62a1379-8afe-48a6-9466-a9235199cfdb
begin
	dict_tmp3 = copy(dict)
	delete!(dict_tmp3, "🍌")
end

# ╔═╡ 88210fb3-02f6-420d-b6a0-de91ec9fcfc5
dict_tmp3

# ╔═╡ a6a378c0-f3bc-4ce9-8e3d-29b3caf43ab5
md"""
## Ordered dictionaries
"""

# ╔═╡ 77496c2f-4e8f-44b6-bddb-1763ac179398
md"""
We saw earlier that dictionaries are unordered. But if you think unordered collections are too chaotic and you want to put an end to this madness, you can use ordered dictionaries from the `OrderedCollections.jl` package instead.

So what is an ordered dictionary? The only difference with a standard dictionary is that elements are ordered, meaning we assign them a position in the dictionary, and they stick to it. And if you add an element, it is added as the last element, as things should be. Think of it like an array with names for each element.    
"""

# ╔═╡ ee62f664-1e9d-4d0d-bd89-c46210d0bf5e
begin
	order_dict = OrderedDict(dict_tmp)
	push!(order_dict, "🌲" => 1)
end

# ╔═╡ a75a0cee-1a9e-4186-a39b-6f7e1e3a9f89
md"""
!!! note
	If you have an error on the code above, it is certainly because you didn't activate the project before opening the pluto notebook, so the `OrderedCollections` package is not available to you. There's two solutions to this issue: 
	
	1/ activate the environment before opening this notebook. To do so, enter the following command in Julia `] activate .`. Then instantiate the environment by entering `] instantiate`. This will work assuming you are working from the whole [julia_course](https://github.com/VEZY/julia_course) project.
	
	2/ Or add a new cell below with the following code: `import Pkg; Pkg.add("OrderedCollections")`.
"""

# ╔═╡ b3a97c75-07a8-404a-ae42-01a3e865af16
md"""
## Useful functions
"""

# ╔═╡ a43f99bc-9ead-40ab-8743-31923537b953
md"""
Union of two dictionaries:
"""

# ╔═╡ 603cd2c3-1437-437a-a931-caa893b5c05a
union(dict2, dict_tmp)

# ╔═╡ ab10a88a-8542-479b-8452-9612d25ef26e
md"""
Intersection of two dictionaries:
"""

# ╔═╡ 95aba192-6027-46d2-8cf8-6222ddbed0d7
intersect(dict, dict_tmp)

# ╔═╡ b0d12465-c1ba-4520-a0d4-321b86219845
md"""
Difference between two dictionaries:
"""

# ╔═╡ 11c0414b-ef75-4211-ad69-9e402f6061c9
setdiff(dict2, dict_tmp)

# ╔═╡ Cell order:
# ╟─d794dbb2-0254-4808-80ea-75f184586ad8
# ╟─3a242ea0-a518-11eb-0c88-d541f2d52fb8
# ╟─ea932952-cb4c-4876-9dc4-3a2b56cf4761
# ╠═61cb5c19-2c9b-4484-b95b-c54c2bc4066e
# ╟─94d9dbe3-4042-4bdf-9d14-7acc165514cc
# ╠═874a6524-8f3c-4bc0-bc6e-9e8fec402e56
# ╟─45835257-6034-4d64-be18-68c966d96603
# ╠═a0be3db2-a1a0-4405-b453-87b933d76ce2
# ╟─9f81f1e8-f3c2-4fa4-8469-2d605a418481
# ╟─de10d9d7-3669-4999-8309-f6c0452f5f10
# ╠═349fbaf2-1d6e-41c8-a05e-49a1f2d12ac1
# ╠═449eb41a-b5ac-422e-95c7-8baf36bb21f0
# ╟─ae9376e7-3fc0-4668-a495-4338e139385d
# ╠═bb28ae8d-5bc2-4056-9c75-9983362c6716
# ╟─602bc23f-1acc-44a5-8986-cadea9c7f461
# ╟─73dac266-f783-4406-91c7-27a08c4e4e60
# ╠═de471d5a-3ca7-4f6a-b955-ec38cc88660b
# ╠═e1856197-b467-465c-ba4c-032282c989eb
# ╠═83c526bb-5db2-4a30-bcfa-7476faaf9f55
# ╠═7e1dbf59-df69-417a-8578-b34bb403848d
# ╟─73055842-a630-4403-8233-f0a774258323
# ╟─70339c78-0e43-404b-a7f3-b5e837915ebb
# ╠═9ea3f3db-2421-4e43-a706-7b7f7c0b1959
# ╟─7a00c43e-d7a8-40c0-bcfa-594b3f4e7161
# ╠═26e9f223-690d-4063-8185-ef3ce0b5e622
# ╠═cca40559-57dd-4827-a334-cd437b6a475d
# ╟─18fc5ca7-febe-40a4-bfa8-ef5a8c0b547c
# ╠═ae2b5a5e-9a3a-49e4-8fff-cc5ef26ed173
# ╟─37c1ceae-e993-4b36-96df-c088d3ab006b
# ╠═a609fc58-3ade-41ac-8325-56a7a66e2a3b
# ╟─6e36762d-e0d6-45b1-958d-f0602bdd11a5
# ╠═bee06854-8bbd-4c92-953d-46c18520707c
# ╠═ddb11f15-b000-4276-9c06-30b9d1e9936c
# ╟─693fac53-b2b6-489b-a7aa-93ea5eab8165
# ╠═de829c74-37f4-4fe8-8e81-da3c729e2019
# ╠═b08a7e04-6106-4ff6-baa3-b153eb627eba
# ╟─296be6bc-0ee2-4d2b-b8e5-8b730a974162
# ╠═9f0b1f62-f9f2-45b8-8fda-fe02a99fa602
# ╟─f106e0b7-7b17-4564-8ba8-a9ba0c4c413a
# ╟─6a22a2b0-8c8d-4f52-99ae-d37bc2f1ef87
# ╠═4751e962-d173-4047-aeee-7c562d15ca8d
# ╟─fae3a4ab-222a-4b4e-a617-9f8199194dc7
# ╟─6bbe9f7c-17b1-4566-89b4-6247fd937256
# ╟─d0371dc1-5f08-4f1d-a79f-f4bd954eb974
# ╠═28ff01f9-681c-400b-b62b-e3524dcfe2c1
# ╟─b19e99d0-3729-4255-808b-4261fd68145a
# ╟─c895188a-8b24-45d7-a862-18110c8b7fd1
# ╠═f7dbbd52-a2da-478f-89b0-e712f945103c
# ╟─15ac5ad1-8843-4be6-9337-5c41fe8589cf
# ╟─9c7974c3-6e50-44d5-b5ec-cb535280e610
# ╟─e04a56ef-7d7a-47da-9380-28e3fe9e4720
# ╠═8e132c33-2d5a-48d2-a6d7-c2d7fdc5b2b5
# ╠═85fac12d-02f4-4598-884f-82a93b29dae0
# ╟─8e27d819-d58a-42b9-bf63-e9ab6c01576e
# ╟─93732551-1730-41da-ab86-dbaa3732dfa0
# ╠═fda3a3b9-7e06-422c-9b46-668c923c53e7
# ╟─e6e1515d-a893-44e9-a5e3-c6e191dfaa2d
# ╠═1d68302e-0fbf-4e60-8bd4-97d90c5ee0b1
# ╟─2b0361ec-b65b-426c-80a5-b5bfa95a6730
# ╟─bab7580c-228e-4bd1-91c5-e476f1c97ad5
# ╠═f62a1379-8afe-48a6-9466-a9235199cfdb
# ╠═88210fb3-02f6-420d-b6a0-de91ec9fcfc5
# ╟─a6a378c0-f3bc-4ce9-8e3d-29b3caf43ab5
# ╟─77496c2f-4e8f-44b6-bddb-1763ac179398
# ╠═32785fd3-0adb-4b61-a8dc-c920904d66ea
# ╠═ee62f664-1e9d-4d0d-bd89-c46210d0bf5e
# ╟─a75a0cee-1a9e-4186-a39b-6f7e1e3a9f89
# ╟─b3a97c75-07a8-404a-ae42-01a3e865af16
# ╟─a43f99bc-9ead-40ab-8743-31923537b953
# ╠═603cd2c3-1437-437a-a931-caa893b5c05a
# ╟─ab10a88a-8542-479b-8452-9612d25ef26e
# ╠═95aba192-6027-46d2-8cf8-6222ddbed0d7
# ╟─b0d12465-c1ba-4520-a0d4-321b86219845
# ╠═11c0414b-ef75-4211-ad69-9e402f6061c9
