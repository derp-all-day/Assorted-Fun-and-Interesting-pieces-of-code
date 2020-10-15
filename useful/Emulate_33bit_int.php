<?php

//Function to emulate 32bit int wrapping
function emulate_unsigned_32bit_int($x) {
    while($x > 2147483647) {
        $x = $x - 4294967296;
    }
    while($x < -2147483648) {
        $x = $x + 4294967296;
    }
    return $x;
}
?>
