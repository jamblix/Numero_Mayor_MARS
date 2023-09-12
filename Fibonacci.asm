 .data 
	fibs: .word 0:19       #Matriz de valores contenidos 
	size: .word 19         #Tama�o de la matriz
	
.text 
	la $s0, fibs           #carga de una matriz
	la $s5, size           #tama�o de la variable
	lw $s5, 0($s5)         #Tama�o matriz de carga
	
	 li $s2, 1             #1 es el valor conicido de la primera y segundo numero del Fib.
	 sw $s2, 0($s0)        #F[0]=1
	 sw $s2, 4($s0)        #F[1]=F[0]=1
	 addi $s1, $s5, -2     #Contador para el bucle, se ejecutar� 2 veces el tama�o. 
	 
   loop: lw $s3, 0($s0)        #Se optiene el valor de la matriz F(n-2)
   	 lw $s4, 4($s0)        #Se optiene el valor de la matriz F(n-1)
   	 add $s2, $s3, $s4     #F(n) = F(n-1) + F(n-2)
   	 sw $s2, 8($s0)        #Se almacena F(n) recien se calcula en una matriz  
   	 addi $s0, $s0, 4      #incremento n�meros almacenados
   	 addi $s1, $s1, -1     #Contador de bucle de decremento
   	 bgtz $s1,loop         #Repetir mientras no haya terminado
   	 
   	  
   	 la $a0, fibs         #Primer argumento para imprimir matriz
   	 add $a1, $zero, $s5  #Segundo argumento para imprimir tama�o
   	 jal print            #llamada a la impresion.
   	 
   	 
   	 li $v0, 10           #Llamada al sistema para salir.
   	 syscall              #Salida
   	 
   	 
  .data
  	space: .asciiz " "    #Espacio para insertar n�meros
  	head: .asciiz "N�meros Fibonacci: \n" 
  	
  	.text
  		print: add $t0, $zero, $a0 #Conjunto inicial de datos que se van a imprimir
  		       add $t1, $zero, $a1 #Iniciar el contador del bucle al tama�o de la matriz
  		       la $a0, head        #Carga de cadena de encabezado de impresi�n
  		       li $v0, 4           #Especifica el servicio de cadena de impresi�n
  		       syscall             #Imprimir la cadena de encabezado
  		       
  		out: lw $a0, 0($t0)        #Cargar el n�mero actual que se va a imprimir 
  		     li $v0, 1             #Especificar el servicio de impresion de n�meros enteros 
  		     syscall               #Imprimir n�mero Fibonacci
  		     
  		     la $a0, space         #Cargar la direcci�n del espaciador para la llamada del sistema
  		     li $v0, 4             #Especificar el servicio de cadena de impresi�n
  		     syscall               #Imprime la cadena espaciadora
  		     
  		     addi $t0, $t0, 4      #Incrementar la direcci�n de datos al imprimir
  		     addi $t1, $t1, -1     #decremento del contador del bucle
  		     bgtz $t1, out         #Repetir mientras no haya terminado
  		     
  		      jr $ra               #Retorno a la impresi�n.
   	            
   	          