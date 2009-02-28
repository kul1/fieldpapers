<?php

    ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.'../lib');
    ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.'/usr/home/migurski/pear/lib');
    require_once 'init.php';
    require_once 'data.php';
    
    $scan_id = $_GET['scan'] ? $_GET['scan'] : null;
    $object_id = $_GET['key'] ? $_GET['key'] : null;
    $expected_etag = $_GET['etag'] ? $_GET['etag'] : null;
    
    /**** ... ****/
    
    $dbh =& get_db_connection();
    
    if($scan_id && $object_id && $expected_etag)
    {
        $url = s3_signed_object_url($object_id, time() + 300, 'HEAD');
        $etag_match = verify_s3_etag($object_id, $expected_etag);
        $scan = get_scan($dbh, $scan_id);
        
        if($etag_match && $scan && $scan['last_step'] <= 1)
        {
            $dbh->query('START TRANSACTION');
            add_step($dbh, $scan['id'], 1, 'Queued it up');
            $dbh->query('COMMIT');
            
            $scan = get_scan($dbh, $scan['id']);
        }
        
        header('Content-Type: text/plain');
        print_r($scan);
        print_r($_GET);
    }

?>
