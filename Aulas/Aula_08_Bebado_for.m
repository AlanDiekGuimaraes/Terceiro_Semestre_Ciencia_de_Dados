%Passo
nb = 300; %numero de bebados
np = 400; %Numero de passos que cada bebado da
x = zeros(1,nb); %Posicao inicial

x = zeros(nb,1); %Posicao inicial

x = sum(floor(rand(nb,np)*2) - 0.5, 2)

disp(["Nímero de bebados: " num2str(nb)]);
disp(["Número de passos: " num2str(np)]);
disp(["Desvio padrão: " num2str(std(x))]);
disp(["Variância: " num2str(var(x))]);
disp(["Média: " num2str(mean(x))]);

hist(x, -100:100)
