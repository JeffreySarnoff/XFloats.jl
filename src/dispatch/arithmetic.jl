for F in (:+, :-, :*, :/, :\, :^)
  @eval begin
    $F(x::XFloat16, y::XFloat16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::XFloat16, y::Float16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::Float16, y::XFloat16) = XFloat16($F(Float32(x), Float32(y)))
    $F(x::XFloat16, y::Float32) = XFloat16($F(Float32(x), y))
    $F(x::Float32, y::XFloat16) = XFloat16($F(x, Float32(y)))
    $F(x::XFloat16, y::T) where {T<:Real} = $F(promote(x,y)...)
    $F(x::T, y::XFloat16) where {T<:Real} = $F(promote(x,y)...)

    $F(x::XFloat32, y::XFloat32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::XFloat32, y::Float32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::Float32, y::XFloat32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::XFloat32, y::Float64) = XFloat32($F(Float64(x), y))
    $F(x::Float64, y::XFloat32) = XFloat32($F(x, Float64(y)))
    $F(x::XFloat32, y::T) where {T<:Real} = $F(promote(x,y)...)
    $F(x::T, y::XFloat32) where {T<:Real} = $F(promote(x,y)...)

    $F(x::XFloat16, y::XFloat32) = XFloat32($F(Float64(x), Float64(y)))
    $F(x::XFloat32, y::XFloat16) = XFloat32($F(Float64(x), Float64(y)))
  end
end
