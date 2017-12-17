mu = [20,-5];
sigma = [50,0;0,50];

x=(-15:1:30);y=(-15:1:30); % you can change this

[X,Y] = meshgrid(x,y);

F = mvnpdf([X(:) Y(:)],mu,sigma);

F = reshape(F,length(x),length(y));
contour(x,y,F,[1.000]);