package PT1.Inline

inline fun <T> executarComLog(nomeFuncao: String, funcao: () -> T): T {
    println("Entrando no método $nomeFuncao ")
    try {
        return funcao()

    } finally {
        println("Método $nomeFuncao finalizado....")
    }

}

fun somar(a: Int, b: Int): Int {
    return a + b
}

fun main(args: Array<String>) {
    val resultado = executarComLog("Somar") {
        somar(4, 5)
    }

    println(resultado)
}