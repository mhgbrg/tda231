X = [2 2;
     4 4;
     4 0;
     0 0;
     2 0;
     0 2];
t = [1; 1; 1; -1; -1; -1];

A = [-1  0  0  0  0  0;
      0 -1  0  0  0  0;
      0  0 -1  0  0  0;
      0  0  0  -1 0  0;
      0  0  0  0  -1 0;
      0  0  0  0  0 -1];
b = [0; 0; 0; 0; 0; 0];
Aeq = [1 1 1 -1 -1 -1];
beq = 0;

fmincon(@(a) -fun(a, X, t), [0, 0, 0, 0, 0, 0], A, b, Aeq, beq)

function y = fun(a, X, t)
    acc = 0;
    for n=1:6
        for m=1:6
            acc = acc + a(n)*a(m)*t(n)*t(m)*X(n)*transpose(X(m));
        end
    end
    
    y = sum(a) - acc;
end