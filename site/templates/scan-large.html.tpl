<!DOCTYPE html>
<html lang="{$language|default:"en"}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>Scanned Map #{$scan.id|escape} (Field Papers)</title>
    <link rel="stylesheet" href="{$base_dir}/style.css" type="text/css">
    <link rel="stylesheet" href="{$base_dir}/scan.css" type="text/css">
    <script type="text/javascript" src="{$base_dir}/script.js"></script>
    <script type="text/javascript" src="{$base_dir}/scan.js"></script>
    
    {if $scan.has_geojpeg == 'yes'}
        {* See templates/scan-large-notes.htmlf.tpl *}

        <link rel="stylesheet" href="{$base_dir}/scan-large.css" type="text/css">
        <script type="text/javascript" src="http://yui.yahooapis.com/combo?3.3.0/build/yui/yui-min.js&3.3.0/build/oop/oop-min.js&3.3.0/build/querystring/querystring-stringify-simple-min.js&3.3.0/build/dom/dom-base-min.js&3.3.0/build/dom/selector-native-min.js&3.3.0/build/dom/selector-css2-min.js&3.3.0/build/event-custom/event-custom-min.js&3.3.0/build/event/event-base-min.js&3.3.0/build/dom/dom-style-min.js&3.3.0/build/dom/dom-style-ie-min.js&3.3.0/build/queue-promote/queue-promote-min.js&3.3.0/build/datatype/datatype-xml-min.js&3.3.0/build/pluginhost/pluginhost-min.js&3.3.0/build/dom/dom-screen-min.js&3.3.0/build/node/node-min.js&3.3.0/build/event/event-base-ie-min.js&3.3.0/build/io/io-min.js&3.3.0/build/event/event-delegate-min.js&3.3.0/build/attribute/attribute-base-min.js&3.3.0/build/base/base-min.js&3.3.0/build/classnamemanager/classnamemanager-min.js&3.3.0/build/event/event-synthetic-min.js&3.3.0/build/event/event-resize-min.js&3.3.0/build/event/event-mouseenter-min.js&3.3.0/build/dd/dd-min.js&3.3.0/build/dd/dd-gestures-min.js&3.3.0/build/dd/dd-drop-plugin-min.js"></script>
        <script type="text/javascript" src="{$base_dir}/scan-large.js"></script>

        <script type="text/javascript">
        // <![CDATA[
        
            var scanid = '{$scan.id|escape:"javascript"}';
            var bounds = '{$scan.geojpeg_bounds|escape:"javascript"}'.split(',').map(parseFloat);
        
            {literal}
        
            window.onload = function()
            {
                YUI().use('dd-constrain', 'io', function(Y) { setup_data_boxes(Y, scanid, bounds) });
            };
        
        // {/literal}]]>
        </script>
    {/if}
</head>
<body>
    {include file="header.htmlf.tpl"}

    {include file="navigation.htmlf.tpl"}
    
    {if $scan}
        {if $scan.decoded}
            {include file="$language/scan-large-info.htmlf.tpl"}
        {/if}
    {/if}
    
    {include file="footer.htmlf.tpl"}
    
</body>
</html>
