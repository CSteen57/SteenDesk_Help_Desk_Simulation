New-Item -ItemType Directory -Path "$env:USERPROFILE\Documents\Stanley_Redeployment_Test" -Force

Set-Content -Path "$env:USERPROFILE\Documents\Stanley_Redeployment_Test\Stanley_Redeployment_Test_File.txt" -Value "This file validates that Stanley Hudson's User-specific files were preserved and restored after the workstation redeployment."

