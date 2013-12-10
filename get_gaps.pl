use English;
$/ = ">";
<>;
while (<>) {
chomp;    
/\n/;
($header,$coords) = ($PREMATCH,$POSTMATCH);

while ($coords =~ /(\S+)/g) {
    $coord = $1;
($start,$end) = split(/\.\./, $coord);

($gap_tally++) 
    || (($previous_end = $end)
    && next);

print ">$header GAP#$gap_tally \($previous_end\.\.$start\)\n";
    $previous_end = $end;
}
}
