## ================================================================================ ##

const UnaryOps = (
    :precision, :exponent_mask, :signficand_mask, :exponent, :significand, :signbit,
    :iszero, :isone, :isfinite, :isinf, :isnan, :issubnormal, :isinteger)

const BinaryOps = (:(<), :(<=), :(>=), :(>), :(!=), :(==), :isless, :isequal, :cmp)

const UnaryOps_oftype = (
    :zero, :one, :ceil, :floor, :trunc, :round,
    :(+), :(-), :sign, :abs, :inv, :sqrt, :cbrt, 
    :log, :log1p, :log2, :log10, :exp, :expm1, :exp2, :exp10,
    :sin, :cos, :tan, :csc, :sec, :cot, :sinpi, :cospi,
    :sincos,
    :asin, :acos, :atan, :acsc, :asec, :acot,
    :sinh, :cosh, :tanh, :csch, :sech, :coth,
    :asinh, :acosh, :atanh, :acsch, :asech, :acoth)

const BinaryOps_oftype = (
    :(+), :(-), :(*), :(/), :(\), :hypot, :flipsign, :copysign,
    :mod, :mod1, :fld, :fld1, :div, :rem, :cld)


const TrinaryOps_oftype = (
    :clamp, :muladd, :fma)

const UnaryVectorOps_oftype = (
    :norm, :sum, :prod, :normalize
)

const UnaryMatrixOps_oftype = (
    :tr,
    :sqrt, :cbrt,
    :log, :log1p, :log2, :log10, :exp, :expm1, :exp2, :exp10,
    :sin, :cos, :tan, :csc, :sec, :cot, :sinpi, :cospi,
    :sincos,
    :asin, :acos, :atan, :acsc, :asec, :acot,
    :sinh, :cosh, :tanh, :csch, :sech, :coth,
    :asinh, :acosh, :atanh, :acsch, :asech, :acoth
)

const MatrixOperations = (
    :lu, :qr, :factorize,
)

#  ================================================================================  #

for (XT, FT) in ((:XFloat16, :Float32), (:XFloat32, :Float64))
  for Op in UnaryOps
    @eval $Op(x::$XT) = $Op(reinterpret($FT, x))
  end
  for Op in BinaryOps
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
  
  for Op in UnaryMatrixOps_oftype
    @eval $Op(x::Matrix{$XT}) = reinterpret($XT, $Op(reinterpret($FT, x)))
  end
    
  
  (+)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(*)(reinterpret(Float32,x), reinterpret(Float32,y)))
  (+)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(*)(reinterpret(Float64,x), reinterpret(Float64,y)))
  (-)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) =
      reinterpret(XFloat16, :(*)(reinterpret(Float32,x), reinterpret(Float32,y)))
  (-)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) =
      reinterpret(XFloat32, :(*)(reinterpret(Float64,x), reinterpret(Float64,y)))
end


Base.:(^)(x::XFloat16, y::XFloat16) = XFloat16(Float32(x)^(Float32(y)))
Base.:(^)(x::XFloat32, y::XFloat32) = XFloat32(Float64(x)^(Float64(y)))
Base.:(^)(x::XFloat16, y::Real) = XFloat16(Float32(x)^(y))
Base.:(^)(x::XFloat32, y::Real) = XFloat32(Float64(x)^(y))
Base.:(^)(x::Real, y::XFloat16) = XFloat16(x^Float32(y))
Base.:(^)(x::Real, y::XFloat32) = XFloat32(x^Float64(y))

Base.:(<)(x::XFloat16, y::Real)  = Float32(x) < y
Base.:(<=)(x::XFloat16, y::Real) = Float32(x) <= y
Base.:(>)(x::XFloat16, y::Real)  = Float32(x) > y
Base.:(>=)(x::XFloat16, y::Real) = Float32(x) >= y
Base.:(==)(x::XFloat16, y::Real) = Float32(x) == y
Base.:(!=)(x::XFloat16, y::Real) = Float32(x) != y

Base.:(<)(x::XFloat32, y::Real)  = Float64(x) < y
Base.:(<=)(x::XFloat32, y::Real) = Float64(x) <= y
Base.:(>)(x::XFloat32, y::Real)  = Float64(x) > y
Base.:(>=)(x::XFloat32, y::Real) = Float64(x) >= y
Base.:(==)(x::XFloat32, y::Real) = Float64(x) == y
Base.:(!=)(x::XFloat32, y::Real) = Float64(x) != y

Base.:(<)(x::Real, y::XFloat16)  = x < Float32(x)
Base.:(<=)(x::Real, y::XFloat16)  = x <= Float32(x)
Base.:(>)(x::Real, y::XFloat16)  = x >= Float32(x)
Base.:(>=)(x::Real, y::XFloat16)  = x >= Float32(x)
Base.:(==)(x::Real, y::XFloat16)  = x == Float32(x)
Base.:(!=)(x::Real, y::XFloat16)  = x != Float32(x)

Base.:(<)(x::Real, y::XFloat32)  = x < Float64(x)
Base.:(<=)(x::Real, y::XFloat32)  = x <= Float64(x)
Base.:(>)(x::Real, y::XFloat32)  = x > Float64(x)
Base.:(>=)(x::Real, y::XFloat32)  = x >= Float64(x)
Base.:(==)(x::Real, y::XFloat32)  = x == Float64(x)
Base.:(!=)(x::Real, y::XFloat32)  = x != Float64(x)

#= conservative

Base.typemin(::Type{XFloat16}) = XFloat16(Base.typemin(Float16))
Base.typemin(::Type{XFloat32}) = XFloat32(Base.typemin(Float32))
Base.typemax(::Type{XFloat16}) = XFloat16(Base.typemax(Float16))
Base.typemax(::Type{XFloat32}) = XFloat32(Base.typemax(Float32))

Base.floatmin(::Type{XFloat16}) = XFloat16(Base.floatmin(Float16))
Base.floatmin(::Type{XFloat32}) = XFloat32(Base.floatmin(Float32))
Base.floatmax(::Type{XFloat16}) = XFloat16(Base.floatmax(Float16))
Base.floatmax(::Type{XFloat32}) = XFloat32(Base.floatmax(Float32))

Base.eps(::Type{XFloat16}) = XFloat16(Base.eps(Float16))
Base.eps(::Type{XFloat32}) = XFloat32(Base.eps(Float32))

Base.round(x::XFloat16, r::RoundingMode{:Up}) = XFloat16(Base.round(Float16(x), RoundUp))
Base.round(x::XFloat16, r::RoundingMode{:Down}) = XFloat16(Base.round(Float16(x), RoundDown))
Base.round(x::XFloat16, r::RoundingMode{:ToZero}) = XFloat16(Base.round(Float16(x), RoundToZero))
Base.round(x::XFloat16, r::RoundingMode{:Nearest}) = XFloat16(Base.round(Float16(x), RoundNearest))

Base.round(x::XFloat32, r::RoundingMode{:Up}) = XFloat32(Base.round(Float32(x), RoundUp))
Base.round(x::XFloat32, r::RoundingMode{:Down}) = XFloat32(Base.round(Float32(x), RoundDown))
Base.round(x::XFloat32, r::RoundingMode{:ToZero}) = XFloat32(Base.round(Float32(x), RoundToZero))
Base.round(x::XFloat32, r::RoundingMode{:Nearest}) = XFloat32(Base.round(Float32(x), RoundNearest))

=#

#= aggressive

Base.typemin(::Type{XFloat16}) = XFloat16(Base.typemin(Float32))
Base.typemin(::Type{XFloat32}) = XFloat32(Base.typemin(Float64))
Base.typemax(::Type{XFloat16}) = XFloat16(Base.typemax(Float32))
Base.typemax(::Type{XFloat32}) = XFloat32(Base.typemax(Float64))

Base.floatmin(::Type{XFloat16}) = XFloat16(Base.floatmin(Float32))
Base.floatmin(::Type{XFloat32}) = XFloat32(Base.floatmin(Float64))
Base.floatmax(::Type{XFloat16}) = XFloat16(Base.floatmax(Float32))
Base.floatmax(::Type{XFloat32}) = XFloat32(Base.floatmax(Float64))

Base.eps(::Type{XFloat16}) = XFloat16(Base.eps(Float32))
Base.eps(::Type{XFloat32}) = XFloat32(Base.eps(Float64))

Base.round(x::XFloat16, r::RoundingMode{:Up}) = XFloat16(Base.round(Float32(x), RoundUp))
Base.round(x::XFloat16, r::RoundingMode{:Down}) = XFloat16(Base.round(Float32(x), RoundDown))
Base.round(x::XFloat16, r::RoundingMode{:ToZero}) = XFloat16(Base.round(Float32(x), RoundToZero))
Base.round(x::XFloat16, r::RoundingMode{:Nearest}) = XFloat16(Base.round(Float32(x), RoundNearest))

Base.round(x::XFloat32, r::RoundingMode{:Up}) = XFloat32(Base.round(Float64(x), RoundUp))
Base.round(x::XFloat32, r::RoundingMode{:Down}) = XFloat32(Base.round(Float64(x), RoundDown))
Base.round(x::XFloat32, r::RoundingMode{:ToZero}) = XFloat32(Base.round(Float64(x), RoundToZero))
Base.round(x::XFloat32, r::RoundingMode{:Nearest}) = XFloat32(Base.round(Float64(x), RoundNearest))

=#
