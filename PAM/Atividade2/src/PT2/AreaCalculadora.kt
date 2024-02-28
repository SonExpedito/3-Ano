package PT2

import kotlin.math.PI
import kotlin.math.pow
import kotlin.math.sqrt

fun calcular(num: Int): Float {
    var resul = 0.0f
    when (num) {
        1 -> resul = retangulo()
        2 -> resul = equilatero()
        3 -> resul = isosceles()
        4 -> resul = escaleno()
        5 -> resul = Circu()
        6 -> resul = Losango()
        7 -> resul = trapezio()
        else -> println("Não foi inserido nenhum código correspondente, por favor tente novamente")
    }
    return resul
}

fun retangulo(): Float {
    println("Digite o valor da base :")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor da altura:")
    val b = readlnOrNull()?.toFloatOrNull() ?: 0f
    return a * b
}

fun equilatero(): Float {
    println("Digite o valor do lado :")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    return ((a * a * sqrt(3.0)) / 4).toFloat()
}

fun isosceles(): Float {
    println("Digite o valor da base :")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor da altura:")
    val b = readlnOrNull()?.toFloatOrNull() ?: 0f
    return (a * b) / 2
}

fun escaleno(): Float {
    println("Digite o valor do lado A :")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor do Lado B:")
    val b = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor do Lado C:")
    val c = readlnOrNull()?.toFloatOrNull() ?: 0f
    val s = (a + b + c) / 2
    return sqrt(s * (s - a) * (s - b) * (s - c)).toFloat()
}

fun Circu(): Float {
    println("Digite o valor do Raio:")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    return (PI * a.pow(2)).toFloat()
}

fun Losango(): Float {
    println("Digite o valor de D, a Diagonal Maior :")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor de d , a Diagonal menor:")
    val b = readlnOrNull()?.toFloatOrNull() ?: 0f
    return (a * b) / 2
}

fun trapezio(): Float {
    println("Digite o valor da Base Maior B:")
    val a = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor da Base Menor b:")
    val b = readlnOrNull()?.toFloatOrNull() ?: 0f
    println("Digite o valor da altura h:")
    val c = readlnOrNull()?.toFloatOrNull() ?: 0f
    return ((a + b) * c) / 2
}

fun seletorarea() {
    println("Bem Vindo a Calculadora de área")
    println("Para continuar digite o código correspondente a forma selecionada. ")
    println(
        "1. Retângulo \n" +
                "2. Triângulo Equilátero \n" +
                "3. Triângulo Isósceles \n" +
                "4. Triângulo Escaleno \n" +
                "5. Circunferência \n" +
                "6. Losango \n" +
                "7. Trapézio "
    )
    val selecao = readlnOrNull()?.toIntOrNull()

    if (selecao != null) {
        println("A Área da figura desejada é ${calcular(selecao)}")
    }
}

fun main(args: Array<String>) {
    seletorarea()
}