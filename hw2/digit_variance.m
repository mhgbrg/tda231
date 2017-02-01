handwritten = load('digits.mat');
data = handwritten.data;

scaled = data ./ 255;

vars = zeros(32,1100,10);
for i=1:size(scaled, 2)
    for j=1:10
        
        x = scaled(:,i,j);
        y = reshape(x, 16, 16);
        
        x_ = [var(y,0,1) transpose(var(y,0,2)) ];
        
        vars(:,i,j) = x_;
        
    end
    
end