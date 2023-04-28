.data
	.macro finalizar # Macro para finalizar o programa
		li $v0, 10 # Prepara o processador para finalizar o programa
		syscall
	.end_macro 
	
	.macro print(%str) # Macro para printar String
		.data 
			msg: .asciiz %str # Mensagem que o usuario ira digitar
		.text
			li $v0, 4 # Prepara o processador para receber String
			la $a0, msg # Executa a String
			syscall
	.end_macro 
	
	.macro lerInteiro(%r) # Macro para ler um valor inteiro
	li $v0, 5 # Prepara o processador para ler um númer inteiro
	syscall 
	move %r, $v0 # Move o valor para a variavel v0
	.end_macro
	
	.macro printInteiro(%x) # Macro para printar inteiro
		li $v0, 1 #Prepara o processador para printar um valor inteiro
		la $a0, (%x) # Executa o print do valor
  		syscall 
	.end_macro
	
	.text
	Comparar: # Bloco comparar
		beq $t2, 0, Mensagem # Compara se o registrador t2 é igual a 0, caso seja pula para mensagem
		j Menu # Se não pula para o menu
	Mensagem:
		print("Realizar compra") # Mensagem
		j Menu # Pula para o menu
	Menu: # Bloco do menu
		print("Inserir Item") # Mensagem com as opções
		print("Remover Item")
		print("Consultar Item")
		print("Encerrar operação")
		lerInteiro($t0) # Chama a macro para ler inteiros e ler os itens do menu
		beq $t0, 1, Inserir # Compara se t0 é igual a 1, caso seja pula para inserir
		beq $t0, 2, Remover # Compara se t0 é igual a 2, caso seja pula para remover
		beq $t0, 3, Consultar # Compara se t0 é igual a 3, caso seja pula para consultar
		beq $t0, 4, Encerrar # Compara se t0 é igual a 4, caso seja pula para encerrar
		
	Inserir: # Bloco inserir
		print("Quantos itens deseja inserir: ") #Mensagem
		lerInteiro($t1) # Chama macro para ler inteiro
		add $t2, $t1, $t2 # Faz a soma entre t1 e t2
		j Comparar # pula para comparar
		
	Remover: # Bloco remover
		print("Quantos itens deseja remover: ") # Mensagem
		lerInteiro($t3) # Macro para ler inteiro
		sub $t2, $t2, $t3 # subtração entre t2 e t3
		j Comparar # pula para comparar
	
	Consultar: # Bloco consultar
		printInteiro($t2) # Macro para printar inteiro e printa o valor de t2
		j Comparar # pula para comparar
		
		
	Encerrar: # Bloco encerrar
		finalizar # macro para finalizar o programa
		
		