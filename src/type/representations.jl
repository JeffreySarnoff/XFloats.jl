string(x::XFloat16) = string(Float16(reinterpret(Float32, x)))
string(x::XFloat32) = string(Float32(reinterpret(Float64, x)))

show(io::IO, x::XFloat16) = print(io, Float16(reinterpret(Float32, x)))
show(io::IO, x::XFloat32) = print(io, Float32(reinterpret(Float64, x)))

tryparse(::Type{XFloat16}, x::String) = reinterpret(XFloat16, tryparse(Float32, x))
tryparse(::Type{XFloat32}, x::String) = reinterpret(XFloat32, tryparse(Float64, x))

hash(x::XFloat16) = hash(reinterpret(Float32, x))
hash(x::XFloat32) = hash(reinterpret(Float64, x))
hash(x::XFloat16, h::UInt) = hash(Float64(reinterpret(Float32,x)), h)
hash(x::XFloat32, h::UInt) = hash(reinterpret(Float64,x), h)
