Set-Location -Path $PSScriptRoot

$directories = 'common', 'windows'

$directories | ForEach-Object {
  $directory = $_

    Get-ChildItem -Path $directory | ForEach-Object {
      $fileName = $_.Name

      if ($fileName -eq 'nvim') {
        New-Item -Force -ItemType SymbolicLink -Path $HOME\AppData\Local\$fileName -Value $PWD\$directory\$fileName

        return
      }

      New-Item -Force -ItemType SymbolicLink -Path $HOME\$fileName -Value $PWD\$directory\$fileName
    }
}
