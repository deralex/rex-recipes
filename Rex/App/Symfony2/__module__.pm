package Symfony2;

use Rex -base;
use Rex::Commands;

my ($server,
    $username,
    $password,
    $scm,
    $scm_username,
    $scm_password,
    $app_path,
    $app_name
);


task "deploy", sub {
    say "Deploying..."
    
}

task "cache:clear", sub {
    say "Clearing the cache..."
    run "app/console cache:clear --env=prod --no-debug"
}

task "cache:warmup", sub {
    say "Warming up the cache..."
    run "app/console cache:warmup --env=prod --no-debug"
}

task "assets:install", sub {
    say "Installing assets..."
    run "app/console assets:install web/ --env=prod"
}

task "assetic:dump", sub {
    say "Dumping assets..."
    run "app/console assetic:dump web/ --env=prod"
}


task "config", sub {
    my $params = shift;

    my $server = $params->{server};
    my $username = $params->{username};
    my $password = $params->{password};

    my $scm = $params->{scm};

    die("Only git and hg are supported") unless($scm =~ "git" or $scm =~ "hg");

    my $scm_username = $params->{scm_username};
    my $scm_password = $params->{scm_password};

    my $app_path = $params->{app_path};
    my $app_name = $params->{app_name};

}

sub connect {
    if (defined $pubkey) {
    } else {
        Rex::connect(
            server => $server,
            user => $username,
            password => $password
        );
    }
}


1;
