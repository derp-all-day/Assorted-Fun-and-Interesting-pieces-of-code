<?php
/* Function: proxy()
 * Desc: Grab proxy lists
 * Args:
 * $type: Type of proxy
 *     types - usa, ssl, uk, socks, anonymous
 * Author: Andrew B.
 */
function proxy($type) {
    $types = array(
    	'usa'=>'http://www.us-proxy.org/',
    	'ssl'=>'http://www.sslproxies.org/',
    	'uk'=>'http://free-proxy-list.net/uk-proxy.html',
    	'socks'=>'http://www.socks-proxy.net/',
    	'anonymous'=>'http://free-proxy-list.net/anonymous-proxy.html'
    );
    if(!isset($types[$type])) {
        return "Usage: ?type={Proxy type}\nTypes: usa, ssl, uk, socks, anonymous";
    }
    $source = file_get_contents($types[strtolower($_GET['type'])]);
    preg_match_all('/<tbody>(.*?)<\/tbody>/is', $source, $matches);
    $array = explode("\n", $matches[1][0]);
    $return = array();
    foreach($array as $line) {
    	$line = explode(str_replace('</tr></td>','',str_replace('<tr><td>','',$line)),$line);
    	if(isset($line[0]) && isset($line[1])) {
    		$return[] = array($line[0], $line[1]);
    	}
    }
    return json_encode($return);
}
?>
