color B

del  .PublishFiles\*.*   /s /q

dotnet restore

dotnet build

cd XCoreProject.Api

dotnet publish -o ..\XCoreProject.Api\bin\Debug\netcoreapp3.1\

md ..\.PublishFiles

xcopy ..\XCoreProject.Api\bin\Debug\netcoreapp3.1\*.* ..\.PublishFiles\ /s /e 

echo "Successfully!!!! ^ please see the file .PublishFiles"

cmd