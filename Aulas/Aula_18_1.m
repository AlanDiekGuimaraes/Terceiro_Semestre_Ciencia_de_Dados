alturas = [1.6488 1.6864 1.5986 1.7165 1.8354 1.6822 1.8343 1.6472 1.7118 1.6342 1.7915 1.7036 1.8141 1.7183 1.7424 1.7341 1.7936 1.7602 1.5896 1.6324]


m = mean(alturas)
disp(["Média das alturas: " num2str(mean(alturas))]);
disp(["Desvio padrão das alturas: " num2str(std(alturas))]);
disp(["Desvio padrão das alturas: " num2str(var(alturas))]);
var(alturas)

icMais =  m + (1.96 * 0.016816)
icMenos = m - (1.96 * 0.016816)
x = 120:210
(erf(1.33)-erf(-3))/2
1.33*8+175
dist = (exp(-(x-175).^2/64))/(sqrt(pi)*8);
% dist2= 1-(1-(erf(1.88/sqrt(s))))/2
%plot(x, dist)
cdf = cumsum(dist)
indmin= min(find(cdf>97));
x = (indmin)-> altura maior que 97% da população = 190cm
plot(x, cdf)



