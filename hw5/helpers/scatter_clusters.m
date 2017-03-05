function scatter_clusters(X, y, K, plot_title)
    hold on;

    markers = ['x', '+', '*', 'o', 's', 'd', '^', 'v', 'p', 'h'];
    
    for k=1:K
        Xk = X(y == k,:);
        marker_index = mod(k - 1, 10) + 1;
        scatter(Xk(:,1), Xk(:,2), markers(marker_index));
    end
    
    title(plot_title);
end