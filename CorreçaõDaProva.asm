.data
	.macro finalizar # Macro para finalizar
		li $v0, 10 # Prepara o processador para finalizar o programa
		syscall
	.end_macro 
	
	.macro print(%str) # Macro para printar String
		.data 
			msg: .asciiz %str # Mensagem 	
		.text
			li $v0, 4 # Prepara o processador para recber uma String
			la $a0, msg # Executa a String
			syscall
	.end_macro 
	
	.macro lerInteiro(%r) # Macro para ler um valor inteiro
	li $v0, 5 # Prepara o processador para receber um valor inteiro
	syscall 
	move %r, $v0 # Move o valor inteiro para v0
	.end_macro
	
	 .text 
	
	  print("Digite o ano de nascimento: ") # Mensagem
	  lerInteiro($t0) # Chama a macro para ler inteiro e armazena o valor em t0
	  print("Digite o ano em que você está") # Mensagem
	  lerInteiro($t1) # Chama a macro para ler inteiro e armazena o valor em t1
	  
	  sub $t2, $t1, $t0 # Faz a subtração entre o ano de nascimento e o ano atual
	  
	  bge $t2, 18, podeTer # Compara se o valor da subtração é maior ou igual a 18, caso seja pula para pode ter
	  j naoPode # Se não pula para naoPode
	  
	  podeTer: # Bloco Podeter
	  	print("Pode tirar carteira") #Mensagem
	  	j fim # Pula para o final
	   naoPode: # Bloco não pode
	   	print("Não pode tirar carteira") # Mensagem
	   	j fim # Pula para o final
	   	
	   	
	   fim: # Bloco fim
	   	finalizar # Chama a macro para finalizar