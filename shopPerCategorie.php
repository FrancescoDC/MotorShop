<?php


session_start();

require("include/dbms.inc.php");
require("include/template2.inc.php");
require ("include/varie.php");


$body = new Template("shopStradale.html");



$var = $_GET['id_cat'];
$var2 = $_GET['tipologia'];

$db->query("SELECT prodotti.*, immagini.path FROM prodotti left join immagini on prodotti.id_immaginePrincipale= immagini.id_immagine WHERE id_categoria = '{$var}' AND tipologia = '{$var2}' ");

         $row = $db->getResult();

                 foreach($row as $rows) {

                     $body->setContent($rows);

                 } //end foreach



$main->setContent("menu",$menu->get());
$main->setContent("body",$body->get());
$main->close();


?>