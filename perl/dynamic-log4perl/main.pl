#!/usr/bin/perl                                                                                                                                             

use strict;
use Log::Log4perl qw(get_logger :levels);

sub init_logger {
    my ($config_file) = @_;
    Log::Log4perl->init_and_watch($config_file, 60);
    return $logger = get_logger();
}


my $_logger = init_logger("log4perl.conf");
