a32, a64 = Float32(pi)/7, Float64(pi)/7
b32, b64 = Float32(cbrt(3)), Float64(cbrt(3))

x16, x32 = XFloat16(a32), XFloat32(a64)
y16, y32 = XFloat16(b32), XFloat32(b64)

add_ab32 = @noelide @belapsed $a32 + $b32
add_ab64 = @noelide @belapsed $a64 + $b64
add_xy16 = @noelide @belapsed $x16 + $y16
add_xy32 = @noelide @belapsed $x32 + $y32

add_16 = string(round(add_xy16 / add_ab32, digits = 4)) 
add_32 = string(round(add_xy32 / add_ab64, digits = 4)) 

println("add_16 = $add_16")
println("add_32 = $add_32")
