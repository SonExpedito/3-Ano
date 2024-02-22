package Break

fun main(args: Array<String>) {
    loop@ for (i in 1..10) {
        for (j in 1..10) {
            if (i == 2 && j == 5) break@loop
            println("$i $j")
        }
    }
    println("Fim!")
}