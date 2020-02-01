for F in (:+, :-, :*, :/, :\, :^)
  @eval begin
    $F(x::XFloat16, y::XFloat16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::XFloat16, y::Float16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::Float16, y::XFloat16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::XFloat16, y::Float32) = XFloat16($F(Float32(x), y))
    $F(x::Float32, y::XFloat16) = XFloat16($F(x, Float32(y)))
    $F(x::XFloat16, y::T) where {T<:Real} = XFloat16($F(promote(x,y)...))
    $F(x::T, y::XFloat16) where {T<:Real} = XFloat16($F(promote(x,y)...))

    $F(x::XFloat32, y::XFloat32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::XFloat32, y::Float32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::Float32, y::XFloat32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::XFloat32, y::Float64) = XFloat32($F(Float64(x), y))
    $F(x::Float64, y::XFloat32) = XFloat32($F(x, Float64(y)))
    $F(x::XFloat32, y::T) where {T<:Real} = XFloat32($F(promote(x,y)...))
    $F(x::T, y::XFloat32) where {T<:Real} = XFloat32($F(promote(x,y)...))
  end
end

#=    
Base.:(+)(x::XFloat16, y::XFloat16) = reinterpret(XFloat16, (+)(reinterpret(Float32, x), reinterpret(Float32, y)))
Base.:(-)(x::XFloat16, y::XFloat16) = reinterpret(XFloat16, (-)(reinterpret(Float32, x), reinterpret(Float32, y)))
Base.:(*)(x::XFloat16, y::XFloat16) = reinterpret(XFloat16, (*)(reinterpret(Float32, x), reinterpret(Float32, y)))
Base.:(/)(x::XFloat16, y::XFloat16) = reinterpret(XFloat16, (/)(reinterpret(Float32, x), reinterpret(Float32, y)))
Base.:(\)(x::XFloat16, y::XFloat16) = reinterpret(XFloat16, (\)(reinterpret(Float32, x), reinterpret(Float32, y)))

Base.:(+)(x::XFloat32, y::XFloat32) = reinterpret(XFloat32, (+)(reinterpret(Float64, x), reinterpret(Float64, y)))
Base.:(-)(x::XFloat32, y::XFloat32) = reinterpret(XFloat32, (-)(reinterpret(Float64, x), reinterpret(Float64, y)))
Base.:(*)(x::XFloat32, y::XFloat32) = reinterpret(XFloat32, (*)(reinterpret(Float64, x), reinterpret(Float64, y)))
Base.:(/)(x::XFloat32, y::XFloat32) = reinterpret(XFloat32, (/)(reinterpret(Float64, x), reinterpret(Float64, y)))
Base.:(\)(x::XFloat32, y::XFloat32) = reinterpret(XFloat32, (\)(reinterpret(Float64, x), reinterpret(Float64, y)))
=#
