#!/usr/bin/perl

sub inrange { ($min,$max,$value)=@_;
    return $value % ($max - $min) + $min;
}

sub modat { my(@l, $i)=@_; $l_l = @l;
    print ("CALLD modat -> $i -> $l_l -> ", ($i % $l_l), "\n");
    return $l[$i % scalar(@l)];
} 

@dict=(("a".."z") , ("A".."Z") , ("0".."9") ,( "\n"));
$minlen = 5;
$maxlen = 40;



while (<>) {
    sysread STDIN, $in, 1;
    print ord $in; print "\n";
    print modat(@dict, $in);
}

