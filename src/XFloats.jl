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

import LinearAlgebra: norm, normalize, dot,
    *, det, tr, inv, lu, qr, factorize,
    svdvals, eigvals, eigvecs

using Random

primitive type XFloat16 <: AbstractFloat 32 end
primitive type XFloat32 <: AbstractFloat 64 end

XFloat16(x::XFloat16) = x
XFloat32(x::XFloat32) = x
XFloat32(x::XFloat16) = reinterpret(XFloat32, Float64(reinterpret(Float32, x)))
XFloat16(x::XFloat32) = reinterpret(XFloat16, Float32(reinterpret(Float64, x)))

XFloat16(x::Float16)  = reinterpret(XFloat16, Float32(x))
XFloat16(x::Float32)  = reinterpret(XFloat16, x)
XFloat16(x::Float64)  = reinterpret(XFloat16, Float32(x))
XFloat16(x::BigFloat) = reinterpret(XFloat16, Float32(x))

XFloat32(x::Float16)  = reinterpret(XFloat32, Float64(x))
XFloat32(x::Float32)  = reinterpret(XFloat32, Float64(x))
XFloat32(x::Float64)  = reinterpret(XFloat32, x)
XFloat32(x::BigFloat) = reinterpret(XFloat32, Float64(x))

Float16(x::XFloat16)  = Float16(reinterpret(Float32, x))
Float32(x::XFloat16)  = reinterpret(Float32, x)
Float64(x::XFloat16)  = Float64(reinterpret(Float32, x))
BigFloat(x::XFloat16) = BigFloat(reinterpret(Float32, x))

Float16(x::XFloat32)  = Float16(reinterpret(Float64, x))
Float32(x::XFloat32)  = Float32(reinterpret(Float64, x))
Float64(x::XFloat32)  = reinterpret(Float64, x)
BigFloat(x::XFloat32) = BigFloat(reinterpret(Float64, x))

for T in (:Int8, :Int16, :Int32, :Int64, :Int128, :BigInt,
          :UInt8, :UInt16, :UInt32, :UInt64, :UInt128)
  @eval begin
    XFloat16(x::$T) = reinterpret(XFloat16, Float32(x))
    XFloat32(x::$T) = reinterpret(XFloat32, Float64(x))
    $T(x::XFloat16) = $T(reinterpret(Float32,x))
    $T(x::XFloat32) = $T(reinterpret(Float64,x))
  end
end

promote_rule(::Type{XFloat16}, ::Type{XFloat32}) = XFloat32
convert(::Type{XFloat32}, x::XFloat16) = reinterpret(XFloat32, Float64(reinterpret(Float32, x)))
convert(::Type{XFloat16}, x::XFloat32) = reinterpret(XFloat16, Float32(reinterpret(Float64, x)))

promote_rule(::Type{Float16}, ::Type{XFloat16})  = XFloat16
promote_rule(::Type{Float16}, ::Type{XFloat32})  = XFloat32
promote_rule(::Type{Float32}, ::Type{XFloat16})  = Float32
promote_rule(::Type{Float32}, ::Type{XFloat32})  = XFloat32
promote_rule(::Type{Float64}, ::Type{XFloat32})  = Float64
promote_rule(::Type{Float64}, ::Type{XFloat16})  = Float64
promote_rule(::Type{Float64}, ::Type{XFloat32})  = Float64
promote_rule(::Type{BigFloat}, ::Type{XFloat16}) = BigFloat
promote_rule(::Type{BigFloat}, ::Type{XFloat32}) = BigFloat

convert(::Type{XFloat16}, x::Float16)  = reinterpret(XFloat16, Float32(x))
convert(::Type{XFloat16}, x::Float32)  = reinterpret(XFloat16, x)
convert(::Type{XFloat16}, x::Float64)  = reinterpret(XFloat16, Float32(x))
convert(::Type{XFloat16}, x::BigFloat) = reinterpret(XFloat16, Float32(x))
convert(::Type{XFloat32}, x::Float16)  = reinterpret(XFloat32, Float64(x))
convert(::Type{XFloat32}, x::Float32)  = reinterpret(XFloat32, Float64(x))
convert(::Type{XFloat32}, x::Float64)  = reinterpret(XFloat32, x)
convert(::Type{XFloat32}, x::BigFloat) = reinterpret(XFloat32, Float64(x))

convert(::Type{Float16}, x::XFloat16) = Float16(reinterpret(Float32, x))
convert(::Type{Float16}, x::XFloat32) = Float16(reinterpret(Float64, x))
convert(::Type{Float32}, x::XFloat16) = reinterpret(Float32, x)
convert(::Type{Float32}, x::XFloat32) = Float32(reinterpret(Float64, x))
convert(::Type{Float64}, x::XFloat16) = Float64(reinterpret(Float32, x))
convert(::Type{Float64}, x::XFloat32) = reinterpret(Float64, x)
convert(::Type{BigFloat}, x::XFloat16) = BigFloat(reinterpret(Float32, x))
convert(::Type{BigFloat}, x::XFloat32) = BigFloat(reinterpret(Float64, x))

for T in (:Int8, :Int16, :Int32, :Int64, :Int128, :BigInt,
          :UInt8, :UInt16, :UInt32, :UInt64, :UInt128)
  @eval begin
    convert(::Type{XFloat16}, x::$T) = XFloat16(Float32(x))
    convert(::Type{XFloat32}, x::$T) = XFloat32(Float64(x))
    convert(::Type{$T}, x::XFloat16) = $T(reinterpret(Float32,x))
    convert(::Type{$T}, x::XFloat32) = $T(reinterpret(Float64,x))
  end
end

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
    @eval $Op(x::$XT) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in BinaryVectorOps_oftype
    @eval $Op(x::$XT, y::$XT) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y)))
  end

  for Op in UnaryMatrixOps_oftype
    @eval $Op(x::$XT) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in BinaryMatrixOps_oftype
    @eval $Op(x::$XT, y::$XT) = reinterpret($XT, $Op(reinterpret($FT, x), reinterpret($FT, y)))
  end

  for Op in MatrixToVectorOps_oftype
    @eval $Op(x::$XT) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
  for Op in MatrixToMatrixOps_oftype
    @eval $Op(x::$XT) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end

            
end

#  ================================================================================  #


## ================================================================================ ##

show(io::IO, x::XFloat16) = print(io, Float16(reinterpret(Float32, x)))
show(io::IO, x::XFloat32) = print(io, Float32(reinterpret(Float64, x)))

hash(x::XFloat16) = hash(reinterpret(Float32, x))
hash(x::XFloat32) = hash(reinterpret(Float64, x))

tryparse(::Type{XFloat16}, x::String) = reinterpret(XFloat16, tryparse(Float32, x))
tryparse(::Type{XFloat32}, x::String) = reinterpret(XFloat32, tryparse(Float64, x))

## ================================================================================ ##


end # module XFloats
