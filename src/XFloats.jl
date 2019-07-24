module XFloats

export XFloat16, XFloat32

using LinearAlgebra
using Random
using SpecialFunctions

## ================================================================================ ##

primitive type XFloat16 <: AbstractFloat 32 end
primitive type XFloat32 <: AbstractFloat 64 end

XFloat16(x::XFloat16) = x
XFloat16(x::XFloat32) = reinterpret(XFloat16, Float32(reinterpret(Float64, x)))
XFloat32(x::XFloat16) = reinterpret(XFloat32, Float64(reinterpret(Float32, x)))
XFloat32(x::XFloat32) = x

include("type/construct.jl")
include("type/promote_convert.jl")
include("type/representions.jl")

include("specialize/imports.jl")
include("specialize/reinterpret.jl")

end # module XFloats
