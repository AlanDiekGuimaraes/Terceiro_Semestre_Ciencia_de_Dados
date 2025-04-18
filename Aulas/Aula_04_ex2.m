close all
g=[0, 1, 1, 2, 20, 20, 20, 20, 30, 60];

dinheiro = 200

jogadas=0;

historico=dinheiro;

while(dinheiro>=20)


  jogadas=jogadas+1

  jogada= ceil(rand()*10);


  ganho=  g(jogada);

  dinheiro = dinheiro - 20 + ganho;

  historico(jogadas+1)=dinheiro;

  disp(["Rodada ", num2str(jogadas), ": Você ganhou R$", num2str(ganho), ...
          ". Saldo atual: R$", num2str(dinheiro)]);

endwhile
disp("Você ficou sem dinheiro. Fim de jogo.");

figure;
plot(historico, "-o", "LineWidth", 2);
xlabel("Número de Rodadas");
ylabel("Saldo (R$)");
title("Simulação da Ruína do Jogador");
grid on;

