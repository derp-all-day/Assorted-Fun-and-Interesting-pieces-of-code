<?php
//Function to emulate 32bit int wrapping
function emulate_unsigned_32bit_int($number) {
    while($number > 2147483647) {
        $number -= 4294967296;
    }
    while($number < -2147483648) {
        $number += 4294967296;
    }
    return $number;
}
?>
