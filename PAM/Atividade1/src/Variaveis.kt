//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
//Variáveis - Fundamentos;
fun main(args: Array<String>) {
    //Tipos Números Inteiros
    val num1: Byte = 127
    val num2: Short = 32767
    val num3: Int = 2_147_483_647
    val num4: Long = 9_147_483_647_147_483_647 //Long Valor Máximo

    //Tipos Números Reais
    val num5: Float = 3.14F
    val num6: Double = 3.14

    //Tipo Caractere
    val char: Char = '?' //Outros exemplos....

    //Tipo boolean
    val boolean: Boolean = true //ou false
    println(listOf(num1, num2, num3, num4, num5, num6, char, boolean))
    println(2 is Int)
    println(214641243213123 is Long)
    println(1.0 is Double)

    //Tudo é Objeto
    println(10.dec())


}