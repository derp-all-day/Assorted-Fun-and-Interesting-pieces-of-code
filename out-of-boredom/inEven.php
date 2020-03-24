<?php
function isEven( $n ) {
	return (is_int($n))?(!($n%2)):((in_array(substr($n,-1),['e','ven'])||in_array(substr($n,-3),['e','ven']))?false:true);
}
?>
