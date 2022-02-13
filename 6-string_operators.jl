### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ 814b494e-17a9-4590-8069-0dc7007c37e3
using PlutoUI

# ╔═╡ c10d4a60-60ba-11ec-08bd-515c970644fa
md"""
# String operators
"""

# ╔═╡ 6ee0f71c-7c3e-4c6a-b76b-2d457a360e80
TableOfContents()

# ╔═╡ 0c8e328c-9021-48a6-854f-77d3a6259e6f
md"""
This is a notebook about Strings in Julia. All information you'll find here is taken from the [official julia documentation](https://docs.julialang.org/en/v1/manual/strings/). 
"""

# ╔═╡ 95e9bd04-8201-433e-b040-4b59f83210a8
md"""
## Characters

From the official Julia documentation:

> Strings are finite sequences of characters.

A character is defined using `'`, for example: 
"""

# ╔═╡ 1aae74e9-75d5-4f0e-913a-ce38910500fe
a = 'a'

# ╔═╡ 1c5c5a16-d898-461e-a25c-43d6c4a762ba
md"""
Julia manages Unicode characters so you can use fun characters such as:
"""

# ╔═╡ e68679b6-30b5-4829-bff1-5e67e7c7e123
α = 'α'

# ╔═╡ 5d69e587-51c4-4eaf-baf5-6b319347231c
md"""
Or even emojis:
"""

# ╔═╡ 8bf9f202-0751-4554-847e-17dccaa27ae4
smiley = '😀'

# ╔═╡ 3976fd93-9a0f-4473-8412-519f15611c94
md"""
## Define a string

A String is defined using `"`:
"""

# ╔═╡ 5a84a6f9-c633-43cc-87d1-a4d427fd0fa9
my_string = "This is a string."

# ╔═╡ d99a8e6e-e855-47e5-b01d-8fcd0eb3e653
md"""
Multilines string can be declared as:
"""

# ╔═╡ 2cef20b8-3780-451c-95c5-d8f8a308df70
my_long_string = """This is a
longer 
string 
on several
lines
"""

# ╔═╡ 81ec6f7b-4011-43cb-9e07-1d307330d403
md"""
Or eventually using `\n` to separate new lines on a single line:
"""

# ╔═╡ ba82bfe2-0b3d-4fdb-a7bb-9186c6f53dc2
my_string_2 = "This is a string \nmultiline string on a single line."

# ╔═╡ 88f15430-fd0d-4775-aae7-220ffdc774b2
md"""
The advantage of using `\"\"\"` is that you can use `"` inside them:
"""

# ╔═╡ a2f51e13-d43c-460c-a000-3c26d524c54c
my_string_3 = """This is a string using "quotes" inside."""

# ╔═╡ 0a5e4a18-f40f-487d-afb7-f95e56b124b6
md"""
Another way to use special characters like `"` in a string is to escape it. To escape a character you can use `\`:
"""

# ╔═╡ 1a0e6e06-dbf4-46dd-8221-ef66754d3d9c
my_string_3_2 = "This is a string using \"quotes\" inside."

# ╔═╡ 5f85c0c8-79f8-4ce2-957f-e1e90654d4c1
md"""
Both are the same:
"""

# ╔═╡ 5083a9bb-9642-44fa-9bf9-786edc6961ed
my_string_3 == my_string_3_2

# ╔═╡ ca54b446-80f6-42e3-b47b-bbd15c38da9d
md"""
## Indexing 

The fun thing about strings is that it is just a sequence of characters, so we can index into it to get the characters. For example to get the first character of out string:
"""

# ╔═╡ 13bfcbb8-0b12-4a5a-942a-e70c7241b39c
my_string_3[1]

# ╔═╡ aff886a0-afe0-415b-8a04-7f68162dc0f8
md"""
Or the last one:
"""

# ╔═╡ 4f83b903-7932-4955-a0d7-665ecb8f2af4
my_string_3[end]

# ╔═╡ 6b074341-9a12-496c-af58-691854436641
md"""
We can think of a String as a vector of characters, so functions like `length` work: 
"""

# ╔═╡ f32a212b-39e9-4c30-8bc8-d66fb69e1a86
length(my_string_3)

# ╔═╡ b3b10550-a55f-46f1-acfa-2dcc99945e86
md"""
We can also get a sub-string from the string by indexing using a sequence: 
"""

# ╔═╡ 1cae1754-c3d1-42bd-ab53-bb77be8b27e4
first_word = my_string_3[1:4]

# ╔═╡ 537b2951-e07d-4a71-839c-9f46bc96141c
typeof(first_word)

# ╔═╡ 74607235-ae72-4b2d-94eb-9418245ebe6b
md"""
We can also get one character as a 1-character string:
"""

# ╔═╡ 39c565e4-aa75-4f68-a4a6-52941c4c58f5
first_letter_as_string = my_string_3[1:1]

# ╔═╡ c71ac057-ba81-4732-94e7-9e47ea6e543a
typeof(first_letter_as_string)

# ╔═╡ 651f80f8-6df0-4afd-804f-94d3ea388e7f
md"""
## Interpolation
"""

# ╔═╡ ada9fd27-9ca4-4925-a2c8-3cdbbc0649fe
md"""
We can use values from variables when creating a string using `$`: 
"""

# ╔═╡ 74f47a35-0f91-413a-b567-5fb49f1f45a3
x = 1; y = 2

# ╔═╡ edd6cdb6-90ac-42f6-b2dd-9e4b4b9fc24b
"x is equal to $x and y is equal to $y"

# ╔═╡ 7bf49b1f-2c09-4f8a-a35b-88ef7dc9cf46
md"""
`$` is a function, so you can pass more using parenthesis:
"""

# ╔═╡ 238d5b12-7bdc-4084-ac09-6818055b0468
"x+y=$(x+y)"

# ╔═╡ da11e225-4524-4509-a6d3-9d87a4faa784
md"""
For that reason, if you need to use \$ in a string, you must escape it as seen before, using `\`:
"""

# ╔═╡ e44984e5-49ba-443a-821c-dd163523c890
"using \$ in a sentence, and also using it as a function: x is equal to $x"

# ╔═╡ fcfacddd-5e41-429a-863d-a7029b3e29a9
md"""
!!! note
	The escape character `\` is visible when printing in Pluto, but would not be visible in a print to the user. For example you see the sentence written in markdown above is using an escape character before `$` and it just displays the dollar sign, not `\`.
"""

# ╔═╡ b577f240-4d86-4ad0-aa80-8ae461f2339c
md"""
## Concatenation
"""

# ╔═╡ afa56a1f-c011-49c2-83a7-283119cdb1a3
md"""
We can concatenate two strings using `string`:
"""

# ╔═╡ ea9c9b69-d346-4397-94cf-613fcf839565
string("First string", ", second string")

# ╔═╡ d46d8c2a-9d2e-4c13-9716-15a9dd1034c6
md"""
Or using `*` as a shortcut:
"""

# ╔═╡ 333062b7-988e-4d71-820a-a0c9d9e8082b
"First string" * ", second string"

# ╔═╡ ca460e95-26ea-4acf-bff4-b965d5f2736d
md"""
You can also use join to concatenate a string or a vector of strings with another string, *e.g.*:
"""

# ╔═╡ 332eff01-989f-487e-a393-e170be5d2d26
join(["First string", "second string"], ", ")

# ╔═╡ ea0c2c6a-5d37-417c-9a46-2989f43431cb
md"""
The vector of strings is concatenated together using ", " as a separator.
"""

# ╔═╡ 5b674596-8fc6-46a5-8f90-057a398f405d
md"""
## Comparison

We can compare strings with the usual operators:

- `==` for equality comparison
"""

# ╔═╡ 0b2f4857-6760-4b31-8b42-18c542e5e23b
"a string" == "another string"

# ╔═╡ 1d2efe68-18d5-4cce-bfa2-3a851cd4b697
"a string" != "another string"

# ╔═╡ 3dae3bf7-98c8-4269-8d4d-2c0c7bc2ca30
md"""
- `<`, `>`, `<=` and `>=`:
"""

# ╔═╡ b3ded341-ce60-4173-bc1c-4faaa4bc7d61
"a" < "z"

# ╔═╡ 69fbf0e6-90e4-4699-8c54-69fa13ff8da7
"a" <= "b"

# ╔═╡ 045f1583-d6e4-4473-b3a2-201778182791
"ab" > "aa"

# ╔═╡ 8cbfe0fc-6ca2-47b2-90fc-abd6fba78f86
"aab" >= "aaa"

# ╔═╡ 0627bfe1-947f-483d-97fd-1ed09afb7195
md"""
## Search

We can search if a character is in another one using different functions:
"""

# ╔═╡ a9d59caf-1466-4064-815f-13baf47b62b0
findfirst(isequal('o'), "school")

# ╔═╡ a7164dee-5b1a-4794-8dce-2d326711b761
findlast(isequal('o'), "school")

# ╔═╡ f74ecac0-fdbe-4852-8dc0-4ae755535853
findall(isequal('o'), "school")

# ╔═╡ 71e9fea8-0b3f-4fc5-9ee7-6e9d8860d05e
md"""
We can use the same functions to know if a string is in another:
"""

# ╔═╡ 1eba7dd1-c541-4362-a03a-2972502fca9a
findfirst("is", "School is good!")

# ╔═╡ 1d603329-b127-4707-aebd-efe2c58261af
md"""
Or test whether a string occurs in a another:
"""

# ╔═╡ 36eaac1d-898c-4ed3-8fc5-14468dce1074
occursin("cat", "Oggy is my cat.")

# ╔═╡ 807b0051-c8d9-4236-8a3d-36ebdde77314
md"""
## Replace

We can replace words in a string using `replace`:
"""

# ╔═╡ 683b87d9-f733-4f51-8dc6-516d7e6beef7
replace("Oggy is my cat.", "cat" => "wonderfull cat")

# ╔═╡ 2b184027-f575-4fe6-a8ba-3b3c74c05b1e
md"""
`replace` takes a string to modify as the first argument, and a Pair as the second argument. The Pair is formatted as follows: `"string to replace" => "string that will replace the first one"`.
"""

# ╔═╡ 0c93a4dc-d993-48f5-b67f-6cb7cece5366
md"""
We can also replace single characters if needed:
"""

# ╔═╡ c2f8c53f-3e5d-4c35-8618-d1b3af41a414
replace("Oggy is my cat.", 't' => 'r')

# ╔═╡ b81f16cb-7263-4c42-b25a-9500c67099f0
md"""
## Regular expressions

Regular expressions are used to search patterns in strings with some rules. 

A rule can be something such as "starting with", "ending with", "containing = as the third character, followed by a blank space and then an integer".

A regular expression is declared itself as a string, preffixed with an `r`:
"""

# ╔═╡ acb9ceeb-99a1-450b-a0f7-1d96f1d8c115
typeof(r"test")

# ╔═╡ e6753dc1-9650-44cb-98c9-5ef17b4ba890
md"""
Regex means **Reg**ular **ex**pression. 

For example you could be interested knowing if a string starts with an O In this case you can use `^`:
"""

# ╔═╡ feec3956-75d5-4fb5-b48d-b155641b7c50
occursin(r"^O", "Oggy is my cat.")

# ╔═╡ 435a996f-6409-4d63-a7dc-0330a37a1ae3
md"""
Here the regular expression can be translated to "Is my string starting with O".

If we want to know if it ends with something, we cans use $ as a suffix:

"""

# ╔═╡ fa1070aa-56e1-4a9c-802a-229712533b49
occursin(r"cat.$", "Oggy is my cat.")

# ╔═╡ 84a92180-216e-455d-b79a-240d43d31573
md"""
Now here we made a mistake without realising it. How? Look at the following:
"""

# ╔═╡ 2fe3e037-cccf-4456-bb49-90f0d31ed5ed
occursin(r"cat.$", "Oggy is my cats")

# ╔═╡ fa0c758c-e6ab-40fc-ac0b-8d49431ca846
md"""
It returns `true` again, but our last character is a `.`, not an s!

This is because `.` is a special character in regular expression that is used to match **any** character.

Here is a little list of the most important special characters:

- `^` starts with (used as a prefix, *e.g.*: `r"^a"` means starts with "a")
- `$` ends with (used as a suffix, *e.g.*: `r"a$"` means ends with "a")
- `*` appears 0 or more times (*e.g.*: `r"a*"` has "a" zero or more times)
- `+` appears 1 or more times (*e.g.*: `r"a+"` has "a" one or more times)
- `{n}` appears n time (*e.g.*: `r"a{2}"` has "a" two times)
- `[alpha]` alphabetic character
- `[alnum]` alphanumeric character
- `[blank]` space or tab
- `[x-y]` range

"""

# ╔═╡ 6ca8ce2e-92f8-4731-bfa4-26ce1a18112f
occursin(r"^b", "banana") # starts with "b"

# ╔═╡ c3dfed90-9ed5-4595-8f82-62e4d4c0b8f3
occursin(r"5$", "My home adress is 5") # ends with 5

# ╔═╡ a6918fd1-dd29-416e-901e-f78de4b84e8c
occursin(r"c*", "banana") # has "c" 0 or more times (0 times here)

# ╔═╡ b306c22e-09f8-42bc-8a7a-a65eadee2c6f
occursin(r"c+", "banana") # has "c" 1 or more times 

# ╔═╡ 8c7393da-04ac-4e8e-9b02-d09de338caad
occursin(r"a{3}", "banana") # has "a" three times in a row (not here!) 

# ╔═╡ 55487736-ca4b-4052-b685-273af0c98621
occursin(r"a[[:alpha:]]c", "abc") # has "a", an alphabetical letter and then a "c"

# ╔═╡ 57c43dc9-a3f2-457e-87ea-ebf91136b3c5
occursin(r"a[[:alnum:]]c", "abc") # has "a", an alphanumeric character and then "c"

# ╔═╡ dc4911d3-a27b-469c-a55a-af74d4ffb8e9
occursin(r"a[[:blank:]]", "a ") # has "a" and then a blank 

# ╔═╡ 0b5275c7-640f-43a9-97ad-c6cab8e6a770
occursin(r"[0-9]23", "123") # has a number between 0 and 9 and then 2 and 3

# ╔═╡ ba3dc7d8-4404-4c8e-a1be-3a77d11e1fdd
md"""
Now imagine we manage a data base of animals and their id is a string of their names and an index:
"""

# ╔═╡ 0673652a-64cc-4c7f-a5b7-97e135226b6a
string_vec = ["cat122", "bird233", "bird001", "dog001", "dog899", "error101", "101warning"]

# ╔═╡ c877e542-e8c5-4d03-9a77-1ac04823237a
md"""
If we want only the animals that have an id greater than 200, we can use a regular expression such as:
"""

# ╔═╡ af97e353-5a40-42ba-87cc-2c3c41f2e532
id_greater_than_200 = r"^[[:alpha:]]{3,4}[2-9]"

# ╔═╡ 6d03558b-e727-4136-bc16-bd282cda6b94
md"""
Which means in plain english:

We want a string that starts (`^`) with three or four (`{3,4}`) alphabetical letters (`[[:alpha:]]`) and followed by a number between 2 and 9 (`[2-9]`). We don't want any filter on the following characters.  

And our results is:
"""

# ╔═╡ 759c5c8c-3ba7-43f3-93d9-f335cd5ac10c
string_vec[occursin.(id_greater_than_200, string_vec)]

# ╔═╡ 015c8c0a-907e-46d4-8d42-1e311c4d28a9
md"""
!!! note
	What happens here is that we broadcast occursin (the point after the function name: `occursin.`) because we apply the function on a vector. Then we use the output of occursin to index in our vector `string_vec`, which only returns the strings that were selected by our regular expression.
"""

# ╔═╡ fa009519-64b9-419f-9997-988ece677b02
md"""
Now we could make it more generic using this kind of regular expression instead:
"""

# ╔═╡ d50b40a0-122b-4ffd-8e6f-5ab984f24488
generic_regexp = r"^[[:alpha:]]+[2-9][0-9]{2,}"

# ╔═╡ 0e81fd9f-d41f-4cd8-ac2c-5343ad8cb0ee
md"""
which would ask for a string starting (`^`) with any number (`+`) of alphabetical letters (`[[:alpha:]]`) followed by an integer value greater that 2 (`[2-9]`) and at least two (`{2,}`) number values between 0 and 9 (at least 2 to get at least 200). This way the expression would work for any kind of animal name and index in the database, not just the ones above:  
"""

# ╔═╡ 8f23a237-aa5a-4df0-8056-0f30f60b8b93
occursin(generic_regexp, "unicorn35599944455")

# ╔═╡ f110c98a-8c85-40c3-a3b6-1a5a505d2274
md"""
Yes, there are more unicorns than humans, but I don't know where they live.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.34"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
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
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

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
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

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
git-tree-sha1 = "13468f237353112a01b2d6b32f3d0f80219944aa"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8979e9802b4ac3d58c503a20f2824ad67f9074dd"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.34"

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
# ╟─814b494e-17a9-4590-8069-0dc7007c37e3
# ╟─6ee0f71c-7c3e-4c6a-b76b-2d457a360e80
# ╟─c10d4a60-60ba-11ec-08bd-515c970644fa
# ╟─0c8e328c-9021-48a6-854f-77d3a6259e6f
# ╟─95e9bd04-8201-433e-b040-4b59f83210a8
# ╠═1aae74e9-75d5-4f0e-913a-ce38910500fe
# ╟─1c5c5a16-d898-461e-a25c-43d6c4a762ba
# ╠═e68679b6-30b5-4829-bff1-5e67e7c7e123
# ╟─5d69e587-51c4-4eaf-baf5-6b319347231c
# ╠═8bf9f202-0751-4554-847e-17dccaa27ae4
# ╟─3976fd93-9a0f-4473-8412-519f15611c94
# ╠═5a84a6f9-c633-43cc-87d1-a4d427fd0fa9
# ╟─d99a8e6e-e855-47e5-b01d-8fcd0eb3e653
# ╠═2cef20b8-3780-451c-95c5-d8f8a308df70
# ╟─81ec6f7b-4011-43cb-9e07-1d307330d403
# ╠═ba82bfe2-0b3d-4fdb-a7bb-9186c6f53dc2
# ╟─88f15430-fd0d-4775-aae7-220ffdc774b2
# ╠═a2f51e13-d43c-460c-a000-3c26d524c54c
# ╟─0a5e4a18-f40f-487d-afb7-f95e56b124b6
# ╠═1a0e6e06-dbf4-46dd-8221-ef66754d3d9c
# ╟─5f85c0c8-79f8-4ce2-957f-e1e90654d4c1
# ╠═5083a9bb-9642-44fa-9bf9-786edc6961ed
# ╟─ca54b446-80f6-42e3-b47b-bbd15c38da9d
# ╠═13bfcbb8-0b12-4a5a-942a-e70c7241b39c
# ╟─aff886a0-afe0-415b-8a04-7f68162dc0f8
# ╠═4f83b903-7932-4955-a0d7-665ecb8f2af4
# ╟─6b074341-9a12-496c-af58-691854436641
# ╠═f32a212b-39e9-4c30-8bc8-d66fb69e1a86
# ╟─b3b10550-a55f-46f1-acfa-2dcc99945e86
# ╠═1cae1754-c3d1-42bd-ab53-bb77be8b27e4
# ╠═537b2951-e07d-4a71-839c-9f46bc96141c
# ╟─74607235-ae72-4b2d-94eb-9418245ebe6b
# ╠═39c565e4-aa75-4f68-a4a6-52941c4c58f5
# ╠═c71ac057-ba81-4732-94e7-9e47ea6e543a
# ╟─651f80f8-6df0-4afd-804f-94d3ea388e7f
# ╟─ada9fd27-9ca4-4925-a2c8-3cdbbc0649fe
# ╠═74f47a35-0f91-413a-b567-5fb49f1f45a3
# ╠═edd6cdb6-90ac-42f6-b2dd-9e4b4b9fc24b
# ╟─7bf49b1f-2c09-4f8a-a35b-88ef7dc9cf46
# ╠═238d5b12-7bdc-4084-ac09-6818055b0468
# ╟─da11e225-4524-4509-a6d3-9d87a4faa784
# ╠═e44984e5-49ba-443a-821c-dd163523c890
# ╟─fcfacddd-5e41-429a-863d-a7029b3e29a9
# ╟─b577f240-4d86-4ad0-aa80-8ae461f2339c
# ╟─afa56a1f-c011-49c2-83a7-283119cdb1a3
# ╠═ea9c9b69-d346-4397-94cf-613fcf839565
# ╟─d46d8c2a-9d2e-4c13-9716-15a9dd1034c6
# ╠═333062b7-988e-4d71-820a-a0c9d9e8082b
# ╟─ca460e95-26ea-4acf-bff4-b965d5f2736d
# ╠═332eff01-989f-487e-a393-e170be5d2d26
# ╟─ea0c2c6a-5d37-417c-9a46-2989f43431cb
# ╟─5b674596-8fc6-46a5-8f90-057a398f405d
# ╠═0b2f4857-6760-4b31-8b42-18c542e5e23b
# ╠═1d2efe68-18d5-4cce-bfa2-3a851cd4b697
# ╟─3dae3bf7-98c8-4269-8d4d-2c0c7bc2ca30
# ╠═b3ded341-ce60-4173-bc1c-4faaa4bc7d61
# ╠═69fbf0e6-90e4-4699-8c54-69fa13ff8da7
# ╠═045f1583-d6e4-4473-b3a2-201778182791
# ╠═8cbfe0fc-6ca2-47b2-90fc-abd6fba78f86
# ╟─0627bfe1-947f-483d-97fd-1ed09afb7195
# ╠═a9d59caf-1466-4064-815f-13baf47b62b0
# ╠═a7164dee-5b1a-4794-8dce-2d326711b761
# ╠═f74ecac0-fdbe-4852-8dc0-4ae755535853
# ╟─71e9fea8-0b3f-4fc5-9ee7-6e9d8860d05e
# ╠═1eba7dd1-c541-4362-a03a-2972502fca9a
# ╟─1d603329-b127-4707-aebd-efe2c58261af
# ╠═36eaac1d-898c-4ed3-8fc5-14468dce1074
# ╟─807b0051-c8d9-4236-8a3d-36ebdde77314
# ╠═683b87d9-f733-4f51-8dc6-516d7e6beef7
# ╟─2b184027-f575-4fe6-a8ba-3b3c74c05b1e
# ╟─0c93a4dc-d993-48f5-b67f-6cb7cece5366
# ╠═c2f8c53f-3e5d-4c35-8618-d1b3af41a414
# ╟─b81f16cb-7263-4c42-b25a-9500c67099f0
# ╠═acb9ceeb-99a1-450b-a0f7-1d96f1d8c115
# ╟─e6753dc1-9650-44cb-98c9-5ef17b4ba890
# ╠═feec3956-75d5-4fb5-b48d-b155641b7c50
# ╟─435a996f-6409-4d63-a7dc-0330a37a1ae3
# ╠═fa1070aa-56e1-4a9c-802a-229712533b49
# ╟─84a92180-216e-455d-b79a-240d43d31573
# ╠═2fe3e037-cccf-4456-bb49-90f0d31ed5ed
# ╟─fa0c758c-e6ab-40fc-ac0b-8d49431ca846
# ╠═6ca8ce2e-92f8-4731-bfa4-26ce1a18112f
# ╠═c3dfed90-9ed5-4595-8f82-62e4d4c0b8f3
# ╠═a6918fd1-dd29-416e-901e-f78de4b84e8c
# ╠═b306c22e-09f8-42bc-8a7a-a65eadee2c6f
# ╠═8c7393da-04ac-4e8e-9b02-d09de338caad
# ╠═55487736-ca4b-4052-b685-273af0c98621
# ╠═57c43dc9-a3f2-457e-87ea-ebf91136b3c5
# ╠═dc4911d3-a27b-469c-a55a-af74d4ffb8e9
# ╠═0b5275c7-640f-43a9-97ad-c6cab8e6a770
# ╟─ba3dc7d8-4404-4c8e-a1be-3a77d11e1fdd
# ╠═0673652a-64cc-4c7f-a5b7-97e135226b6a
# ╟─c877e542-e8c5-4d03-9a77-1ac04823237a
# ╠═af97e353-5a40-42ba-87cc-2c3c41f2e532
# ╟─6d03558b-e727-4136-bc16-bd282cda6b94
# ╠═759c5c8c-3ba7-43f3-93d9-f335cd5ac10c
# ╟─015c8c0a-907e-46d4-8d42-1e311c4d28a9
# ╟─fa009519-64b9-419f-9997-988ece677b02
# ╠═d50b40a0-122b-4ffd-8e6f-5ab984f24488
# ╟─0e81fd9f-d41f-4cd8-ac2c-5343ad8cb0ee
# ╠═8f23a237-aa5a-4df0-8056-0f30f60b8b93
# ╟─f110c98a-8c85-40c3-a3b6-1a5a505d2274
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
