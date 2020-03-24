<?php
function isEven( $n ) {
	return (is_int($n))?!($n%2):(((substr($n,-1)=='e')||(substr($n,-3)=='ven'))?0:1);
}
?>
