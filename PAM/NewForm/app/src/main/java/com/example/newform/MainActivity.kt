package com.example.newform

import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.colorspace.Rgb
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.room.Room
import com.example.newform.roomdb.Pessoa
import com.example.newform.roomdb.PessoaDataBase
import com.example.newform.ui.theme.NewFormTheme
import com.example.newform.viewModel.PessoaViewModel
import com.example.newform.viewModel.Repository

class MainActivity : ComponentActivity() {
    private val db by lazy {
        Room.databaseBuilder(
            applicationContext,
            PessoaDataBase::class.java,
            "pessoa.db",

            ).build()
    }

    private val viewModel by viewModels<PessoaViewModel>(
        factoryProducer = {
            object : ViewModelProvider.Factory {
                override fun <T : ViewModel> create(modelClass: Class<T>): T {
                    return PessoaViewModel(Repository(db)) as T
                }
            }
        }
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            App(viewModel)
        }
    }
}


@Composable
fun App(viewModel: PessoaViewModel) {
    NewFormTheme {
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.background
    ) {
        var nome by remember {
            mutableStateOf("")
        }
        var telefone by remember {
            mutableStateOf("")
        }

        val pessoa = Pessoa(
            nome,
            telefone
        )

        Column(
            modifier = Modifier.background(Color.LightGray)
        ) {
            Row(
                Modifier
                    .background(Color.Transparent)
                    .fillMaxWidth(),
                Arrangement.Center
            ) {
                Text(
                    text = "APP CADASTRO CLIENTE",
                    fontFamily = FontFamily.SansSerif,
                    fontWeight = FontWeight.Bold,
                    fontSize = 30.sp,

                    )

            }

            Spacer(modifier = Modifier.size(30.dp))
            Row(
                Modifier.fillMaxWidth(),
                Arrangement.Center
            ) {
                TextField(value = nome,
                    onValueChange = { nome = it },
                    label = { Text(text = "Nome:") })
            }

            Spacer(modifier = Modifier.size(30.dp))
            Row(
                Modifier.fillMaxWidth(),
                Arrangement.Center
            ) {
                TextField(value = telefone,
                    onValueChange = { telefone = it },
                    label = { Text(text = "Telefone:") })
            }
            Spacer(modifier = Modifier.size(30.dp))
            Row(
                Modifier.fillMaxWidth(),
                Arrangement.Center
            ) {
                Button(onClick = {
                    viewModel.upsertPessoa(pessoa)
                }) {
                    Text(text = "Cadastrar")
                }
            }

        }
    }
    }
}


@Composable
@Preview
fun Previewapp() {




    }



