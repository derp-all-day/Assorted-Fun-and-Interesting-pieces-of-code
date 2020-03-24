<?php
function isEven( $data ) {
	return (is_int($data))?(!($data%2)):((in_array(substr($data,-1),['e','ven'])||in_array(substr($data,-3),['e','ven']))?false:true);
}
?>
