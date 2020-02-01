"""
`XFloats.jl` -- fast 32-bit and 16-bit floats with extended accuracy.

Two types are exported:
- `XFloat32`. 32-bit floating point type with eXtended computational accuracy.
- `XFloat16`. 16-bit floating point type with eXtended computational accuracy.
"""
module XFloats

export XFloat32, XFloat16

using Random
using LinearAlgebra
using SpecialFunctions

## ================================================================================ ##


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

XFloat32(x::XFloat16) = reinterpret(XFloat32, Float64(reinterpret(Float32,x)))
XFloat16(x::XFloat32) = reinterpret(XFloat16, Float32(reinterpret(Float64,x)))

XFloat32(x::Float64) = reinterpret(XFloat32, x)
XFloat32(x::Float32) = reinterpret(XFloat32, Float64(x))
XFloat32(x::Float16) = reinterpret(XFloat32, Float64(x))
XFloat32(x::Integer) = reinterpret(XFloat32, Float64(Float32(x)))
XFloat32(x::Real) = XFloat32(Float64(x))

XFloat16(x::Float64) = reinterpret(XFloat16, Float32(x))
XFloat16(x::Float32) = reinterpret(XFloat16, x)
XFloat16(x::Float16) = reinterpret(XFloat16, Float32(x))
XFloat16(x::Integer) = reinterpret(XFloat16, Float32(Float16(x)))
XFloat16(x::Real) = XFloat16(Float32(x))



include("type/construct.jl")
include("type/promote_convert.jl")
include("type/representations.jl")

include("imports.jl")
include("dispatch/specialize.jl")
include("dispatch/linearalgebra.jl")

end # module XFloats
