module XFloats

export XFloat16, XFloat32

import Base: hash, promote_rule, convert,
    string, show, tryparse,
    Float16, Float32, Float64, BigFloat,
    UInt8, UInt16, UInt32, UInt64, UInt128,
    Int8, Int16, Int32, Int64, Int128, BigInt

import Base: precision, exponent_mask, significand_mask, eps, exponent, significand,
    zero, one, floatmax, floatmin, nextfloat, prevfloat, frexp, ldexp, modf, decompose,
    ==, <, <=, >=, >, !=, isless, isequal, cmp,
    iszero, isone, isfinite, isinteger, isinf, isnan, issubnormal,
    signbit, sign, flipsign, copysign,
    +, -, *, /, \, abs, inv, sqrt, cbrt,
    mod, mod1, rem, fld, fld1, div, cld, fldmod, fldmod1, divrem,
    ceil, floor, trunc, round,
    muladd, fma, hypot, clamp,
    sum, prod, cumsum

import Base.Math: log, log1p, log10, log2, exp, expm1, exp10, exp2,
    sin, cos, tan, csc, sec, cot, sinpi, cospi,
    sincos,
    asin, acos, atan, acsc, asec, acot,
    sinh, cosh, tanh, csch, sech, coth,
    asinh, acosh, atanh, acsch, asech, acoth

using LinearAlgebra
import LinearAlgebra: norm, normalize, dot,
    *, det, tr, inv, lu, qr, factorize,
    svdvals, eigvals, eigvecs

using Random

## ================================================================================ ##

primitive type XFloat16 <: AbstractFloat 32 end
primitive type XFloat32 <: AbstractFloat 64 end

XFloat16(x::XFloat16) = x
XFloat16(x::XFloat32) = reinterpret(XFloat16, Float32(reinterpret(Float64, x)))
XFloat32(x::XFloat16) = reinterpret(XFloat32, Float64(reinterpret(Float32, x)))
XFloat32(x::XFloat32) = x

include("type/construct.jl")
include("type/promote_convert.jl")

## ================================================================================ ##

const UnaryOps_notoftype = (
    :precision, :exponent_mask, :signficand_mask, :exponent, :significand, :signbit,
    :iszero, :isone, :isfinite, :isinf, :isnan, :issubnormal, :isinteger
)

const UnaryOps_oftype = (
    :zero, :one, :ceil, :floor, :trunc, :round,
    :(+), :(-), :sign, :abs, :inv, :sqrt, :cbrt, 
    :log, :log1p, :log2, :log10, :exp, :expm1, :exp2, :exp10,
    :sin, :cos, :tan, :csc, :sec, :cot, :sinpi, :cospi,
    :sincos,
    :asin, :acos, :atan, :acsc, :asec, :acot,
    :sinh, :cosh, :tanh, :csch, :sech, :coth,
    :asinh, :acosh, :atanh, :acsch, :asech, :acoth
)

const BinaryOps_oftype = (
    :(+), :(-), :(*), :(/), :(\), :hypot, :flipsign, :copysign,
    :mod, :mod1, :fld, :fld1, :div, :rem, :cld
)

const BinaryOps_notoftype = (
    :(<), :(<=), :(>=), :(>), :(!=), :(==), :isless, :isequal, :cmp
)

const TrinaryOps_oftype = (
    :clamp, :muladd, :fma
)

const UnaryVectorOps_oftype = (
    :norm, :sum, :prod, :normalize
)

const BinaryVectorOps_oftype = (
    :dot,
)

const UnaryMatrixOps_oftype = (
    :det, :tr, :inv,
    :sqrt, :cbrt,
    :log, :log1p, :log2, :log10, :exp, :expm1, :exp2, :exp10,
    :sin, :cos, :tan, :csc, :sec, :cot, :sinpi, :cospi,
    :sincos,
    :asin, :acos, :atan, :acsc, :asec, :acot,
    :sinh, :cosh, :tanh, :csch, :sech, :coth,
    :asinh, :acosh, :atanh, :acsch, :asech, :acoth
)

const BinaryMatrixOps_oftype = (
    :(*), :(\), :(/)
)

const MatrixToVectorOps_oftype = (
    :eigvals, :svdvals
)

const MatrixToMatrixOps_oftype = (
    :eigvecs,
)

const MatrixOperations = (
    :lu, :qr, :factorize,
)

#  ================================================================================  #

for (XT, FT) in ((:XFloat16, :Float32), (:XFloat32, :Float64))
  for Op in UnaryOps_notoftype
    @eval $Op(x::$XT) = $Op(reinterpret($FT, x))
  end
  for Op in BinaryOps_notoftype
    @eval $Op(x::$XT, y::$XT) = $Op(reinterpret($FT, x), reinterpret($FT, y))
  end
  for Op in UnaryOps_oftype
    @eval $Op(x::$XT) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in BinaryOps_oftype
    @eval $Op(x::$XT, y::$XT) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y)))
  end
  for Op in TrinaryOps_oftype
    @eval $Op(x::$XT, y::$XT, z::$XT) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y), reinterpret($FT, z)))
  end

  for Op in UnaryVectorOps_oftype
    @eval $Op(x::Vector{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in BinaryVectorOps_oftype
    @eval $Op(x::Vector{$XT}, y::Vector{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y)))
  end
  for Op in UnaryMatrixOps_oftype
    @eval $Op(x::Matrix{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in BinaryMatrixOps_oftype
    @eval $Op(x::Matrix{$XT}, y::Matrix{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y)))
  end

  for Op in MatrixToVectorOps_oftype
    @eval $Op(x::Matrix{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in MatrixToMatrixOps_oftype
    @eval $Op(x::Matrix{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
    
  inv(x::Array{XFloat16, N}) where {N} =
      reinterpret(XFloat16, inv(reinterpret(Float32, x)))
  inv(x::Array{XFloat32, N}) where {N} =
      reinterpret(XFloat32, inv(reinterpret(Float64, x)))

  dot(x::Array{XFloat16, N}, y::Array{XFloat16, N}) where {N} =
      reinterpret(XFloat16, dot(reinterpret(Float32, x), reinterpret(Float32, y)))
  dot(x::Array{XFloat32, N}, y::Array{XFloat32, N}) where {N} =
      reinterpret(XFloat32, dot(reinterpret(Float64, x), reinterpret(Float64, y)))

  :(+)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(*)(reinterpret(Float32,x), reinterpret(Float32,y)))
  :(+)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(*)(reinterpret(Float64,x), reinterpret(Float64,y)))
  :(-)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(*)(reinterpret(Float32,x), reinterpret(Float32,y)))
  :(-)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(*)(reinterpret(Float64,x), reinterpret(Float64,y)))
  :(*)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(*)(reinterpret(Float32,x), reinterpret(Float32,y)))
  :(*)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(*)(reinterpret(Float64,x), reinterpret(Float64,y)))
  :(\)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(\)(reinterpret(Float32,x), reinterpret(Float32,y)))
  :(\)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(\)(reinterpret(Float64,x), reinterpret(Float64,y)))
  :(/)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(/)(reinterpret(Float32,x), reinterpret(Float32,y)))
  :(/)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(/)(reinterpret(Float64,x), reinterpret(Float64,y)))
end

#  ================================================================================  #


## ================================================================================ ##


## ================================================================================ ##


end # module XFloats
