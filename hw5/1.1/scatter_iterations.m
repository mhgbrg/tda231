function fig = scatter_iterations(X, Y, K)
    iterations = size(Y, 1);
    
    columns = 4;
    rows = ceil(iterations / columns);

    fig = figure;

    for i=1:iterations
        yi = Y{i};
        subplot(rows, columns, i);
        scatter_clusters(X, yi, K, sprintf('Iteration %i', i));
    end
end