# LIST SKILL FILES
Get-ChildItem -Recurse "C:\Users\DELL\.agents\skills\grill-me" | ForEach-Object { $_.FullName }