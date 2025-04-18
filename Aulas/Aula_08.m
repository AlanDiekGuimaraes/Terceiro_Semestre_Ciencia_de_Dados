notas = [55 60 62 65 67 70 72 75 78 80 83 85 88 90 92] % Valores

median(notas) % Mediana

q = quantile(notas, [0.25, 0.5, 0.75], 2, 2)  % Quartil

q = quantile(notas, [0.25, 0.5, 0.75])  % Quartil

q = quantile(notas(1:14), [0.25, 0.5, 0.75])  % Quartil dos primeiros 14 números.



