# XFloats.jl

##### Copyright © 2017-2019 by Jeffrey Sarnoff. This work is released under The MIT License.

`XFloats` exports two these two types: `XFloat16`, `XFloat32`.  Use them to compute results that are often more accurate nd still are obtained quickly.  These floating point types correspond to `Float16` and `Float32`.  The more accurate loating point type that corresponds to `Float64` is `Double64` from `DoubleFloats.jl`.  In both relative and absolute easure, `Double64` calculates much more slowly than `Float64`, but more quickly than `Float128` from `Quadmath.jl`.

----



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
