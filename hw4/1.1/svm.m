X1 = [2 2;
      4 4;
      4 0];
X2 = [0 0;
      2 0;
      0 2];
S = [2 2;
     4 0;
     2 0;
     0 2];

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), '+', 'red');
scatter(X2(:,1), X2(:,2), 'x', 'blue');
scatter(S(:,1), S(:,2), 50, 'o', 'black');
ezplot(@(x1, x2) x1 + x2 - 3);
p1 = ezplot(@(x1, x2) x1 + x2 - 3 - 1);
p2 = ezplot(@(x1, x2) x1 + x2 - 3 + 1);
set(p1, 'linestyle', ':');
set(p2, 'linestyle', ':');
xlim([-1 6]);
ylim([-1 6]);
title('SVM');
legend('+1', '-1', 'Support vectors', 'Decision boundary', 'Margins');

saveas(fig, '../figures/problem1.eps', 'epsc');