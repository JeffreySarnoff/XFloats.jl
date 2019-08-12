cross(x::Vector{XFloat16}, y::Vector{XFloat16}) = reinterpret(XFloat16, cross(reinterpret(Float32, x), reinterpret(Float32, y))) 
(*)(x::Vector{XFloat16}, y::Vector{XFloat16}) = reinterpret(XFloat16, (*)(reinterpret(Float32, x), reinterpret(Float32, y)))
dot(x::Vector{XFloat16}, y::Vector{XFloat16}) = reinterpret(XFloat16, dot(reinterpret(Float32, x), reinterpret(Float32, y)))
(/)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) = reinterpret(XFloat16, (/)(reinterpret(Float32, x), reinterpret(Float32, y)))
(\)(x::Matrix{XFloat16}, y::Matrix{XFloat16}) = reinterpret(XFloat16, (\)(reinterpret(Float32, x), reinterpret(Float32, y)))
factorize(x::Matrix{XFloat16}) = reinterpret(XFloat16, factorize(reinterpret(Float32, x)))
inv(x::Matrix{XFloat16}) = reinterpret(XFloat16, inv(reinterpret(Float32, x)))
det(x::Matrix{XFloat16}) = reinterpret(XFloat16, det(reinterpret(Float32, x)))
logdet(x::Matrix{XFloat16}) = reinterpret(XFloat16, logdet(reinterpret(Float32, x)))
logabsdet(x::Matrix{XFloat16}) = reinterpret(XFloat16, logabsdet(reinterpret(Float32, x)))
size(x::Matrix{XFloat16}) = size(Float32.(x))
eigvals(x::Matrix{XFloat16}) = reinterpret(XFloat16, eigvals(reinterpret(Float32, x)))
eigvecs(x::Matrix{XFloat16}) = reinterpret(XFloat16, eigvecs(reinterpret(Float32, x)))
svdvals(x::Matrix{XFloat16}) = reinterpret(XFloat16, svdvals(reinterpret(Float32, x)))

cross(x::Vector{XFloat32}, y::Vector{XFloat32}) = reinterpret(XFloat32, cross(reinterpret(Float64, x), reinterpret(Float64, y))) 
(*)(x::Vector{XFloat32}, y::Vector{XFloat32}) = reinterpret(XFloat32, (*)(reinterpret(Float64, x), reinterpret(Float64, y)))
dot(x::Vector{XFloat32}, y::Vector{XFloat32}) = reinterpret(XFloat32, dot(reinterpret(Float64, x), reinterpret(Float64, y)))
(/)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) = reinterpret(XFloat32, (/)(reinterpret(Float64, x), reinterpret(Float65, y)))
(\)(x::Matrix{XFloat32}, y::Matrix{XFloat32}) = reinterpret(XFloat32, (\)(reinterpret(Float64, x), reinterpret(Float64, y)))
factorize(x::Matrix{XFloat32}) = reinterpret(XFloat32, factorize(reinterpret(Float64, x)))
inv(x::Matrix{XFloat32}) = reinterpret(XFloat32, inv(reinterpret(Float64, x)))
det(x::Matrix{XFloat32}) = reinterpret(XFloat32, det(reinterpret(Float64, x)))
logdet(x::Matrix{XFloat32}) = reinterpret(XFloat32, logdet(reinterpret(Float64, x)))
logabsdet(x::Matrix{XFloat32}) = reinterpret(XFloat32, logabsdet(reinterpret(Float64, x)))
size(x::Matrix{XFloat32}) = size(Float64.(x))
eigvals(x::Matrix{XFloat32}) = reinterpret(XFloat32, eigvals(reinterpret(Float64, x)))
eigvecs(x::Matrix{XFloat32}) = reinterpret(XFloat32, eigvecs(reinterpret(Float64, x)))
svdvals(x::Matrix{XFloat32}) = reinterpret(XFloat32, svdvals(reinterpret(Float64, x)))
  
