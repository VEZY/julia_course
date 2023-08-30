### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 4c91d9b1-98cb-427c-9a41-030000e9718a
html"<button onclick='present()'>present</button>"

# ╔═╡ 23ed4932-edaa-11ed-0d5e-73ae08d92ceb
md"""
# Functions in Julia
"""

# ╔═╡ 55f6ec9f-bdd3-46bd-9703-2e1719d02227
md"""
## What is a function?

A function is a block of code that performs a specific task. It takes some input, processes it, and returns some output. Functions are a fundamental building block of programming, and they’re used to organize code into reusable, modular pieces.
"""

# ╔═╡ b62c989d-2ac0-4ea9-b9a3-d4dabb0c0b8f
md"""
## Why are functions important?

Functions are important because they allow us to write code that is more readable, reusable, and maintainable. By breaking our code into smaller, self-contained pieces, we can make it easier to understand and debug. We can also reuse the same function in multiple places, which saves us time and effort.
"""

# ╔═╡ d6e103e0-5cb1-4799-8c7d-5f372786b9a2
md"""
## Function example

You can define a function called `add` that takes two numbers as arguments and returns their sum:
"""

# ╔═╡ 8e5ccbc8-6d9f-4332-9ab9-087bf4b8e022
function add(x, y)
    return x + y
end

# ╔═╡ 63378618-e25c-4682-aa3e-5eb9abe33ede
md"""
To call a function, you use the function name followed by parentheses containing the arguments. For example, you can call the add function like this:
"""

# ╔═╡ 54fcc4f2-8a5c-4436-9e83-a8735b7f58c7
add(3, 4)

# ╔═╡ d173543a-b38e-4f8c-8335-be7991ed9384
md"""
Functions are useful because they allow you to organize your code into reusable, modular pieces, making it easier to read, write, and maintain. You can also pass functions as arguments to other functions, or return them as values.
"""

# ╔═╡ 6ff63098-4dc1-4ccf-8293-65a0c368b76b
md"""
## Different forms of functions in Julia

### Long form

Julia has several ways to define and write functions. The most common one is the long form that we saw above, using the `function` and `end` keywords. This form is good for writing complex or multi-line functions.

Just for reference, here is the definition again:

```julia
function add(x, y)
    return x + y
end
```

### Short form

Another way to write functions is the short form, using the = sign and a single expression. This form is good for writing simple or one-line functions. For example, you can write the add function like this:

```julia
add(x, y) = x + y
```

### Anonymous functions

A third way to write functions is using anonymous functions, which are functions without a name. You can create an anonymous function using either the `->` syntax or the `function` syntax. For example, you can create an anonymous function that squares a number like this:

```julia
x -> x^2 # using ->
function (x) x^2 end # using function
```

!!! note
	The first syntax is usually prefered (using `->`)

Or an anonymous function that adds two numbers like before:

```julia
(x,y) -> x + y
```

!!! note
	When several arguments are needed, we pass them as a tuple (`(x,y) ->`)

Anonymous functions are useful for passing them to other functions that take functions as arguments, such as map or filter. They also are extensively used for manipulating `DataFrames`.

For example, you can use an anonymous function to square each element of an array like this:
"""

# ╔═╡ e390f2f4-4d4e-4a5f-8575-91515292d3b8
map(x -> x^2, [1, 2, 3])

# ╔═╡ 6279f4cc-bf84-4134-8f44-2d62e788ece7
md"""
## Passing arguments to functions

Arguments are the values that you pass to a function when you call it. They are used to provide data or information to the function. Julia has several ways to pass arguments to functions, depending on how you want to specify them or how the function expects them.

The simplest way to pass arguments is by position, meaning that the order of the arguments matters. For example, in the add function above, the first argument x is added to the second argument y. If you swap the order of the arguments, you will get the same result, because addition is commutative:
"""

# ╔═╡ aab17c20-1776-4d62-b7b9-3207c01f6d9e
add(3, 4)

# ╔═╡ b326301a-a583-4fb3-841c-7006823504a7
add(4, 3)

# ╔═╡ 1b896503-65da-4e97-8435-410b13c70a93
md"""
However, if you have a function that subtracts two numbers, then the order of the arguments matters:
"""

# ╔═╡ adf9fda2-5861-4493-9930-c2fc3b5e6e30
sub(x, y) = x - y

# ╔═╡ e4a36799-b541-4b12-944c-9aa54b650464
sub(3, 4)

# ╔═╡ 5ca2cef4-2bba-49a2-bdbb-e80cce15818f
sub(4, 3)

# ╔═╡ e5533a5f-5d9b-43f4-b62b-e1e33e36da0b
md"""
Another way to pass arguments is by keyword, meaning that you use the argument name followed by an equal sign and the value. This way, the order of the arguments does not matter, and you can also omit some arguments if they have default values. For example, you can write a function that prints a message with a given prefix and suffix like this:
"""

# ╔═╡ 47b2a851-16ec-4c38-b92f-9642b83fd74b
function print_message(message; prefix="Hello", suffix="!")
    println(prefix * " " * message * suffix)
end

# ╔═╡ e147f529-cc7f-4a40-9656-7e479b16ff28
md"""
This function has one positional argument message and two keyword arguments prefix and suffix. The keyword arguments have default values of “Hello” and “!”. You can call this function with different combinations of arguments like this:
"""

# ╔═╡ 112a89b4-0c95-46b0-a22b-f13a529c854c
print_message("World") # prints "Hello World!"

# ╔═╡ 0ae785fb-59b8-4ca7-ab1e-af245be8091b
print_message("World", prefix="Hi") # prints "Hi World!"

# ╔═╡ ca7e061c-c7ab-472f-a2bf-c89278d3a1dd
print_message("World", suffix="?", prefix="How are") # prints "How are World?"

# ╔═╡ 20923c7f-5ea6-4e76-877d-ba5f55a64952
md"""
Notice that you can omit the semicolon when calling a function with keyword arguments, but it is required when passing varargs or computed keywords as we will see later.

A third way to pass arguments is by using optional arguments, which are positional arguments that have default values. You can write optional arguments after regular positional arguments in a function definition. For example, you can write a function that raises a number x to a power p like this:
"""

# ╔═╡ b9e08325-de97-46e3-be81-34d81b0e98e7
function power(x, p=2)
    return x^p
end

# ╔═╡ b0ac50a7-402c-45de-83e0-229e7cce19c7
md"""
This function has one positional argument x and one optional argument p. The optional argument has a default value of 2. You can call this function with either one or two arguments like this:
"""

# ╔═╡ fef62218-d8a1-404e-8962-f89f25d10db1
power(3)

# ╔═╡ 098263a1-169d-4267-9d31-fb8e87ae5d75
power(3, 3)

# ╔═╡ 8b88d2c5-9c25-4ce8-a9e2-ff1212e82a7b
md"""
Optional arguments are useful for providing sensible default values for function arguments, so that you don’t have to pass them every time. However, they are not the same as keyword arguments, because you cannot specify them by name, and you have to pass them in order.
"""

# ╔═╡ a81891c1-2985-4936-932a-0aaa6732ef0e
md"""
## Advanced function topics

In this section, we will cover some more advanced topics related to functions in Julia, such as varargs, argument scope, function composition, piping, and dot syntax.

Varargs are a way to write functions that can take an arbitrary number of arguments. You can write a varargs function by using the … syntax after the last positional argument. For example, you can write a function that sums any number of numbers like this:
"""

# ╔═╡ 1933ed3f-169a-4f58-ab71-a75a1f103122
function sum_all(x...)
    s = 0
    for a in x
        s += a
    end
    return s
end

# ╔═╡ 9090903d-dc84-4190-92ee-eff5f6d30fe6
md"""
This function has one varargs argument x, which is bound to a tuple of all the values passed to the function. You can iterate over this tuple using a for loop, and add each element to a variable s. You can call this function with any number of arguments like this:
"""

# ╔═╡ c1a5a581-bc5c-41d4-a5d9-085b253e4d7d
sum_all(1, 2, 3)

# ╔═╡ ec26788c-caf8-429d-b3b4-a238f0d61763
sum_all(1, 2, 3, 4, 5)

# ╔═╡ f84995c7-eb7e-4775-b156-99dd8a647b74
sum_all()

# ╔═╡ 7b3c326a-95ed-44db-9c0e-cb769954bc26
md"""
Varargs are useful for writing functions that can handle variable or unknown numbers of arguments, such as print or println.

Argument scope is the region of code where an argument name is visible and can be used. In Julia, arguments are local to the function body, meaning that they are not visible outside the function definition, and they can shadow variables with the same name in the outer scope. For example:
"""

# ╔═╡ 44abe57e-e71c-4dd3-a8db-d798e7774517
x = 1 # global variable

# ╔═╡ 3e83306b-d499-46e7-91b1-126acdc6b962
function f(x) # local argument
    return x + 1
end

# ╔═╡ 8c3bd2f8-e60c-4e9f-acdc-a4924da2f4e1
function g()
    x = 2 # local variable
    return f(x) # calls f with local x
end

# ╔═╡ b9c195a6-22e7-432f-8e88-af415eeb5235
f(x) # returns 2, using global x

# ╔═╡ 4612c638-756f-487a-92f5-1770922d984a
g() # returns 3, using local x

# ╔═╡ 601cbb1d-4aaa-4486-a149-09a390765b75
md"""
In this example, there are three different variables named x: a global one, a local one in g, and an argument one in f. They do not interfere with each other, and each function uses its own x.

Function composition is when you combine functions together and apply the resulting composition to arguments. You use the function composition operator (∘) to compose the functions, so (f ∘ g)(args…) is the same as f(g(args…)). For example, you can compose the sqrt and + functions like this:
"""

# ╔═╡ c640d9d6-929d-441e-bf99-9191e10ae48a
(sqrt ∘ +)(3, 4) # returns sqrt(3 + 4) = sqrt(7)

# ╔═╡ f7857f67-4079-42e7-9054-bdae02a71c1f
md"""
This adds the numbers first, then finds the square root of the result. Function composition is useful for creating new functions from existing ones without having to write them explicitly.

Piping is when you apply a function to the previous function’s output. You use the pipe operator (|>) to pipe the functions together, so x |> f |> g is the same as g(f(x)). For example, you can pipe the + and sqrt functions like this:
"""

# ╔═╡ 0ce4dd31-aa65-4c82-b773-ecb3e7b58e9d
3 |> x -> x + 4 |> sqrt # returns sqrt(3 + 4) = sqrt(7)

# ╔═╡ 2c5cf5f8-ded4-43e0-b17b-399578e866db
md"""
This adds 4 to 3 first, then finds the square root of the result. Piping is useful for writing code in a clear and readable way, especially when using anonymous functions.

Dot syntax is when you apply a function elementwise to an array or a collection. You use the dot operator (.) to indicate that the function should be broadcasted over the elements of the array or collection. For example, you can apply the sin function to each element of an array like this:
"""

# ╔═╡ 5fc7eea2-caf9-415f-b4b5-c19e9df1aff2
A = [1.0, 2.0, 3.0]

# ╔═╡ e9bf1ced-7157-4610-ae02-23d4030e978e
sin.(A) # returns [sin(1.0), sin(2.0), sin(3.0)]

# ╔═╡ 301d5880-928c-4169-abb6-2a5ef5a14703
md"""
Dot syntax is useful for performing vectorized operations on arrays or collections without having to write loops or map calls.
"""

# ╔═╡ 0caffce9-e7a5-42a7-b49d-125d857cebfd
md"""
## Conclusion

That’s it for this tutorial on functions in Julia! We’ve learned what functions are, why they’re important, and how to use them. I hope you found this tutorial helpful and informative. Thanks for watching!
"""

# ╔═╡ Cell order:
# ╟─4c91d9b1-98cb-427c-9a41-030000e9718a
# ╟─23ed4932-edaa-11ed-0d5e-73ae08d92ceb
# ╟─55f6ec9f-bdd3-46bd-9703-2e1719d02227
# ╟─b62c989d-2ac0-4ea9-b9a3-d4dabb0c0b8f
# ╟─d6e103e0-5cb1-4799-8c7d-5f372786b9a2
# ╠═8e5ccbc8-6d9f-4332-9ab9-087bf4b8e022
# ╟─63378618-e25c-4682-aa3e-5eb9abe33ede
# ╠═54fcc4f2-8a5c-4436-9e83-a8735b7f58c7
# ╟─d173543a-b38e-4f8c-8335-be7991ed9384
# ╟─6ff63098-4dc1-4ccf-8293-65a0c368b76b
# ╠═e390f2f4-4d4e-4a5f-8575-91515292d3b8
# ╟─6279f4cc-bf84-4134-8f44-2d62e788ece7
# ╠═aab17c20-1776-4d62-b7b9-3207c01f6d9e
# ╠═b326301a-a583-4fb3-841c-7006823504a7
# ╟─1b896503-65da-4e97-8435-410b13c70a93
# ╠═adf9fda2-5861-4493-9930-c2fc3b5e6e30
# ╠═e4a36799-b541-4b12-944c-9aa54b650464
# ╠═5ca2cef4-2bba-49a2-bdbb-e80cce15818f
# ╟─e5533a5f-5d9b-43f4-b62b-e1e33e36da0b
# ╠═47b2a851-16ec-4c38-b92f-9642b83fd74b
# ╟─e147f529-cc7f-4a40-9656-7e479b16ff28
# ╠═112a89b4-0c95-46b0-a22b-f13a529c854c
# ╠═0ae785fb-59b8-4ca7-ab1e-af245be8091b
# ╠═ca7e061c-c7ab-472f-a2bf-c89278d3a1dd
# ╟─20923c7f-5ea6-4e76-877d-ba5f55a64952
# ╠═b9e08325-de97-46e3-be81-34d81b0e98e7
# ╟─b0ac50a7-402c-45de-83e0-229e7cce19c7
# ╠═fef62218-d8a1-404e-8962-f89f25d10db1
# ╠═098263a1-169d-4267-9d31-fb8e87ae5d75
# ╟─8b88d2c5-9c25-4ce8-a9e2-ff1212e82a7b
# ╟─a81891c1-2985-4936-932a-0aaa6732ef0e
# ╠═1933ed3f-169a-4f58-ab71-a75a1f103122
# ╟─9090903d-dc84-4190-92ee-eff5f6d30fe6
# ╠═c1a5a581-bc5c-41d4-a5d9-085b253e4d7d
# ╠═ec26788c-caf8-429d-b3b4-a238f0d61763
# ╠═f84995c7-eb7e-4775-b156-99dd8a647b74
# ╟─7b3c326a-95ed-44db-9c0e-cb769954bc26
# ╠═44abe57e-e71c-4dd3-a8db-d798e7774517
# ╠═3e83306b-d499-46e7-91b1-126acdc6b962
# ╠═8c3bd2f8-e60c-4e9f-acdc-a4924da2f4e1
# ╠═b9c195a6-22e7-432f-8e88-af415eeb5235
# ╠═4612c638-756f-487a-92f5-1770922d984a
# ╟─601cbb1d-4aaa-4486-a149-09a390765b75
# ╠═c640d9d6-929d-441e-bf99-9191e10ae48a
# ╟─f7857f67-4079-42e7-9054-bdae02a71c1f
# ╠═0ce4dd31-aa65-4c82-b773-ecb3e7b58e9d
# ╟─2c5cf5f8-ded4-43e0-b17b-399578e866db
# ╠═5fc7eea2-caf9-415f-b4b5-c19e9df1aff2
# ╠═e9bf1ced-7157-4610-ae02-23d4030e978e
# ╟─301d5880-928c-4169-abb6-2a5ef5a14703
# ╟─0caffce9-e7a5-42a7-b49d-125d857cebfd
