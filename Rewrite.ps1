#Aantal karakters kan aangepast worden, hoe?
#pas de "5" in "$currentName.Length -ge 5" & "$currentName.Substring(5)" aan.

#Pas pad aan naar juiste map
$directoryPath = "C:\Users\jonas\OneDrive - PXL\Bureaublad\Test"
$files = Get-ChildItem -Path $directoryPath

$newPrefix = Read-Host -Prompt "Enter new first 5 characters:"

# Loop through each file and rename it
foreach ($file in $files) {
    $currentName = $file.Name

    # Controle als het bestand 5 karakters bevat en dan...
    if ($currentName.Length -ge 5) {
        # Build the new filename
        $newName = $newPrefix + $currentName.Substring(5)

        $newPath = Join-Path -Path $directoryPath -ChildPath $newName

        Rename-Item -Path $file.FullName -NewName $newName -Force
    }
}

Write-Host "Files have been renamed successfully."
start-sleep -Seconds 3
