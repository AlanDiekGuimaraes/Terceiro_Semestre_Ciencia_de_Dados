% j1 = round (rand());
% j2 = round (rand());
% j1+j2

nt=1;
soma=zeros(nt,1);
nj = 10;

% for t=1:nt
  %for k=1:nj
   % soma (t,1) = soma(t,1) + round (rand());
  %endfor

%   soma(t, 1) = sum( round (rand(1, nj)));
% endfor


soma = sum( round (rand(nt, nj)),2);
soma
% hist(soma, 0:nj)
