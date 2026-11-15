using CleanArchTemplate.Application.Common.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace CleanArchTemplate.Infrastructure.Persistence;

public partial class ApplicationDbContext : IApplicationDbContext
{
    // Scaffold komutu (scaffold-db.ps1) çalıştırıldığında üretilen 
    // "public partial class ApplicationDbContext : DbContext" sınıfı 
    // otomatik olarak bu dosya ile birleşir.
}
