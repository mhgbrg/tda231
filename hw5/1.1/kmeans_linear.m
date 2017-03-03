function Y = kmeans_linear(X, K, max_iterations)
    if ~exist('max_iterations', 'var')
        max_iterations = 100;
    end
    
    N = size(X, 1);
    
    % Initiate centers to K data points chosen uniformly at random.
    mu = datasample(X, K, 'Replace', false);
    
    % Initiate Y to a certain size so that we don't need to resize it in
    % every iteration. The unused elements are removed when the loop ends.
    Y = cell(max_iterations, 1);
    
    for i=1:max_iterations
        y = zeros(N, 1);
        
        % Assign each point to its closest center.
        for n=1:N
            x = X(n,:);
            distances = zeros(K, 1);
            for k=1:K
                muk = mu(k,:);
                dist = (x - muk) * transpose(x - muk);
                distances(k) = dist;
            end
            [~, index] = min(distances);
            y(n) = index;
        end
        
        % Check if assignments have changed since last iteration.
        if i > 1 && isequal(y, Y{i-1})
            Y(i:max_iterations) = [];
            break;
        end
        
        % Save the new assignments.
        Y{i} = y;

        % Calculate new centers.
        for k=1:K
            xk = X(y == k,:);
            mu(k,:) = mean(xk);
        end
    end
end