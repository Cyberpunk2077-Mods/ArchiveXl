param ($StageDir, $ReleaseBin, $ProjectName)

if (@(Get-ChildItem -Path "bundle/packed/archive/pc/mod" -Filter *.archive -File -ErrorAction Stop).Count -eq 0) {
    throw "No compiled archive found in bundle/packed/archive/pc/mod"
}

$BundleDir = "${StageDir}/red4ext/plugins/${ProjectName}/Bundle"

New-Item -ItemType directory -Force -Path ${BundleDir} | Out-Null
Copy-Item -Path "bundle/packed/archive/pc/mod/*" -Destination ${BundleDir}
Copy-Item -Path "bundle/source/resources/*" -Destination ${BundleDir}
