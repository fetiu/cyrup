# `cyrup`

Cyrup that triggers syntactic diabetes.

```rust
main:(stdio){
    stdio.print("hello world")
}
```

## Declaration `:`

There are a few basic rules.
1. `:` is used for all kinds of declaration.
2. expressions after the `:` means data.
3. every data has its own representation.

Example declarations below:

```rust
a:int=1
b:2
c:Int(1)
f:(d:int, e:int){
    -> d + e
}
```

Accesing declared data is the same as the languages we're used to.

- `a = b`  assigns 2 to a variable
- `c.equals(a)` : returns true
- `f(a, b)` : returns a + b = 3


## Conditional `?`

`if` statement is replaced with `?`. 

It's not ternary operator `condition? x : y`. There is only one operand required for `?`, like `condition? x`.

There is no `else` or `:`, use `||` instead. Append "|| y" behind the preceding conditional expression.

```rust
(a > b) ? {
    diff = a - b
} || (a < b) ? {
    diff = b - a
} || {
    diff = 0
}
```

## Product `*`

`while`, `for`, `switch` statements are replaced with `*`.

Don't worry! `*` still is a multiplication.

Let's see some examples first.

```
3 * {
    print("reapeat only 3 times")
}
```

Please regard the product `{}` multiplied by 3 as `{}` copied and called exactly 3 times.

```
{print("reapeat only 3 times")}
{print("reapeat only 3 times")}
{print("reapeat only 3 times")}
```

We can iterate elements of an array by using **distributive property** of expression.

```
elems:=(1,2,3,4)

e:elems * {
    print("%d in elems", e)
}
```

The product above will ditribute `{}` to each elements of `elems`.

```
{print("%d in elems", 1)}
{print("%d in elems", 2)}
{print("%d in elems", 3)}
{print("%d in elems", 4)}
```

By now, you'll get the sense of how the statements below would work.

```
true * {
    print("hello world!")
}

i:(1..10) * {
    print("number %d", i)
}

key == * (
    'w'? => moveUp(),
    'a'? => moveLeft(),
    's'? => moveDown(),
    'd'? => moveRight(),
)
```

- `true * {}` repeats the braces forever, like `while`. (think `true` ~ infinite)
- `i:(1..10) * {}` iterates from 1 to 10, like `for(int i=0; i < 10; i++){}`.
- `key == * ()` matches keys to corresponding function call, like `switch`.

## Storage Class `@`

Type and Class are data, with a notion of "Storage Class" denoted by `@`.

Here is the example of type & class declaration with Storage Class.

```rust
int@type:i32
Int@class:(value:int)[
    data:int = value
    .equals:(value:int)bool{
        ->(data==value)
    }
]
```

Naming conventions will determine whether the field is accessible.

The class example above implicitly defined accessibility of `c:Int` members:

- `c.data` : This is an error, as symbol not defined as `.data`.
- `cdata` : This is regarded as a new variable, not `c`'s member.
- `c.equals(2)` : This is a valid access, like a public method.

In this way, data is capsulized without explicitly notating `public` or `private`.


Storage Classes are also used for designating the data lifetime and scope

```rust
globalString@data:= "string at data segement"
localString@stack:= "string at stack segment"
dynamicString@heap:= "string at heap segment"
```
