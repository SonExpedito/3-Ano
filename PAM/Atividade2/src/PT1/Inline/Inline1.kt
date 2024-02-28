package PT1.Inline

inline fun transacao(funcao: () -> Unit) {
    println("Abrindo a transação")
    try {
        funcao()
    } finally {
        println("Fechando a Transação")
    }


}

fun main(args: Array<String>) {
    transacao {
        println("Executando SQL em 1....")
        println("Executando SQL em 2....")
        println("Executando SQL em ....")
    }
}