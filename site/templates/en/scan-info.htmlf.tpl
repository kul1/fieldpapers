<h2>Scanned Map</h2>
            
{if $scan.description}
    <p style="font-style: italic;">
        {$scan.description|escape}
    </p>
{/if}

<p>
    Covers the area near

    {if $print.place_woeid}
        <a id="print-location" href="http://www.openstreetmap.org/?lat={$print.latitude|escape}&amp;lon={$print.longitude|escape}&amp;zoom=15&amp;layers=B000FTF">
            {$print.latitude|nice_degree:"lat"|escape}, {$print.longitude|nice_degree:"lon"|escape}</a>
        <br>
        {$print.place_name|escape}

    {else}
        <a id="print-location" href="http://www.openstreetmap.org/?lat={$print.latitude|escape}&amp;lon={$print.longitude|escape}&amp;zoom=15&amp;layers=B000FTF">
            {$print.latitude|nice_degree:"lat"|escape}, {$print.longitude|nice_degree:"lon"|escape}</a>
    {/if}
    <br>
    Uploaded {$scan.age|nice_relativetime|escape}.
</p>

{if !$print.place_woeid}
    <script type="text/javascript" language="javascript1.2">
    // <![CDATA[
    
        var onPlaces = new Function('res', "appendPlacename(res, document.getElementById('print-location'))");
        var flickrKey = '{$constants.FLICKR_KEY|escape}';
        var lat = {$print.latitude|escape};
        var lon = {$print.longitude|escape};
        
        getPlacename(lat, lon, flickrKey, 'onPlaces');

    // ]]>
    </script>
{/if}

<p>
    <a href="{$base_dir}/scan-large.php?id={$scan.id}">
        <img border="1" src="{$scan.base_url}/preview.jpg"></a>
</p>

<p style="background-color: #000; text-align: center; color: #fff">
    <b>Notes about this scan</b>
    <br><br>
    {if $scan_note}
        {$scan_note}
    {else}
        There are no notes associated with this scan! 
        <br><br><a href="{$base_dir}/page.php?id={$scan.id}">Create some notes!</a>
    {/if}
</p>
        
<p>
    Download a <a href="{$base_dir}/print.php?id={$scan.print_id|escape}">fresh map of this area from print #{$scan.print_id|escape}</a>.
</p>

{if $scan.has_geotiff == "yes" || $scan.has_geojpeg == "yes"}
    <p>
        <a href="{$base_dir}/scan-large.php?id={$scan.id|escape}">Geodata for this scan</a>.
    </p>
{/if}
