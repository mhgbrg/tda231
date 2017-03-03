function Y = kmeans_kernel(X, k, kernel, max_iterations)
    if ~exist('max_iterations', 'var')
        max_iterations = 100;
    end
    
    N = size(X, 1);
    
    % Initiate Y to a certain size so that we don't need to resize it in
    % every iteration. The unused elements are removed when the loop ends.
    Y = cell(max_iterations, 1);
    Y{1} = randi(k, N, 1);
    
    for i=2:max_iterations
        y = Y{i-1};
        y_new = zeros(N, 1);
        
        % Third term is equal for all data points, so we only need to
        % calculate it once per class, and not once per data point.
        term3 = zeros(k, 1);
        for c=1:k
            Xk = X(y == c,:);
            Nk = size(Xk, 1);
            for m=1:Nk
                for l=1:Nk
                    term3(c) = term3(c) + kernel(Xk(m,:), Xk(l,:));
                end
            end
            term3(c) = term3(c) / Nk^2;
        end

        % Assign a label to each point by using kernel formula for
        % distance.
        for n=1:N
            xn = X(n,:);
            distances = zeros(k, 1);
            for c=1:k
                Xk = X(y == c,:);
                Nk = size(Xk, 1);

                term2 = 0;
                for m=1:Nk
                    term2 = term2 + kernel(xn, Xk(m,:));
                end
                term2 = 2/Nk * term2;

                dist = kernel(xn, xn) - term2 + term3(c);
                distances(c) = dist;
            end

            [~, index] = min(distances);
            y_new(n) = index;
        end
        
        % Check if assignments have changed since last iteration.
        if isequal(y_new, y)
            Y(i:max_iterations) = [];
            break;
        end
        
        % Save the new assignments.
        Y{i} = y_new;
    end
end