
function testadd(x,y,z)
   a = x + y
   b = a + z
   c = b + a
   d = c + x
   return d
end

function testmul(x,y,z)
   a = x * y
   b = a * z
   c = z * x
   d = a * b
   return d
end

function testarith(x,y,z)
   a = x + y
   b = x * y
   c = z - b
   d = a / c
   return d
end

function testmuladd(x,y,z)
   a = muladd(x, y, z)
   b = muladd(z, x, y)
   c = muladd(z, b, -y)
   d = muladd(c, a,  x)
   return d
end

function testfma(x,y,z)
   a = fma(x, y, z)
   b = fma(z, x, y)
   c = fma(z, b, -y)
   d = fma(c, a,  x)
   return d
end


a32, a64 = Float32(pi)/7, Float64(pi)/7
b32, b64 = Float32(cbrt(3)), Float64(cbrt(3))
c32, c64 = Float32(sqrt(1/5)), Float64(sqrt(1/5))

x16, x32 = XFloat16(a32), XFloat32(a64)
y16, y32 = XFloat16(b32), XFloat32(b64)
z16, z32 = XFloat16(c32), XFloat32(c64)


relspeed_add32 =
  round( (@noelide @belapsed testadd($x16,$y16,$z16)) /
         (@noelide @belapsed testadd($a32,$b32,$c32)), digits=2);

relspeed_add64 =
 round( (@noelide @belapsed testadd($x32,$y32,$z32)) /
        (@noelide @belapsed testadd($a64,$b64,$c64)), digits=2);

relspeed_mul32 =
  round( (@noelide @belapsed testmul($x16,$y16,$z16)) /
         (@noelide @belapsed testmul($a32,$b32,$c32)), digits=2);

relspeed_mul64 =
 round( (@noelide @belapsed testmul($x32,$y32,$z32)) /
        (@noelide @belapsed testmul($a64,$b64,$c64)), digits=2);

relspeed_arith32 =
  round( (@noelide @belapsed testarith($x16,$y16,$z16)) /
         (@noelide @belapsed testarith($a32,$b32,$c32)), digits=2);

relspeed_arith64 =
 round( (@noelide @belapsed testarith($x32,$y32,$z32)) /
        (@noelide @belapsed testarith($a64,$b64,$c64)), digits=2);

relspeed_muladd32 =
  round( (@noelide @belapsed testmuladd($x16,$y16,$z16)) /
         (@noelide @belapsed testmuladd($a32,$b32,$c32)), digits=2);

relspeed_muladd64 =
 round( (@noelide @belapsed testmuladd($x32,$y32,$z32)) /
        (@noelide @belapsed testmuladd($a64,$b64,$c64)), digits=2);

relspeed_fma32 =
  round( (@noelide @belapsed testfma($x16,$y16,$z16)) /
         (@noelide @belapsed testfma($a32,$b32,$c32)), digits=2);

relspeed_fma64 =
 round( (@noelide @belapsed testfma($x32,$y32,$z32)) /
        (@noelide @belapsed testfma($a64,$b64,$c64)), digits=2);



relspeeds = string(
   "\n\n\trelative speeds",
   "\n\t  (32)\t (64)\n\n",
   "add:   \t $relspeed_add32 \t $relspeed_add64 \n",
   "mul:   \t $relspeed_mul32 \t $relspeed_mul64 \n",
   "arith: \t $relspeed_arith32 \t $relspeed_arith64 \n",
   "muladd:\t $relspeed_muladd32 \t $relspeed_muladd64 \n",
   "fma:   \t $relspeed_fma32 \t $relspeed_fma64 \n");

print(relspeeds);


