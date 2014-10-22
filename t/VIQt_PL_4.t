#!/usr/bin/perl

use lib './blib/lib';
use strict;
use constant DEBUG => 1;

BEGIN {
    # to handle systems with no installed Test module
    # we include the t dir (where a copy of Test.pm is located)
    # as a fallback
    eval { require Test; };
    if( $@ ) { 
	use lib 't';
    }
    use Test;
    plan tests => 18 }

print "Loading Video::Info::Quicktime_PL...\n";
use Video::Info::Quicktime_PL;
ok(1);

my $file = Video::Info::Quicktime_PL->new(-file=>'eg/sample4.mov'); # p8241014.mov');
ok $file;
ok $file->probe;
ok $file->achans       == 1;
ok $file->arate        == 22050;
ok $file->astreams     == 0;
ok int($file->fps)     == 0;
ok $file->height       == 240;
ok $file->scale        == 0;
ok $file->type         eq 'moov';
ok $file->vcodec       eq 'SVQ1';
ok $file->vframes      == 45;
ok $file->vrate        == 0;
ok $file->vstreams     == 0;
ok $file->width        == 200;
ok int($file->duration)== 3;
# ok $file->acodecraw    eq '';
# ok $file->acodec       eq '';
ok($file->title,"QuickTime 4 Sample Movie");
ok($file->copyright,"� 1999 Apple Computer, Inc.");

do {
print 'achans   '    .$file->achans       ."\n";
print 'arate    '    .$file->arate        ."\n";
print 'astreams '    .$file->astreams     ."\n";
print 'fps      '    .int($file->fps)     ."\n";
print 'height   '    .$file->height       ."\n";
print 'scale    '    .$file->scale        ."\n";
print 'type     '    .$file->type         ."\n";
print 'vcodec   '    .$file->vcodec       ."\n";
print 'vframes  '    .$file->vframes      ."\n";
print 'vrate    '    .$file->vrate        ."\n";
print 'vstreams '    .$file->vstreams     ."\n";
print 'width    '    .$file->width        ."\n";
print 'duration '    .$file->duration     ."\n";
# print 'acodecraw'    .$file->acodecraw    ."\n";
# print 'acodec   '    .$file->acodec       ."\n";
print 'title    '    .$file->title        ."\n";
print 'copyright'    .$file->copyright    ."\n";
} if DEBUG;

