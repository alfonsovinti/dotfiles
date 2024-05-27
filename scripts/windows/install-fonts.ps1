# # Windows font variables
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)

# # Loop through provided input directories

for ($i = 0; $i -lt $args.count; $i++)
{
    Write-Host "Checking $($args[$i]) for fonts that need to be installed..."
    
    # Current directory being checked
    $Path=$($args[$i])
    $FontItem = Get-Item -Path $Path
    
    $FontList = Get-ChildItem -Recurse -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')
    $Fontdir = dir $Path

    foreach($File in $FontList)
    {
        $name = $File.baseName

        if(!($file.name -match "pfb$"))
        {
            $try = $true
            $installedFonts = @(Get-ChildItem C:\Users\$USERNAME\AppData\Local\Microsoft\Windows\Fonts | Where-Object {$_.PSIsContainer -eq $false} | Select-Object basename)
        
            foreach($font in $installedFonts)
            {
                $font = $font -replace "_", ""
                $name = $name -replace "_", ""

                if ($font -match $name)
                {
                    $try = $false
                }
            }
            if ($try)
            {
                Write-Host "Installing $name"
                #$objFolder.CopyHere($File.fullname)
                Write-Host "-> Successfully installed $name"
            } else
            {
                Write-Warning "Font $name already installed. Skipping..."
            }
        }
    }
}
