mu = [10,0];
sigma = [16,-12;-12,34];

x=(-10:1:20);y=(-10:1:20); % you can change this

[X,Y] = meshgrid(x,y);

F = mvnpdf([X(:) Y(:)],mu,sigma);

F = reshape(F,length(x),length(y));
contour(x,y,F,[1.000]);