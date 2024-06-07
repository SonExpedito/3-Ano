package com.example.newform.roomdb

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Query
import androidx.room.Upsert
import kotlinx.coroutines.flow.Flow


//*Dao é a configuração dos comandos que interagem diretamente com o Banco*//
@Dao
interface PessoaDao {

    @Upsert
    suspend fun upsertPessoa(pessoa: Pessoa)
        /* Suspend = Não implemente o método, até que seja necessário*/



    @Delete
    suspend fun deletePessoa(pessoa: Pessoa)


    @Query("Select * from pessoa")
    fun getAllPessoa(): Flow<List<Pessoa>>
}