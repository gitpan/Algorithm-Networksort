# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl hibbard01.t'

use Test::Simple tests => 1;

use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $algorithm = 'hibbard';
my @network;
my $status;

for my $inputs (16..16)
{
	@network = nw_comparators($inputs, algorithm=>$algorithm);
	$status = zero_one($inputs, \@network);
	if ($status eq "pass")
	{
		ok(1, "$algorithm, N=$inputs");
	}
	else
	{
		ok(0, "$algorithm, N=$inputs, $status");
	}
}
