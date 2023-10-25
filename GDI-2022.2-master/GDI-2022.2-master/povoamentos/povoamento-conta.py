from random import randint
cpfs = ['89547832565', '65924587136', '78922398471', '00541639874', '89456918267', '74028498321', '12584970220', '7418360275', '78541036942', '48759659899']
nomes = ['Gabriel Carvalho', 'Francisca Silva', 'José Amargo', 'Tomás Nascimento', 'Marcelo Santana', 'Ícaro Nunes', 'João Victor', 'Eliab Bernardino', 'Maria Eduarda', 'Ana Beatriz']


for i in range(0, len(cpfs)):
    nome = nomes[i].split(' ')
    senha = f'{nome[randint(0,1)][randint(0,2):]}{cpfs[i][randint(2,7):]}' 
    email = f'{nome[0]}{cpfs[i][-3:]}@gmail.com'
    print(f"INSERT INTO conta VALUES ('{nome[0]}', '{senha}', '{email}', '{cpfs[i]}');")
    print(f'{len(cpfs[i])}')
    print()