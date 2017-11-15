<?php

//session_start();

require("../include/dbms.inc.php");
require("../include/template2.inc.php");
require("../include/auth.inc.php");


$nome1 = isset($_POST['selezione1'])?$_POST['selezione1'] : false;
$nome2 = isset($_POST['selezione2'])?$_POST['selezione2'] : false;


    $main = new Template("index.html");
    $categoria = new Template("add-prodotto.html");


    $db->query("SELECT * FROM categorie"); //foreach per selectbox categorie

    $row = $db->getResult();

    foreach($row as $rows) {

        $categoria->setContent($rows);

    } //end foreach

    $db->query("SELECT * FROM immagini"); //foreach per selectbox immagini

    $rowimm = $db->getResult();

    foreach($rowimm as $rowsimm) {

        $categoria->setContent($rowsimm);

    } //end foreach



if (isset($_POST['sub'])) {
$titolo = $_POST['titolo'];
$db->query("SELECT titolo FROM prodotti WHERE titolo='$titolo'");

    $duplicate = $db->getResult();

    $duplicate1 = $db->getNumRows();

    if($duplicate1 == 1){

        $categoria->setContent ("aggiuntoErrore","aggiuntoErrore");
    }

    else {

        $var = $db->query("INSERT INTO prodotti (titolo, tipologia, prezzo, quantita, descrizione, id_immaginePrincipale, id_categoria)
        VALUES
        (
        '{$_POST['titolo']}',
        '{$_POST['tipologia']}',
         {$_POST['prezzo']},
         {$_POST['quantita']},
        '{$_POST['descrizione']}',
        '{$_POST['selezione1']}',
        '{$_POST['selezione2']}'
        )"
        );
		
		

        $categoria->setContent ("aggiunto","aggiunto");
    }

}



$main->setContent("content",$categoria->get());
$main->close();


?>
