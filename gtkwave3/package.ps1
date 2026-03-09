$bash     = "C:\msys64\usr\bin\bash.exe"
$srcDir   = "/c/Visa/repo/gtkwave/gtkwave3"
$stageDir = "/c/Visa/repo/gtkwave/gtkwave3/dist/ucrt64"
$zipOut   = "C:\Visa\repo\gtkwave\gtkwave3\gtkwave-windows.zip"

$commands = @(
    "MSYSTEM=UCRT64 source /etc/profile",
    "cd $srcDir",
    "rm -rf dist",
    "make DESTDIR=`$(pwd)/dist install 2>&1 | tee package.log",
    "echo EXIT:`$?"
) -join " && "

& $bash --login -i -c $commands

if (Test-Path $zipOut) { Remove-Item $zipOut }

# The staged tree is dist/ucrt64/... — zip it so extracting to C:\msys64 gives C:\msys64\ucrt64\...
$stageWin = "C:\Visa\repo\gtkwave\gtkwave3\dist"
if (Test-Path $stageWin) {
    Compress-Archive -Path "$stageWin\ucrt64" -DestinationPath $zipOut
    Write-Host "Package written to: $zipOut"
    Write-Host "Coworkers extract to C:\msys64\ (merging ucrt64\ into existing)"
} else {
    Write-Host "Staging directory not found - check package.log for errors"
}
