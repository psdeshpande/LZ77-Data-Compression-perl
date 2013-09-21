#!/usr/bin/perl 

sub compression
{
    my $str = shift;
    {
		use bytes;
		my $byte_size = length($str);
		print "Original Text Before Compression: $str\n";
		print "Size of text before compression in bytes: $byte_size\n";
	}
	die "Sorry, code too long\n" if length($str) >= 1<<16;
    my @rep;
    my $la = 0;
	while ($la < length $str) {
	my $n = 1;
	my ($tmp, $p);
	$p = 0;
	while ($la + $n < length $str
	       && $n < 255
	       && ($tmp = index(substr($str, 0, $la),
				substr($str, $la, $n),
				$p)) >= 0) {
	    print "inside loop\n";
		$p = $tmp;
	    $n++;
		print "n is:: $n";
		print "p is:: $p";
		
	}
	
	--$n;
	my $c = substr($str, $la + $n, 1);
	push @rep, [$p, $n, ord $c];
	$la += $n + 1;
    }
	 
    join('', map { pack 'SCC', @$_ } @rep);
	
}

sub decompression
{
    my $str = shift;
    {
		use bytes;
		my $byte_size1 = length($str);
		print "Size of text after compression in bytes: $byte_size1\n";
	}
	
	my $ret = '';
    while (length $str) {
	my ($s, $l, $c) = unpack 'SCC', $str;
	$ret .= substr($ret, $s, $l).chr$c;
	$str=substr($str,4);
    }

    $ret;
}

my @compressed = compression('TOBEORNOTTOBEORTOBEORNOTTOBE');
print "Text After Compression is: @compressed\n";
my $decompressed = decompression(@compressed);
print "Decompression is: $decompressed\n";

