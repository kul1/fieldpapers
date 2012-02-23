<?php

    require_once '../lib/lib.everything.php';

    enforce_master_on_off_switch($_SERVER['HTTP_ACCEPT_LANGUAGE']);

    session_start();
    $dbh =& get_db_connection();
    remember_user($dbh);
    
    /**** ... ****/
    
    $forms = get_forms($dbh); //forms
    
    if ($_GET["form_id"])
    {
        $default_form_id = $_GET["form_id"];
        $default_form = get_form($dbh, $default_form_id);
    } else {
        $default_form = 'none';
    }
    
    $extent = array('ne' => $_GET['ne'], 'sw' => $_GET['sw']);
    $center = $_GET['center'];
        
    $sm = get_smarty_instance();
    $sm->assign('forms', $forms);
    $sm->assign('default_form', $default_form);
    $sm-> assign('extent', $extent);
    $sm-> assign('center', $center);
    
    header("Content-Type: text/html; charset=UTF-8");
    print $sm->fetch("make-atlas.html.tpl");
?>