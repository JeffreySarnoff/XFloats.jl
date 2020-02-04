"""
`XFloats.jl` -- fast 32-bit and 16-bit floats with extended accuracy.

Two types are exported:
- `XFloat32`. 32-bit floating point type with eXtended computational accuracy.
- `XFloat16`. 16-bit floating point type with eXtended computational accuracy.
"""
module XFloats

export XFloat32, XFloat16

using Printf
using Random
using LinearAlgebra
using SpecialFunctions


"""
    XFloat32 (a float type)

A more accurate alternative to Float32 that works as a Float64.
""" 
primitive type XFloat32 <: AbstractFloat 64 end
XFloat32(x::XFloat32) = x

"""
    XFloat16 (a float type)

A more accurate alternative to Float16 that works as a Float32.
""" 
primitive type XFloat16 <: AbstractFloat 32 end
XFloat16(x::XFloat16) = x

include("type/construct.jl")
include("type/promote_convert.jl")
include("type/representations.jl")

include("imports.jl")
include("dispatch/specialize.jl")
include("dispatch/linearalgebra.jl")

end # module XFloats
