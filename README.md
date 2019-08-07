# XFloats.jl

##### Copyright © 2017-2019 by Jeffrey Sarnoff. This work is released under The MIT License.

`XFloats` exports two these two types: `XFloat16`, `XFloat32`.  Use them to compute results that are often more accurate
and still are obtained quickly.  These floating point types correspond to `Float16` and `Float32`.  The more accurate
floating point type that corresponds to `Float64` is `Double64` from `DoubleFloats.jl`.  In both relative and absolute
measure, `Double64` calculates much more slowly than `Float64`, but more quickly than `Float128` from `Quadmath.jl`.


that type calculates much
more slowlywhich is found in another package `DoubleFloats`.

For increased
accuracy work with values
are While using `Double64` 

with similar throughput.  do not require comparable remain perfwith little and require nearly as quickly
and usually more accurately than with little that are often
more accurate at least as accuratemore accurately than at near systemas floats more accurate `Float16` and `XFloat32` is used with `Float32`.
corresponds to `Float16`  accurate and performant float types:ing point types extended There are two types of `XFloat`.

    - XFloat16
    - XFloat32


##### _ XFloat are floating point values o_e___X__traccurate

(a) an `XFloat` is a specialized type for precision enhanced floating point values
    These `eXraaccurateFloat`
    - `XFloat16` stores, carries, applies, recieves and retrieves 16 bit floating point values
    - `XFloat32` stores, carries, applies, recieves and retrieves 32 bit floating point values
    
(b) an `XFloat` travels when stored in an xkit

is stored for travel in an xkit) kind of floating point there are two
-- values of type `XFloat16` or of type `XFloat32`
- `XFloats` perform arithemtic just as fast as do the corresponding system floating point types.
the systare just as fast the system floats 
`XFloats` come in two sizes: 16-bit and 32-bit.  There is no 64-bit XFloat type.There are two XFloat Types: `XFloat16` and `XFloat32`
XFloats compute at greater precision than Floats (more significant bits) more accurate, very fast 
Precision-doubled floating point types almost as fast as the system floats Float32, Float64,.
for high-performance with 99% of the performace of hardware floats.





### benchmarks

```
        relative speeds
          (32)   (64)    (mixed)

add:     1.0     1.08    1.07
mul:     1.08    1.08    1.07
arith:   0.87    1.07    1.07
fma:     0.93    1.08    1.42
muladd:  1.29    0.94    1.07

```
