package Perldoc::Config_pd;

use strict;
use warnings;
use Config;

our $VERSION = '0.01';


#--------------------------------------------------------------------------

our %option = (
  output_path  => '/tmp/perldoc',
  site_href    => 'http://si-airbag-web/support/testportal/common/LIFT/',
  site_title   => 'TurboLIFT',
  perl_version => sprintf("%vd",$^V),
  inc          => [@INC],
  pdf          => 1,
  bin          => $Config{bin},
);
