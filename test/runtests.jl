using XFloats
using Test

@test XFloat16(0) == zero(XFloat16)
@test XFloat32(1) == one(XFloat32)
