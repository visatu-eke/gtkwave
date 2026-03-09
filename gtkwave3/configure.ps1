$bash   = "C:\msys64\usr\bin\bash.exe"
$srcDir = "/c/Visa/repo/gtkwave/gtkwave3"

$configureFlags = @(
    "--enable-judy",
    "--prefix=/ucrt64"
) -join " "

$commands = @(
    "MSYSTEM=UCRT64 source /etc/profile",
    "cd $srcDir",
    "autoreconf -fi 2>&1 | tee configure.log",
    "./configure $configureFlags 2>&1 | tee -a configure.log"
) -join " && "

& $bash --login -i -c $commands
