.data
ZERO: .float 0.0 #variavel que recebe o valor 0
UM: .float 1.0 #variavel que recebe o valor um 
.macro lerFlutuante() #Macro para ler valores com ponto fluautante
	li $v0, 6 #Prepara o processador para receber um valor fluatuante
	syscall
.end_macro 

.macro printFloat(%r) # Macro para printar valores com ponto fluautante
	li $v0, 2 # Prepara o processador para receceber o valor com ponto flutuante
	mov.s $f12, %r# Move o valor com ponto flutuante para o registrador f12
	syscall
	
.end_macro 

.macro finalizar # Macro para finalizar o programa
	li $v0, 10 #Prepara o processador para encerrar o programa
	syscall
.end_macro 
	
.macro print(%str) #Macro para printar String
	.data 
	msg: .asciiz %str # Mensagem que o usuario vai digitar
	.text
	li $v0, 4 # Prepara o processador para ler String
	la $a0, msg # Executa a String
	syscall
.end_macro 

.text 

	Menu:  # Bloco Menu
	print("Digite os números: ") # Mensagem para o usuario
	lerFlutuante() # Chamando o macro para ler o valor com ponto flutuante
	lwc1 $f1, ZERO # Pega o valor da variavel zero e aloca em f1
	c.le.s $f0, $f1 # Compara se valor digitado e igual a 0
	bc1t fim # Se for 0 pula para o fim
	j calcular # Se não pula para calcular
	
	calcular: # Bloco que realizar os calculos
		mov.s $f3, $f0 # Pega o valor digitado e move para f3
		lwc1 $f4, UM # Pega o valor da variavel um e aloca em f4
		add.s $f5, $f4, $f5 # Conta do denominador
		add.s $f6, $f3, $f6 # Realizando a soma
		div.s $f7, $f6, $f5 # Realizando a divisão
		j Menu # Volta pro menu
	fim: # Bloco final
		print("Soma")
		printFloat($f6) # Printa o valor da soma
		print("Media")
		printFloat($f7) # Printa o valor da média
		finalizar # Chama a macro para finalizar o programa


