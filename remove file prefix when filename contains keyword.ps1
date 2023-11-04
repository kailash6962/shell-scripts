# Set the directory where your files are located
$directory = "D:\Movies\Test"

# Get a list of all files in the directory
$files = Get-ChildItem -Path $directory

# Loop through each file and rename it
foreach ($file in $files) {
    # Check if the file name contains a hyphen (-)
    if ($file.Name -match "tamilblasters") {
        # Split the file name at the hyphen and keep the right side
        $newName = $file.Name -split "-", 2 | Select-Object -Last 1

        # Construct the new file path
        $newPath = Join-Path -Path $directory -ChildPath $newName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newName
    }
}

# Output a message when the renaming is complete
Write-Host "File renaming complete."
