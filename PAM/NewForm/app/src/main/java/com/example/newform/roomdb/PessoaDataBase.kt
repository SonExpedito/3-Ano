package com.example.newform.roomdb

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(
    entities = [Pessoa::class],
    version = 1
)


abstract class PessoaDataBase: RoomDatabase() {
    /*abstract =Feita para organização, sendo uma junção de componentes*/

    abstract fun pessoaDao(): PessoaDao

}