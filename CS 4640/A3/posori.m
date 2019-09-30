function angle_out = posori(angle_in)
%
angle = angle_in;
angle_out = angle;
[rows,cols] = size(angle_in);
for r = 1:rows
   for c = 1:cols
      anglerc = angle(r,c);
      while anglerc>2*pi
          anglerc = anglerc - 2*pi;
      end
      while anglerc < 0
         anglerc = anglerc + 2*pi;
      end
      angle_out(r,c) = anglerc;
   end
end