def calcular_media():
    print("Calculadora de Média Aritmética")
    nota1 = float(input("Digite a primeira nota: "))
    nota2 = float(input("Digite a segunda nota: "))
    nota3 = float(input("Digite a terceira nota: "))
    soma = nota1 + nota2 + nota3
    media = soma / 3
    print(f"A média é {media:.2f}")


calcular_media()
