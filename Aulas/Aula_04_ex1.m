g=[0, 1, 1, 2, 20, 20, 20, 20, 30, 60]; % g representa as probabilidades de ganhos.



if (dinheiro>=20)           % Se tiver mais de 20 inicia a jogada.

  jogada= ceil(rand()*10);  % A jogada é aredonda para cima com valores aleatorios entre 0 a 1 e mutiplicado por 10.

  ganho = g(jogada);        % Insere o valor da jogada na variavel "ganho" de acordo com o indice do Aray g.

  disp(["Você ganhou " num2str(ganho)]); % Transforma o ganho em string para poder imprimir na tela.


  dinheiro = dinheiro - 20 + g(jogada) % Calcula a subtração de 20 do dinheiro e adiciona o ganho.
else

  disp("Você não tem 20 para jogar")  % Se o valor for menor que 20 informa ao usuario que ele não tem dinheiro sufuciente para jogar.

endif



