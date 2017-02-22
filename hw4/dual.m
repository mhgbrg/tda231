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
      0  0  0 -1  0  0;
      0  0  0  0 -1  0;
      0  0  0  0  0 -1];
b = [0; 0; 0; 0; 0; 0];
Aeq = [1 1 1 -1 -1 -1];
beq = 0;

a = fmincon(@(a) -fun(a, X, t), [2, 2, 2, 2, 2, 2], A, b, Aeq, beq)

w = 0;

for n=1:6
    w = w + a(n) * t(n) * X(n,:);
end

b = t(1) - w * transpose(X(1,:));

w
b

function y = fun(a, X, t)
    [~, N] = size(a);

    acc = 0;
    for n=1:N
        for m=1:N
            acc = acc + a(n)*a(m)*t(n)*t(m)*X(n,:)*transpose(X(m,:));
        end
    end
    
    y = sum(a) - 1/2 * acc;
end