### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

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
