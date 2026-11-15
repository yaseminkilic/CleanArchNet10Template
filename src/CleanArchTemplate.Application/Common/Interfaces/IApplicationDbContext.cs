using Microsoft.EntityFrameworkCore;

namespace CleanArchTemplate.Application.Common.Interfaces;

public interface IApplicationDbContext
{
    Task<int> SaveChangesAsync(CancellationToken cancellationToken);
}
