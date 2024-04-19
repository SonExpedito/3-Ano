package com.example.aula19_04

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.aula19_04.ui.theme.Aula1904Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Apppreview()
        }
    }
}


@Composable
fun App() {
    Column(
        Modifier
            .background(Color.Black),
        Arrangement.SpaceBetween

    ) {
        Row(
            Modifier
               /* .background(Color.White) Background*/
                .fillMaxWidth(),
            Arrangement.SpaceAround
        ) {
            Text(
                text = "APP-AULA 19-04",
                fontFamily = FontFamily.SansSerif,
                fontWeight = FontWeight.Bold,
                fontSize = 30.sp,
                color = Color.White
            )
        }
        Row(Modifier.padding(6.dp)) {

        }
        Row(
            Modifier
                /*.background(Color.White)*/
                .fillMaxWidth(),
            Arrangement.SpaceBetween
        ) {
            Column() {
                Text(text = "Alex", fontFamily = FontFamily.Cursive,color = Color.White)
            }
            Column {
                Button(onClick = { /*TODO*/ }) {
                    Text(text = "Editar", fontFamily = FontFamily.SansSerif)
                }

            }
            Column {
                Button(onClick = { /*TODO*/ }) {
                    Text(text = "Excluir", fontFamily = FontFamily.SansSerif)
                }
            }
        }
        Row(Modifier.padding(6.dp)) {

        }
        Row(
            Modifier
                /*.background(Color.White)*/
                .fillMaxWidth(),
            Arrangement.SpaceBetween
        ) {
            Column() {
                Text(text = "Alex", fontFamily = FontFamily.Cursive, color = Color.White)
            }
            Column {
                Button(onClick = { /*TODO*/ }) {
                    Text(text = "Editar", fontFamily = FontFamily.SansSerif, )
                }

            }
            Column {
                Button(onClick = { /*TODO*/ }) {
                    Text(text = "Excluir", fontFamily = FontFamily.SansSerif)
                }
            }
        }
    }
}


@Composable
@Preview
fun Apppreview() {
    Aula1904Theme {
        // A surface container using the 'background' color from the theme
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = MaterialTheme.colorScheme.background
        ) {
            App()
        }
    }
}

