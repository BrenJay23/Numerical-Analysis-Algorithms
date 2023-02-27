function a = LinearSpline(x,y,z);

n = size(x,1)-1;
A = zeros(n*2, n*2);
k = zeros(n*2,1);
b = zeros(n*2,1);
int=0;

for i = 1:n;
	A((2*i-1),(2*i-1)) = x(i,1);
	A((2*i),(2*i-1)) = x((i+1),1);
	A((2*i-1),(2*i)) = 1;
	A((2*i),(2*i)) = 1;
	b(2*i-1,1) = y(i,1);
	b(2*i,1) = y(i+1,1);

	if z > x(i,1) & z<x(i+1,1);
		int = i;
	elseif z==x(i,1);
		int = i;
	end

end
k = linsolve(A, b);
a = k((2*int-1),1)*z + k(2*int,1),i;

end