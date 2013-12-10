use English;

foreach $file (@ARGV) {
    open (IN, $file);
    
    while ($line = <IN>) { 
        $line =~ s/\|//g;
	@d = split(/\s+/,$line);
	$hash{$d[7]} .= "$d[0]\.\.$d[1]" . "\t";
        $ohash{ref} .= "$d[2]\.\.$d[3]" . "\t";
    }
}

foreach $key (keys %hash) {
    print ">$key\n$hash{$key}\n";
}

die;
@list = sort {$a<=>$b} split(/\s+/, $ohash{ref});

foreach $cord (@list) {
    ($start,$end) = split(/\.\./,$cord);
    
    if (($start>=$start_b4) && ($start<=$end_b4)) {
        print ">Start Overlap\n$cord\t$start_b4..$end_b4\n\n";
$tally++;    
}
    
    # if (($end>=$start_b4) && ($end<=$end_b4)) {
#         print "End Overlap\n";
# 	$tally++;
    #}
    ($start_b4,$end_b4) = ($start,$end);
}
print "\n\n$tally\n\n";
