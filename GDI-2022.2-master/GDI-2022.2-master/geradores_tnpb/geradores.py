import random as rnd

def gerar_cpfs():
  arq = open('cpfs.txt', 'w')
  cpfs_gerados = []
  for i in range(1000):
    cpf_str = ""
    for i in range(11):
      cpf_str += str(rnd.randint(0, 9))
    cpfs_gerados.append(cpf_str + '\n')
  arq.writelines(cpfs_gerados)
  arq.close()

def gerar_idades():
  arq = open('idades.txt', 'w')
  idades_geradas = []
  for i in range(1000):
    idade = str(rnd.randint(18, 100))
    idades_geradas.append(idade + '\n')
  arq.writelines(idades_geradas)
  arq.close()

gerar_idades()