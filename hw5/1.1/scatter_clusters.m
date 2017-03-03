function scatter_clusters(X, y, K, plot_title)
    hold on;

    markers = ['x', '+', '*', 'o', 's', 'd', '^', 'v', 'p', 'h'];
    
    for k=1:K
        Xk = X(y == k,:);
        scatter(Xk(:,1), Xk(:,2), markers(mod(K, 10)));
    end
    
    title(plot_title);
end