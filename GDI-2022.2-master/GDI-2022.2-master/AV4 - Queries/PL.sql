CREATE OR REPLACE PROCEDURE print_cpf
IS
	v_cpf usuario.cpf%TYPE;
	r_usuario usuario%ROWTYPE;
	qtd_cpf integer;	
	v_nome usuario.nome%TYPE;
 	cursor cpfs is select cpf from usuario;
BEGIN
  
    SELECT COUNT(*) INTO qtd_cpf FROM usuario;
	OPEN cpfs;
	LOOP
	FETCH cpfs INTO v_cpf;
		dbms_output.put_line(v_cpf);
		select nome into v_nome from usuario where cpf = v_cpf;
		if v_cpf = '89547832565' then
        	dbms_output.put_line('CPF SORTEADO');
        Elsif v_nome = 'Francisca Silva' then
            dbms_output.put_line('nome sorteado');
		else 
            dbms_output.put_line('nao foi sorteado');
    	end if;
	exit when cpfs%NOTFOUND;
    END LOOP;
	close cpfs;
    
	dbms_output.put_line(qtd_cpf);

END print_cpf;

execute print_cpf;