XYZ=1;

% ========================================================================

function resultado_da_media = media(dados)
    % tam = max(size(dados))
    tam = length(dados);

    % Inicializar a soma em zero
    soma = 0;

    % Inicio do for para calcular a media dos elementos do vetor dados

    for n=1: tam

      soma = soma + dados(n);

    endfor

    resultado_da_media = soma/tam

end

% ========================================================================
function resultado = mediana(dados)
  tam = length(dados);

  dados = sort(dados);

  if (tam>1)
    if (mod(tam,2) == 1) % é impar
      resultado = dados (ceil (tam/2));
    else  % é par
     % resultado = (dados(tam/2) + dados(tam/2 + 1)) / 2
      resultado = media([dados(tam/2) dados(tam/2 + 1)])
    endif
  else % dados com um unico elemento
    resultado = dados(1);
  endif

end

% ========================================================================


