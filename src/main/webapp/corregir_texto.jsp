<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/header.jsp" %>

<h2 class="text-center mb-4">
📝 Selecciona las palabras incorrectas
</h2>

<p class="text-center mb-4">
Haz clic en las <b>10 palabras mal escritas (b ↔ d)</b>.
</p>

<div class="container">
<div class="card shadow p-4">

<p id="texto" style="font-size:20px; line-height:1.8; text-align:justify;"></p>

<div class="text-center mt-4">
<button class="btn btn-primary" onclick="evaluar()">Revisar</button>
<button class="btn btn-secondary ms-3" onclick="cargarTexto()">Nuevo texto</button>
</div>

<div id="resultado" class="text-center mt-4 fw-bold fs-4"></div>

</div>
</div>

<script>

let textos=[

{
texto:`El niño se sentó en un danco del parque y tomó una debida fría.
Luego caminó hacia el dosque cercano donde vio un darco en el lago.
Cerca del camino había una dicicleta apoyada en un árbol.
En el suelo encontró una dola roja y un daso pequeño.
Después vio una flor muy della en el jardín.
Más adelante apareció una dota vieja.
Al despedirse le dio un deso a su madre.`,

errores:["danco","debida","dosque","darco","dicicleta","dola","daso","della","dota","deso"]
},

{
texto:`En el patio de la escuela había un danco grande.
Los niños tomaban una debida mientras descansaban.
Después caminaron hacia el dosque que está detrás del colegio.
En el lago del parque vieron un darco pequeño.
Un niño llegó en su dicicleta azul.
En el suelo apareció una dola roja.
El profesor tenía un daso con agua.
La maestra llevaba una flor della en el cabello.
Un niño perdió una dota negra.
Al final todos se dieron un deso de despedida.`,

errores:["danco","debida","dosque","darco","dicicleta","dola","daso","della","dota","deso"]
},

{
texto:`El niño visitó a su abuelo en el campo.
Se sentaron en un danco de madera bajo un árbol.
El abuelo le dio una debida fresca.
Luego caminaron por el dosque cercano.
En el río había un darco de pescadores.
Un joven pasó en una dicicleta roja.
El niño encontró una dola en el suelo.
Su abuelo tenía un daso con jugo.
En el jardín había una flor della muy bonita.
Antes de irse le dio un deso a su abuelo.`,

errores:["danco","debida","dosque","darco","dicicleta","dola","daso","della","deso"]
}

];

let textoActual;
let seleccionadas=[];

function limpiarPalabra(p){
return p.toLowerCase().replace(/[.,;:!?]/g,"");
}

function cargarTexto(){

let random=Math.floor(Math.random()*textos.length);

textoActual=textos[random];

let palabras=textoActual.texto.split(" ");

let html="";

palabras.forEach(p=>{

let limpia=limpiarPalabra(p);

html+=`<span onclick="seleccionar(this,'${limpia}')" style="cursor:pointer;">${p}</span> `;

});

document.getElementById("texto").innerHTML=html;

seleccionadas=[];

document.getElementById("resultado").innerHTML="";

}

function seleccionar(elemento,palabra){

elemento.style.textDecoration="underline";
elemento.style.color="red";

seleccionadas.push(palabra);

}

function evaluar(){

let puntaje=0;

seleccionadas.forEach(p=>{

if(textoActual.errores.includes(p)) puntaje++;

});

if(puntaje>10) puntaje=10;

document.getElementById("resultado").innerHTML="Resultado: "+puntaje+" de 10";

/* nombre del estudiante desde sesión */
let nombre="<%= session.getAttribute("estudiante") %>";

/* enviar resultado a la base de datos */

fetch("guardar_resultado.jsp?nombre="+nombre+"&juego=DetectarErrores&puntaje="+puntaje);

}

cargarTexto();

</script>

<%@ include file="/includes/footer.jsp" %>