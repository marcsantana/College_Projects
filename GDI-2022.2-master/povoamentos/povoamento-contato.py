cpfs = ['89547832565', '65924587136', '78922398471', '00541639874', '89456918267', '74028498321', '12584970220', '7418360275', '78541036942', '48759659899']

numero = 82993238173

for i in range(len(cpfs)):
    print(f"INSERT INTO Contato\nVALUES ('{cpfs[i]}', '{numero}');")
    print(' ')
    numero += 1