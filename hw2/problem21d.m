clear;

data = load('dataset2.mat');
X = data.x;
y = data.y;

c1 = X(y == 1,:);
c2 = X(y == -1,:);

fig = figure;
hold on
grid on
scatter3(c1(:,1), c1(:,2), c1(:,3), 'o');
scatter3(c2(:,1), c2(:,2), c2(:,3), 'x');

title('dataset2');
legend('1', '-1')

saveas(fig, 'problem21d.eps', 'epsc')

disp('new_classifier:')
disp(cross_validate(X, y, @(XT, xt, yt) new_classifier_vec(XT, xt, yt)));

disp('sph_bayes:')
disp(cross_validate(X, y, @(XT, xt, yt) sph_bayes_vec(XT, xt, yt)));