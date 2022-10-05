# `c:`
C-like language with some colon magics :)

```rust
main:(stdio)
{
    stdio.printf("hello world")
}
```

There are a few basic rules.
1. use `:` sign for all kinds of assingments.
2. expressions after the `:` means data.
3. every data has it's own representation.

```rust
a:int=1
b:1
c:Int(1)
swap:(a:int,b:int){a, b = b, a}
```

Type and Class are data, with a notion of `storage class`

```rust
int@type:i32
Int@class:(value:int)[
    data:int = value
    .equals:(value:int) -> (data == value)
]
```

Name will implicitly determine whether the field is accessible.
The class example above naturally defined accessibility of members.

```
num:Int(1)
num.data # This is error, as symbol not defined as `.data`
numdata # This is regarded as but a new variable, not `a's member, 
num.equals(2) # This is valid
```


Storage class is also used for designating the data lifetime and scope

```rust
globalString@data="string at data segement"
localString@stack="string at stack segment"
dynamicString@heap="string at heap segment"
```
