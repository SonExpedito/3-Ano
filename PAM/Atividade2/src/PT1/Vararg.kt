package PT1

fun main(args: Array<String>) {
    for (n in ordenar(38, 24, 11, 69, 101, 666)) {
        print("$n")

    }
}

fun ordenar(vararg numeros: Int): IntArray {
    return numeros.sortedArray()
}