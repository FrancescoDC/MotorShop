<?php

session_start();

require("include/dbms.inc.php");
require("include/template2.inc.php");
require ("include/varie.php");


$body = new Template("prezzibassi.html");



$db->query("SELECT prodotti.*, immagini.path FROM prodotti left join immagini on prodotti.id_immaginePrincipale= immagini.id_immagine WHERE prezzo <= 100 ORDER BY prezzo ASC");

         $row = $db->getResult();

                 foreach($row as $rows) {

                    $body->setContent($rows);

                 } //end foreach



$main->setContent("menu",$menu->get());
$main->setContent("body",$body->get());
$main->close();


?>
