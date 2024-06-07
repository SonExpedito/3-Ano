package com.example.newform.roomdb

import androidx.room.Database
import androidx.room.RoomDatabase

/*Faz a construção do Banco, declarando as Tabelas e a Versão do Banco */
@Database(
    entities = [Pessoa::class],
    version = 1
)


abstract class PessoaDataBase: RoomDatabase() {
    /*abstract =Feita para organização, sendo uma junção de componentes*/

    abstract fun pessoaDao(): PessoaDao

}