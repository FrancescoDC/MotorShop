<?php

session_start();

require("include/dbms.inc.php");
require("include/template2.inc.php");



$indirizzospedizione;
$pagamento = new Template("pagamentoeffettuato.html");
if(isset( $_SESSION['auth'])){
$username = $_SESSION['auth']['username'];
  if(isset($_GET['id'])){
    $id= $_GET['id'];
    if($id>0){
    $indirizzospedizione=$_GET['id'];
  }else{

    $indirizzospedizione = 0;
  }
}


$db->query(" SELECT prodotti.prezzo, carrello.quantity FROM carrello join prodotti on carrello.id_prodotto = prodotti.id_prodotto WHERE carrello.username='$username'");
$prez = $db->getResult();
$prezzoTotale = 0;
foreach ($prez as $key ) {
  $prezzo= $key['prezzo'] ;
  $quantityuu = $key['quantity'];
  $prezzoTotale += $prezzo * $quantityuu ;

}



$db->query("INSERT INTO ordini(prezzoTotale,username) VALUE ($prezzoTotale,'$username')");
$db->query("SELECT id_ordine FROM ordini WHERE prezzoTotale=$prezzoTotale and username='$username' ORDER BY data_ordine desc  limit 1");

$result = $db->getResult();



foreach ($result as $key ) {
$idOrdine = $key['id_ordine'];
}
  $db->query(" SELECT carrello.* FROM carrello join prodotti on carrello.id_prodotto = prodotti.id_prodotto WHERE carrello.username='$username'");

$result = $db->getResult();


foreach ($result as $key ) {
  $id_prodotto= $key['id_prodotto'];
  $quantity = $key['quantity'];
  $db->query("INSERT INTO dettagliordini(id_ordine,id_prodotto,quantita) value ($idOrdine,$id_prodotto,$quantity)");
  
}


$db->query("DELETE FROM carrello WHERE username ='$username'");
//non spostare il require ("include/varie.php"); altrimenti non azzera il numero prodotti nel carrello
require ("include/varie.php");
$main->setContent("menu",$menu->get());
$main->setContent("body",$pagamento->get());
$main->close();
}
else{

    Header("Location: login.php?");
}
 ?>
