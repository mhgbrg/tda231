figure
hold on
clear

%
% Problem 2.2 a
%
data = load('dataset1.mat');
X = data.x;
range = 0:0.01:1;

invgam = @(s, a, b) b^a./gamma(a).*s.^(-a-1).*exp(-b./s);

% Use the Log-exp-sum-trick
invgamln = @(s, a, b) exp(a * log(b) - gammaln(a) - (a + 1)*log(s) - (b./s));


% Test 1
prior1 = plot(range, invgamln(range, 1, 1));
posterior1 = plot(range, invgamln(range, alphaN(X, 1), betaN(X, 1)));

% Test 2
prior2 = plot(range, invgamln(range, 10, 1));
posterior2 = plot(range, invgamln(range, alphaN(X, 10), betaN(X, 1)));

%
% Problem 2.2 b
%
MAP = @(a,b) b./(a+1);

M_A = MAP(alphaN(X, 1), betaN(X, 1));
M_B = MAP(alphaN(X, 10), betaN(X, 1));

%
% Problem 2.2 c
%
bF = invgamln(M_A, alphaN(X, 1), betaN(X, 1)) ./ invgamln(M_B, alphaN(X, 10), betaN(X, 1));

legend('Model A prior', 'Model A posterior', 'Model B prior', 'Model B posterior')

function alpha = alphaN(x, a)
    [n, ~] = size(x);
    alpha = a + n;
end

function beta = betaN(x, b)
    [n, ~] = size(x);
    mu = 1/n * sum(x);
    s = zeros(n,1);
    for m=1:n
        s(m) = (x(m,:)-mu) * transpose(x(m,:)-mu);
    end
    beta = sum(s)./2 - b;
end