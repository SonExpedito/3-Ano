package PT1.FuncaoParam

fun <E> filtrar(lista: List<E>, filtro: (E) -> Boolean): List<E> {
    val listafiltrada = ArrayList<E>()
    for (e in lista) {
        if (filtro(e)) {
            listafiltrada.add(e)
        }
    }
    return listafiltrada
}

fun comTresLetras(nome: String): Boolean {
    return nome.length == 3
}

fun main(args: Array<String>) {
    val nomes = listOf("Alex", "Pedro", "Gui", "Gab", "Luh")
    println(filtrar(nomes, ::comTresLetras))
}