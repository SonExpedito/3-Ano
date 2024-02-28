package PT2


fun calc(a: Int, b: Int, funcao: (Int, Int) -> Int): Int {
    return funcao(a, b)
}

fun somar(a: Int, b: Int): Int {
    return a + b
}

fun subtracao(a: Int, b: Int): Int {
    return a - b
}

fun divisao(a: Int, b: Int): Int {
    return a / b
}

fun multiplicacao(a: Int, b: Int): Int {
    return a * b
}


fun seletor() {
    println("Bem Vindo a Calculadora do Kotlin")

    println("Digite o primeiro valor:")
    val a = readlnOrNull()?.toIntOrNull() ?: 0
    println("Digite o segundo valor:")
    val b = readlnOrNull()?.toIntOrNull() ?: 0

    println("Aqui possuímos as 4 operações básicas, digite o valor correspondente à desejada:")
    println(
        "1. Soma\n" +
                "2. Subtração\n" +
                "3. Multiplicação\n" +
                "4. Divisão"
    )

    val operacao = readLine()?.toIntOrNull()

    when (operacao) {
        1 -> println("O Resultado da operação é ${calc(a, b, ::somar)}")
        2 -> println("O Resultado da operação é ${calc(a, b, ::subtracao)}")
        3 -> println("O Resultado da operação é ${calc(a, b, ::multiplicacao)}")
        4 -> println("O Resultado da operação é ${calc(a, b, ::divisao)}")
        else -> println("Operação inválida")
    }
}

fun main(args: Array<String>) {
    seletor()
}