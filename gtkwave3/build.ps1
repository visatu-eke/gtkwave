$bash    = "C:\msys64\usr\bin\bash.exe"
$srcDir  = "/c/Visa/repo/gtkwave/gtkwave3"
# $cflags  = "-g -O2 -Wno-incompatible-pointer-types"
$cflags  = "-Wno-incompatible-pointer-types"

$commands = @(
    "MSYSTEM=UCRT64 source /etc/profile",
    "cd $srcDir",
    "make clean",
    "make CFLAGS='$cflags' CXXFLAGS='$cflags' -j`$(nproc) 2>&1 | tee build.log"
) -join " && "

& $bash --login -i -c $commands