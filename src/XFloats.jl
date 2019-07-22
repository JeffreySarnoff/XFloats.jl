module XFloats

export XFloat16, XFloat32

primitive type XFloat16 <: AbstractFloat 32 end
primitive type XFloat32 <: AbstractFloat 64 end

Float32(x::XFloat16) = reinterpret(Float32, x)
Float64(x::XFloat32) = reinterpret(Float64, x)

XFloat16(x::Float32) = reinterpret(XFloat16, x)
XFloat32(x::Float64) = reinterpret(XFloat32, x)

XFloat16(x::Float16) = reinterpret(XFloat16, Float32(x))
XFloat16(x::Float64) = reinterpret(XFloat16, Float32(x))

Float16(x::Float16) = reinterpret(XFloat16, Float32(x))
Float16(x::Float64) = reinterpret(XFloat16, Float32(x))


Base.convert(::Type{XFloat32}, x::Float16)  = reinterpret(XFloat32, Float64(x))
Base.convert(::Type{XFloat32}, x::Float32)  = reinterpret(XFloat32, Float64(x))
Base.convert(::Type{XFloat32}, x::Float64)  = reinterpret(XFloat32, x)
Base.convert(::Type{XFloat32}, x::BigFloat) = reinterpret(XFloat32, Float64(x))
Base.convert(::Type{XFloat16}, x::Float16)  = reinterpret(XFloat16, Float32(x))
Base.convert(::Type{XFloat16}, x::Float32)  = reinterpret(XFloat16, x)
Base.convert(::Type{XFloat16}, x::Float64)  = reinterpret(XFloat16, Float32(x))
Base.convert(::Type{XFloat16}, x::BigFloat) = reinterpret(XFloat16, Float32(x))

Base.convert(::Type{Float64}, x::XFloat32) = reinterpret(Float64, x)
Base.convert(::Type{Float64}, x::XFloat16) = Float64(reinterpret(Float32, x))
Base.convert(::Type{Float32}, x::XFloat32) = Float32(reinterpret(Float64, x))
Base.convert(::Type{Float32}, x::XFloat16) = reinterpret(Float32, x)
Base.convert(::Type{Float16}, x::XFloat32) = Float16(reinterpret(Float64, x))
Base.convert(::Type{Float16}, x::XFloat16) = Float16(reinterpret(Float32, x))
Base.convert(::Type{BigFloat}, x::XFloat32) = BigFloat(reinterpret(Float64, x))
Base.convert(::Type{BigFloat}, x::XFloat16) = BigFloat(reinterpret(Float32, x))


Base.promote_rule(::Type{Float32}, ::Type{XFloat16}) = XFloat16
Base.promote_rule(::Type{Float64}, ::Type{XFloat32}) = XFloat32

Base.promote_rule(::Type{Float16}, ::Type{XFloat16}) = XFloat16
Base.promote_rule(::Type{Float16}, ::Type{XFloat32}) = XFloat32
Base.promote_rule(::Type{Float32}, ::Type{XFloat32}) = XFloat32

Base.promote_rule(::Type{Float32}, ::Type{XFloat16}) = Float32
Base.promote_rule(::Type{Float64}, ::Type{XFloat16}) = Float64
Base.promote_rule(::Type{Float64}, ::Type{XFloat32}) = Float64



end # module XFloats
