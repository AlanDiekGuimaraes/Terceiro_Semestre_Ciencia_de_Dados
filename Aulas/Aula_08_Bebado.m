%Passo
nb = 50; %numero de bebados
np = 200; %Numero de passos que cada bebado da
x = zeros(1,nb); %Posicao inicial
contpass = 0;

for b=1:nb
  for p=1 :np

   x(1,b) = x(1,b) + floor(rand()+.6)-1/2; % -0.5 ou 0.5 probabilidade  04 e 06.
   % x(1,b) = x(1,b) + floor(rand()*2)-1/2; % -0.5 ou 0.5
  endfor

endfor

hist(x, -30:30)





%figure 1
%boxplot(x)

%[z,c] = hist(x, -50:50)
%v = ecdf(x)
%figure 2
%plot(v)
%n = tril(ones(101, 101)) * z'
%n = n/nb
%figure 3
%plot(c,n)


