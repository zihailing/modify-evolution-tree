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
					$arr2[$j]=~s/([\d|\.]+):(.*)/'$1':$2/;
					if($j==@arr2-1){
						print "$arr2[$j],";
					}else{
						print "$arr2[$j])";
					}
				}else{
					if($j==@arr2-1){
						if($i==@arr1-1){
							if($arr2[$j]!~/:|;/){
								print "$arr2[$j]:0.001\n"
							}else{
								print "$arr2[$j]\n";
							}
						}else{
							if($arr2[$j]!~/:|;/){
								print "$arr2[$j]:0.001,";
							}else{
								print "$arr2[$j],";
							}
						}
					}else{
						if($arr2[$j]!~/:|;/){
							print "$arr2[$j]:0.001)";
						}else{
							print "$arr2[$j])";
						}
					}
				}
			}
		}else{
			if($i==@arr1-1){
				if($arr1[$i]!~/:|;/){
					print "$arr1[$i]:0.001\n";
				}else{
					print "$arr1[$i]\n";
				}
			}else{
				if($arr1[$i]!~/:|;/){
					print "$arr1[$i]:0.001,";
				}else{
					print "$arr1[$i],";
				}
			}
		}
	}
}
