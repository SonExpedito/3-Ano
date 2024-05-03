package com.example.newform.viewModel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.asLiveData
import androidx.lifecycle.viewModelScope
import com.example.newform.roomdb.Pessoa
import kotlinx.coroutines.launch

class PessoaViewModel(private val repository: Repository): ViewModel() {
    fun getPessoa() = repository.getAllPessoa().asLiveData(viewModelScope.coroutineContext) /*viewModelScope.coroutineContext = criar coisas na tela*/

    fun upsertPessoa(pessoa: Pessoa) {
        viewModelScope.launch {
            repository.upsertPessoa(pessoa)
        }

    }

    fun deletePessoa (pessoa: Pessoa){
        viewModelScope.launch {
            repository.deletePessoa(pessoa)
        }
    }

}