#####################################################
# Example: Sequ�ncia de n�meros primos              #
# Apartir de uma entrada serial, o algoritmo mostra #
# uma sequ�ncia de n�meros primos. Exemplo: caso o  #
# usu�rio informe 10, ir� mostrar 10 n�meros primos #
#####################################################
 
#####################################################
# Exemplo do algoritmo em uma linguaguem alto n�vel #
# int main(){					    #	
#	int primos[10];                             #
#	int qtdPrimo = 10, seqPrimo = 0, i = 1, j;  #	
#	while(seqPrimo < qtdPrimo){		    #
#		i++; j = 2;			    #
#		while(j < i){			    #
#			if(i % j == 0)break;        #
#			j++;                        #
#		if(j == i){                         #
#			primos[seqPrimo] = i;       #
#			seqPrimo++;                 #
#		}				    #
#	}                                           #
#	i = 0;                                      #
#	while(i<10){                                #
#		printf("%d\n", primos[i]);          #
#		i++;                                #
#	}                                           #
#}                                                  #
##################################################### 

		.data 				#Primitiva para inicializar valores
primos:	        .word 0,0,0,0,0,0,0,0,0,0 	#Inicializa��o do vetor de 10 posi��es
		.text 				#Primitiva que indica o in�cio do c�digo

main:		movia r10, primos 		#r10 aponta para o vetor declarado 
		
		movi r11, 12 			#Quantidade de n�meros primos
		movi r1 , 1 			#r1 ser� o n�mero mut�vel a cada intera��o para verificar se o mesmo � primo
		movi r12, 1			#r12 indicar� se j� foi encontrado a quantidade de primos indicada 
		
		
while1:		bgt r12, r11, end		#se r12 > r11 acaba o c�digo, pois j� achou a sequ�ncia desejada
		addi r1, r1, 1			#incrementa r1 para verificar se o pr�ximo n�mero da sequ�ncia natural � primo
		movi r2 , 2 			#valor para fazer a divis�o de 2 at� N-1
		
		
while2:		bge r2, r1, if 			# if i<N ele desce para fazer as verifica��es de primo, caso chegue a i>=N ele dir� que � primo
		div r3, r1, r2			# realiza uma divis�o
		mul r3, r3, r2			# depois faz uma multiplica��o 
		beq r3, r1, while1 	        # a divis�o e multiplic�o � para checar se i % j == 0 do c�digo.C na descri��o, caso seja ele n�o � primo e testa o pr�ximo valor
		addi r2, r2, 1			# incrementa o valor at� n-1 para testar todos os restos poss�veis, exemplo se o n�mero for 8, ele vai tentar de 2 at� 7			
		br while2			# chamando o mesmo r�tulo at� decidir ser primo ou n�o
		
if:		addi r12, r12, 1 		# incrementa a quantidade de primos, se tiver em 3 e incrementar pra 4 significa que ele j� achou 3 n�meros e ir� buscar o quarto.
		stw r1, 0(r10)			# armazena o mesmo em uma posi��o do vetor
		addi r10, r10, 4		# seta a pr�ximaa posi��o do vetor para ser a atual
		br while1			# recome�a o pr�xima intera��o do primeiro la�o
		
end:						# o programa finalizou encontrando a sequencia de primos necess�ria e finaliza. 
		
		
	
	
		
	

	

	
	
	

	

