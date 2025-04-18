close all
g=[0, 1, 1, 2, 20, 20, 20, 20, 30, 60];

nj=400;   % Numero de jogadores.

dinheiroinicial = 200;

rj=zeros(nj,1); %  Registro dos jogadores onde salvará quantas jogadas foram feitos pelos jogadores.
mg=zeros(nj,1); % Máximo de ganhos.


for k=1:nj

  dinheiro = dinheiroinicial;

  maxg=dinheiro;

  jogadas=0;

  % historico=dinheiro;

  while(dinheiro>=20)

    jogadas= jogadas+1;

    jogada= ceil(rand()*10);

    ganho=  g(jogada);

    dinheiro = dinheiro - 20 + ganho;

    if (dinheiro>maxg)
      maxg=dinheiro;
    endif

  endwhile

  mg(k)=maxg;
  rj(k)=jogadas;

endfor

disp(["Mínimo de Jogadas: ", num2str(min(rj))])
disp(["Máximo de Jogadas: ", num2str(max(rj))])
disp(["Média de Jogadas: ", num2str(mean(rj))])
disp(["Desvio padrão: ",     num2str(std(rj))])

