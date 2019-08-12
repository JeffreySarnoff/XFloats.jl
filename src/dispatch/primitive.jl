import Base: hash, string, show, tryparse


withtypes = [(F,T1,T2) for F in (:hash, :string) for T1 in  (:Float64, :XFloat16) for T2 in (:XFloat16, :Float16)]
                


for (TF,TX) in ((:Float64, :XFloat32)(:Float64, :XFloat32))
  for F in (:hash, :abs)
     $F(x::$TX) = $F(reinterpret($TF, $TX))#      @eval a = string($T," ",$F); println(a);
           end; end
withtypes = [(F,T) for F in (:hash, :string) for T in  (:Float32, :XFloat16)]
  @eval begin
    $F(x::$T) = reinterpret(
    

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
