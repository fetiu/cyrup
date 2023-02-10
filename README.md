# `cyrup`

Cyrup that may trigger syntactic diabetes.

```rust
:stdio
main(){
    printf("hello world")
}
```

All syntaxes are defined with only a few special characters, not even a keyword.

## Declaration `:`

There are a few basic rules.
1. `:` is used for all kinds of declaration.
2. expressions after the `:` means data.
3. every data has its own representation.

Example declarations below:

```rust
a:int=1
b:int=>2
c:Int={1}
f:(d:int, e:int) => d + e
g:(d:int, e:int){
    => d + e
}
```

Using declared data is the same as the other computer languages we're used to.

- `a = b`  assigns 2 to a variable
- `c.equals(a)` : returns true
- `f(a, b)` : returns a + b = 3


## Conditional `?`

`if` statement has been replaced with `?`. 

It's not the ternary operator `condition? x : y`. There is only one operand required after `?`, like `condition? x`.

There is no `else` or `:`. We use `||` instead. Append "|| y" behind the preceding conditional expression. It'll reach there when the condition is false.

```rust
(a > b) ? {
    diff = a - b
} || (a < b) ? {
    diff = b - a
} || {
    diff = 0
}
```

`?` also provide a property to expand namespace.
Codes below will call the `method` only if `instance` is truthy.

```javascript
instance?.method()
instance? {
    .method()
}
```

Using this property, `switch` statement can be expressed as:

```rust
key? {
    == 'w'? => moveUp()
    == 'a'? => moveLeft()
    == 's'? => moveDown()
    == 'd'? => moveRight()
}
```

## Product `*`

`while`, `for` statements have been replaced with `*`.

It may seem quite new, but `*` still is a multiplication. Let's see some examples first.

```rust
3 * {
    print("reapeat only 3 times")
}
```

Please regard the product `{}` multiplied by `3` as a "statment copied and called exactly 3 times".

```rust
{print("reapeat only 3 times")}
{print("reapeat only 3 times")}
{print("reapeat only 3 times")}
```

This looks inefficient, but let the compilers find an optimal way to run this code.

<br> 

We can iterate elements of an array by using **distributive property** of expressions.

```rust
elems:={1,2,3,4}

(e:elems) * {
    print("%d in elems", e)
}
```

The product above will ditribute `{}` to each elements of `elems`.

```rust
{print("%d in elems", 1)}
{print("%d in elems", 2)}
{print("%d in elems", 3)}
{print("%d in elems", 4)}
```

By now, I believe you can get the sense of how the statements below would work.

```rust
true * {
    print("hello world!")
}

(i:1~10) * {
    print("number %d", i)
}
```

- `true * {}` repeats forever, like `while`. (think `true` is equivalent to infinite)
- `(i:1~10) * {}` iterates from 1 to 10, like `for(i = 0; i < 10; i++){}`.

**_(WIP below)_**

## Storage Class `@`

Type and Class are data, with a notion of *Storage Class* denoted by `@`.

Here is the example of type & class declaration with Storage Class.

```rust
int@type:i32
Int@class:(
    data:int
    .equals:(value:int)bool{
        => (data==value)
    }
)
```

Naming conventions will determine whether the field is accessible.

The class example above implicitly defined accessibility of `c:Int` members:

- `c.data` : This is an error, as symbol not defined as `.data`.
- `cdata` : This is regarded as a new variable, not `c`'s member.
- `c.equals(2)` : This is a valid access, like a public method.

In this way, data is capsulized without explicitly notating `public` or `private`.


Storage Classes are also used for designating the data lifetime and scope

```rust
globalString@data := "string at data segement"
localString@stack := "string at stack segment"
dynamicString@heap:= "string at heap segment"
```
