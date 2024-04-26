package com.example.newform.roomdb

import androidx.room.Database

@Database(
    entities = [Pessoa::class],
    version = 1
)


abstract class PessoaDataBase {
    /*abstract =Feita para organização, sendo uma junção de componentes*/

    abstract fun pessoaDao(): PessoaDao

}