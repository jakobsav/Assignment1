% Testing second order approximation

%% Test 1
fun  = @(x) sin(2*pi*x);
funp = @(x) 2*pi*cos(2*pi*x);

%% Test 2 (Comment test 1 after you are done with it)
%fun  = @(x) sin(20*pi*x);
%funp = @(x) 20*pi*cos(20*pi*x);


n = 4;
for i=1:10
    % evaluating the function and exact derivative
    x  = linspace(0,1,n+1);
    h  = x(2)-x(1);
    f  = fun(x);
    g  = funp(x);
    
    % evaluating numerical derivate    
    fprime = getSecondOrderForwardDer(f,h);
    
    % comparing
    err = norm(g(1:end-2)-fprime,'inf');
    
    fprintf('%3.2e    %3.2e\n',h,err);
    n = 2*n;
end
        
%%