X1 = [2 2;
      4 4;
      4 0];
X2 = [0 0;
      2 0;
      0 2];

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), '+', 'red');
scatter(X2(:,1), X2(:,2), 'x', 'blue');
ezplot(@(x1, x2) x1 + x2 - 3);
xlim([-1 5]);
ylim([-1 5]);
title('SVM');
legend('+1', '-1', 'Decision boundary');

saveas(fig, '../figures/problem1.eps', 'epsc');