<?php

    require_once '../lib/lib.everything.php';
    
    enforce_master_on_off_switch($_SERVER['HTTP_ACCEPT_LANGUAGE']);
    
    $context = default_context();

    /**** ... ****/
        
    header("Content-Type: text/html; charset=UTF-8");
    print $context->sm->fetch("index.html.tpl");

?>