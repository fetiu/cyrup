# `c:`
C-like language with some colon magics :)

```rust
main:(stdio){
    stdio.printf("hello world")
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

## Storage Class `@`

Type and Class are data, with a notion of "Storage Class" denoted by `@`

```rust
int@type:i32
Int@class:(value:int)[
    data:int = value
    .equals:(value:int) {
        ->(data==value)
    }
]
```

Name will implicitly determine whether the field is accessible.

The class example above naturally defined accessibility of `num:Int` members:

- `num.data` : This is an error, as symbol not defined as `.data`.
- `numdata` : This is regarded as a new variable, not `a`'s member.
- `num.equals(2)` : This is valid access, like a public method.

Storage Classes are also used for designating the data lifetime and scope

```rust
globalString@data="string at data segement"
localString@stack="string at stack segment"
dynamicString@heap="string at heap segment"
```

## Conditional `?`

`if` statement is replaced with `?`. It's differnt from the ternary operator `condition? x : y`.

There is only one operand required for `?`, like `condition? x`.

There is no `else`, use `||` instead. Append `|| y` behind the expression above.

```rust
(a > b)? {
    diff = a - b
} || (a < b)? {
    diff = b - a
} || {
    diff = 0
}
```
