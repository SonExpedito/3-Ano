def verificar_par_impar():
    print("Par ou Ímpar")
    numero = int(input("Digite um número: "))
    if numero % 2 == 0:
        print(f"O número {numero} é Par")
    else:
        print(f"O número {numero} é Ímpar")

verificar_par_impar()