param(
    [string]$Project = "CleanArchTemplate",
    [string]$Server = "(localdb)\mssqllocaldb",
    [string]$Database = "CleanAppDB",
    [string]$Tables = "" # Belirli tabloları çekmek için: "Products,Orders"
)

$ConnectionString = "Server=$Server;Database=$Database;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True;"

$ScaffoldArgs = @(
    "ef", "dbcontext", "scaffold", $ConnectionString, "Microsoft.EntityFrameworkCore.SqlServer",
    "--project", "$Project/src/$Project.Infrastructure",
    "--startup-project", "$Project/src/$Project.WebApi",
    "--context", "ApplicationDbContext",
    "--context-dir", "Persistence",
    "--output-dir", "../$Project.Domain/Entities",
    "--namespace", "$Project.Domain.Entities",
    "--context-namespace", "$Project.Infrastructure.Persistence",
    "--no-onconfiguring",
    "--use-database-names",
    "--force"
)

if ($Tables -ne "") {
    foreach ($table in $Tables.Split(",")) {
        $ScaffoldArgs += "--table"
        $ScaffoldArgs += $table.Trim()
    }
}

Write-Host "Proje: $Project | Sunucu: $Server | Veritabani: $Database" -ForegroundColor Cyan
dotnet @ScaffoldArgs
Write-Host "Tamamlandi! Entity'ler src/$Project.Domain/Entities altina uretildi." -ForegroundColor Green