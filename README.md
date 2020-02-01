# XFloats.jl

##### Copyright © 2017-2020 by Jeffrey Sarnoff. This work is released under The MIT License.

`XFloats` exports two these two types: `XFloat16`, `XFloat32`.
- These floating point types correspond to `Float16` and `Float32`.
- Use them to compute results with greater accuracy at very high speed.

     
----



### benchmarks

```
           relative speeds
           X32∝F32  X64∝F64

    add:     1.00    1.08
    mul:     1.08    1.08
    fma:     0.93    1.08


```


###### other extended precison floating point types

- The more accurate type for `Float64` is `Double64` (`DoubleFloats.jl`).
    -  It calculates more slowly than these types do.
    
