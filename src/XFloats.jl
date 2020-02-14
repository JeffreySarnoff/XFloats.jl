"""
`XFloats.jl` -- 32-bit floats with extended computational accuracy.

exports type `XFloat`
"""
module XFloats

export XFloat

using Printf
using Random
using LinearAlgebra
using SpecialFunctions


"""
    XFloat (a float type)

A more accurate alternative to Float32 that works as a Float64.
""" 
primitive type XFloat <: AbstractFloat 64 end
XFloat(x::XFloat) = x

XFloat(x::Float64) = reinterpret(XFloat, x)
Base.Float64(x::XFloat) = reinterpret(Float64, x)
XFloat(x::Float32) = XFloat(Float64(x))
Base.Float32(x::XFloat) = Float32(Float64(x))
XFloat(x::Float16) = XFloat(Float64(x))
Base.Float16(x::XFloat) = Float16(Float64(x))

include("type/construct.jl")
include("type/promote_convert.jl")
include("type/representations.jl")

include("imports.jl")
include("dispatch/specialize.jl")
include("dispatch/linearalgebra.jl")

end # module XFloats
