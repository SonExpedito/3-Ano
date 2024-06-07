package com.example.newform.roomdb

import androidx.room.Entity
import androidx.room.PrimaryKey

//**Constução de Entidade, com os atributos e PK
@Entity
data class Pessoa(
    val nome: String,
    val telefone: String,
    @PrimaryKey(autoGenerate = true)
    val id: Int = 0
)

