alturas = [1.6488 1.6864 1.5986 1.7165 1.8354 1.6822 1.8343 1.6472 1.7118 1.6342 1.7915 1.7036 1.8141 1.7183 1.7424 1.7341 1.7936 1.7602 1.5896 1.6324]


m = mean(alturas)
disp(["Média das alturas: " num2str(mean(alturas))]);
disp(["Desvio padrão das alturas: " num2str(std(alturas))]);
disp(["Desvio padrão das alturas: " num2str(var(alturas))]);
var(alturas)

icMais =  m + (1.96 * 0.016816)
icMenos = m - (1.96 * 0.016816)
