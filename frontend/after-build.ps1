# 3. Remove existing static folder
Remove-Item -Path ..\static -Recurse -Force

# 4. Move build folder to ..\static
Move-Item -Path .\build -Destination ..\static

# 5. Move the contents inside ..\static\static\js to ..\static\static\
Move-Item -Path ..\static\static\js\* -Destination ..\static\static\

# 6. Remove the empty js folder
Remove-Item -Path ..\static\static\js -Force

# 7. Rename ..\static\static folder to js
$currentPath = (Get-Location).Path
Move-Item -Path "$currentPath\..\static\static\" -Destination "$currentPath\..\static\js\"