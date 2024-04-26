package com.example.newform.viewModel

import com.example.newform.roomdb.Pessoa
import com.example.newform.roomdb.PessoaDataBase

class Repository(private val db: PessoaDataBase) {
    suspend fun  upsertPessoa(pessoa: Pessoa){
        db.pessoaDao().upsertPessoa(pessoa)
    }

    suspend fun deletePessoa(pessoa:Pessoa){
        db.pessoaDao().deletePessoa(pessoa)
    }

    fun getAllPessoa() = db.pessoaDao().getAllPessoa()

}