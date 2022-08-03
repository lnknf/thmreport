add_cus_dep('glo', 'gls', 0, 'makeglossaries');

sub makeglossaries {
system "makeglossaries $_[0]";
if ( -z "$_[0].glo" ) {
print "Latexmk: Empty glo file, I am making dummy gls file\n";
open GLS, ">$_[0].gls";
close GLS;
}
return 0;
}