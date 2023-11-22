#Aantal karakters kan aangepast worden, hoe?
#pas "$currentName.Length -ge 5" aan & "$currentName.Substring(5)"

#Pas pad aan naar juiste map
$directoryPath = "C:\Users\jonas\OneDrive - PXL\Bureaublad\Test"


$files = Get-ChildItem -Path $directoryPath

# Veranderd de gevraagde aantal karakters
$newPrefix = Read-Host -Prompt "Enter new first 5 characters:"

# Loop through each file and rename it
foreach ($file in $files) {
    # Get the current filename
    $currentName = $file.Name

    # Controle als het bestand minstens gegevraagde karakters heeft (5)
    if ($currentName.Length -ge 5) {
        # Build the new filename
        $newName = $newPrefix + $currentName.Substring(5)

        $newPath = Join-Path -Path $directoryPath -ChildPath $newName

        Rename-Item -Path $file.FullName -NewName $newName -Force
    }
}

Write-Host "Files have been renamed successfully."
start-sleep -Seconds 3
