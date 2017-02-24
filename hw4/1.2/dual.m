% Data
X = [2 2;
     4 4;
     4 0;
     0 0;
     2 0;
     0 2];
t = [1; 1; 1; -1; -1; -1];

% Constraints
A = [-1  0  0  0  0  0;
      0 -1  0  0  0  0;
      0  0 -1  0  0  0;
      0  0  0 -1  0  0;
      0  0  0  0 -1  0;
      0  0  0  0  0 -1];
b = [0; 0; 0; 0; 0; 0];
Aeq = [1 1 1 -1 -1 -1];
beq = 0;

% Find optimal alpha values
a = transpose(fmincon(@(a) -fun(a, X, t), [2, 2, 2, 2, 2, 2], A, b, Aeq, beq))

% Calculate w and b using alphas
w = transpose(X) * (a .* t)
b = t(1) - X(1,:) * w % We know that the first data point is a support vector, so we can use it to calculate b

% Dual function
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