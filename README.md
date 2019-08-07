# XFloats.jl

#### __XFloat32__, __XFloat16__  Augmented Accuracy, Performant Precision

####  Augmented Accuracy, Performant Precision: __XFloat32__, __XFloat16__ 


####  _XFloat32_  augmented accuracy: 

####  _XFloat16_  performant precision 


#####  _XFloat32_  augmented accuracy: 

#####  _XFloat16_  performant precision 


###  _XFloat32_  augmented accuracy: 

###  _XFloat16_  performant precision 



####  augmented accuracy: __XFloat32__

####   performant precision: __XFloat16__ 


- exports XFloat32, XFloat16 


### Floats that compute more accuratly just as quickly
augmented accuracy 16bit floats and 32bit floats augmented accuracy 32bit Floats of 16bits and of 32-bt Floatsrationals with unreal performance <sup>[𝓪](#source)</sup>

##### Copyright © 2017-2019 by Jeffrey Sarnoff. This work is released under The MIT License.
----
[![Build Status](https://travis-ci.org/JeffreySarnoff/FastRationals.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/FastRationals.jl)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![codecov](https://codecov.io/gh/JeffreySarnoff/FastRationals.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JeffreySarnoff/FastRationals.jl)

----

#### `FastRationals`

(a) an `XFloat` is a specialized type for precision enhanced floating point values
    - `XFloat16s` are used to store and to retrieve 16 bit floating point values
    - `XFloat32s` are used to store and to retrieve 32 bit floating point values
    
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
