#!/usr/bin/perl                                                                                                                                             

use strict;
use POSIX q(strftime);
use File::Basename;
use Log::Log4perl qw(get_logger :levels);
#use Log::Log4perl::Level;

sub init_logger {
    my ($config_file) = @_;
#    Log::Log4perl::Logger::create_custom_level("UPDATE", "TRACE");
    Log::Log4perl->init_and_watch($config_file, 60);
    return get_logger();
}

my $logger = init_logger("log4perl.conf");
my $current_client_id = undef;

sub handle_job {
    my ($client_id, $text) = @_;
    $current_client_id = $client_id;
    $logger = init_logger("log4perl.conf");
    $logger->info("$client_id $text");
#    $logger->update("$client_id $text");
}

sub getLogFilename
{
  return sprintf("log/%s_%s_%s.log", strftime( "%Y%m%d_%H%M", localtime()), basename( $0, '.pl'), $current_client_id);
}

for (my $i = 0; $i < 50; $i++) {
    handle_job($i, "abc $i");
}


