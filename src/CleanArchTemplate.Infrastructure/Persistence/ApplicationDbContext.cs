using CleanArchTemplate.Application.Common.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace CleanArchTemplate.Infrastructure.Persistence;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) 
    : DbContext(options), IApplicationDbContext
{
    // DbSet<Entity> tanımlarınız buraya gelecek
}
