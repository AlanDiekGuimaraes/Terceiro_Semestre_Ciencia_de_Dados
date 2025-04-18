% Configuração dos parâmetros
nb = 3000; % Número de bêbados
np = 100;  % Número de passos

% Inicializa a posição dos bêbados
x = zeros(1, nb);

% Simulação do passeio aleatório
for b = 1:nb
  for p = 1:np
    x(1, b) = x(1, b) + (randi([0,1]) * 2 - 1); % Movimento aleatório -1 ou +1
  end
end

% Figura 1 - Boxplot das posições finais
figure(1);
boxplot(x);
title('Boxplot das Posições Finais');
xlabel('Bêbados');
ylabel('Posição');

% Calcula os quartis e os limites para outliers
Qbebado = quantile(x, [0.25, 0.5, 0.75]); % Q1, Q2 (Mediana), Q3
q1_bebado = Qbebado(1);
q2_bebado = Qbebado(2);
q3_bebado = Qbebado(3);

iqr_bebado = q3_bebado - q1_bebado; % Intervalo interquartil
limiteSuperior_bebado = q3_bebado + iqr_bebado * 1.5;
limiteInferior_bebado = q1_bebado - iqr_bebado * 1.5;

% Figura 3 - Construção da CDF com os quartis
figure(3);
hold on;
[f, x_sorted] = ecdf(x); % Calcula a CDF
plot(x_sorted, f, 'b', 'LineWidth', 2); % Plota a CDF

% Plotando os Quartis como linhas tracejadas
plot([q1_bebado, q1_bebado], [0, 1], 'r--', 'LineWidth', 1.5);
plot([q2_bebado, q2_bebado], [0, 1], 'g--', 'LineWidth', 1.5);
plot([q3_bebado, q3_bebado], [0, 1], 'b--', 'LineWidth', 1.5);

% Adicionando legenda
legend('CDF', 'Q1 (25%)', 'Q2 (Mediana 50%)', 'Q3 (75%)', 'Location', 'southeast');

% Configuração do gráfico
title('CDF das Posições Finais dos Bêbados');
xlabel('Posição Final');
ylabel('Probabilidade Acumulada');
grid on;
hold off;

