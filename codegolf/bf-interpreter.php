<?php
//BrainF*ck code goes here
$bf='';
 
//Interprets the code
$p=0;while($i<strlen($bf)){
    $c.=['>'=>'$p++;','<'=>'$p--;','+'=>'$b[$p]++;','-'=>'$b[$p]--;','['=>'while($b[$p]){',']'=>'}','.'=>'echo chr($b[$p]);'][$bf[$i++]];
}
eval($c);
?>
