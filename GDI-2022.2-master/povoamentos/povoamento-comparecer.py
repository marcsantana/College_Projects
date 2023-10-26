from random import randint
cpfs = ['89547832565', '65924587136', '78922398471', '00541639874', '89456918267', '74028498321', '12584970220', '7418360275', '78541036942', '48759659899', '71447832565', '71443532565']

eventos = ['G8993545224', 'H899945224', 'F899945231', 'D898845231', 'C897645231', 'B987654321', 'A123456789']

evento = []
for i in range(len(cpfs)):
    n_eventos = randint(0, 6)
    for j in range(n_eventos):
        evento_atual = eventos[randint(0,6)]
        if evento_atual not in evento:
            evento.append(evento_atual)
    
    for k in evento:
        print(f"INSERT INTO Comparecer VALUES ('{cpfs[i]}', '{k}')")
        print()
    evento.clear()
#cpf_usuarios - id_evento