.data
mensaje1:  .asciiz	 "Ingrese el primer número: \n"
mensaje2:  .asciiz	 "Ingrese el segundo número: \n"
mensaje3:  .asciiz	 "Ingrese el tercer número: \n"


.text 

  .globl main		

     main:

	la $a0, mensaje1         # carga cadena mensaje en $a0
	li $v0, 4		# permite mostrar una cadena
	syscall                 # llamada al sistema

	li $v0, 5		# permite leer un entero
	syscall			# llamada al sistema
	
	move $t0, $v0		# mueve al registrador $t0 el valor leido
	la $a0, mensaje2		# carga la cadena número 2 en $a0
	li $v0, 4		# permite mostrar una cadena
	syscall                 # llamada al sistema
	
	li $v0, 5                # permite mostrar una cadena
	syscall                 # llamada al sistema
	
	move $t1, $v0            # mueve al registrador $t1 el valor leido
	la $a0, mensaje3		# carga la cadena número 3 en $a0
	li $v0, 4		# permite mostrar una cadena
	syscall                 # llamada al sistema
	
	li $v0, 5                # permite mostrar una cadena
	syscall                  # llamada al sistema
	
	move $t2, $v0            # mueve al registrador $t2 el valor leido
	sle $t3, $t0, $t1		# compara if($t0 <= $t1)
	beq $t3, $zero, elseA	  # compara if($t3 == 0)
	sle $t3, $t0, $t2         # compara if($t0 <= $t2)
	beq $t3, $zero, elseB     # compara if($t3 == 0)
	move $a0, $t0            # mueve al registrador $a0 el valor leido
	j print			 # hace un salto de impresión

	elseA:
	slt $t3, $t1, $t0		# compara if($t1 < $t0)
	beq $t3, $zero, elseB     # compara if($t3 == 0)
	sle $t3, $t1, $t2         # compara if($t0 <= $t2)
	beq $t3, $zero, elseB     # compara if($t3 == 0)
	move $a0, $t1             # mueve al registrador $a0 el valor leido
	j print                   # hace un salto de impresión

	elseB:
	move $a0, $t2           # mueve al registrador $a0 el valor leido
	j print                 # hace un salto de impresión

     print:
     
	li $v0, 1		# permite mostrar un entero	
	syscall                 # llamada al sistema

	li $v0, 10	
	syscall			# salida, Terminación del programa.