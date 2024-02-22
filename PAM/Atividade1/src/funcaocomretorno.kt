fun main(args: Array<String>) {
    println(
        soma(
            2,
            3
        )
    )
    println(soma(11))
}

fun soma(a: Int, b: Int = 1): Int {
    return a + b
}