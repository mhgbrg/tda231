% Constraints
A = [-2 -2 -1;
     -4 -4 -1;
     -4  0 -1;
      0  0  1;
      2  0  1;
      0  1  1];
b = [-1; -1; -1; -1; -1; -1];

% Find optimal values for w and b
ans = fmincon(@(x) (x(1)*x(1) + x(2)*x(2)) / 2, [0, 0, 0], A, b);

w = transpose(ans([1 2]))
b = ans(3)
