using RandomNumbers
import RandomNumbers: rand, randn


RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro64Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro64Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro64Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro64Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))
                  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro128Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro128Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro128Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro128Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))
                  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro256Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro256Plus, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro256Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro256Plus, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))

RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro64StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro64StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro64StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro64StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))

RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro128StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro128StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro128StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro128StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))
                  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro256StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro256StarStar, ::Type{XFloat16}) = XFloat16.(randn(x, Float16))  
RandomNumbers.rand(x::RandomNumbers.Xorshifts.Xoroshiro256StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
RandomNumbers.randn(x::RandomNumbers.Xorshifts.Xoroshiro256StarStar, ::Type{XFloat32}) = XFloat32.(randn(x, Float32))  
