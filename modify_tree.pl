#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($file)=@ARGV;
my $in=FileHandle->new("< $file");

while(<$in>){
	chomp;
	my @arr1=split(",",$_);
	for(my $i=0; $i<@arr1; $i++){
		if($arr1[$i]=~/\)/){
			my @arr2=split(/\)/,$arr1[$i]);
			for(my $j=0; $j<@arr2; $j++){
				if($arr2[$j]=~/[\d|\.]+:.*/){
					$arr2[$j]=~s/([\d|\.]+):(.*)/:$2\[$1\]/;
					if($j==@arr2-1){
						print "$arr2[$j],";
					}else{
						print "$arr2[$j])";
					}
				}else{
					if($j==@arr2-1){
						if($i==@arr1-1){
							print "$arr2[$j]\n";
						}else{
							print "$arr2[$j],";
						}
					}else{
						print "$arr2[$j])";
					}
				}
			}
		}else{
			if($i==@arr1-1){
				print "$arr1[$i]\n";
			}else{
				print "$arr1[$i],";
			}
		}
	}
}
