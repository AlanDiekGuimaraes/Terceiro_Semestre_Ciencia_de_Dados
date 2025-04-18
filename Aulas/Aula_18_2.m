x=0;

N = 50
p = 0.2
n = 10;

soma = 0
for n=0:9
soma = soma + factorial(N)/factorial(N-n)/factorial(n)*p^n*(1-p)^(N-n);
end

soma

SOMA = 0
lambda = 12;
n1 = 15;
for n1 = 0:11
SOMA = SOMA + exp(-lambda) * lambda^n1/factorial(n1);
end
SOMA
