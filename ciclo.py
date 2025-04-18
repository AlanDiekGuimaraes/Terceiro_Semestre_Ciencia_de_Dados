import random

def gerar_sorteio(n):
    sorteio = list(range(1, n + 1))
    random.shuffle(sorteio)
    return sorteio

def verifica_sorteio(sorteio):
    visitados, atual = set(), 1
    caminho = []
    
    while atual not in visitados:
        visitados.add(atual)
        caminho.append(atual)
        atual = sorteio[atual - 1]
        if len(visitados) == len(sorteio):
            print("Ciclo completo!", caminho)
            return
    
    print(f"Ciclo quebrado no participante {atual}! Caminho: {caminho}")

n = int(input("Número de participantes: "))
sorteio = gerar_sorteio(n)
print("Sorteio:", sorteio)
verifica_sorteio(sorteio)