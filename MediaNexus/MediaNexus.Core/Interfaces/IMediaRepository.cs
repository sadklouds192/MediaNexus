using MediaNexus.Core.Models;

namespace MediaNexus.Core.Interfaces;

public interface IMediaRepository : IReadDataRepository<MediaModel>
{
    IEnumerable<MediaModel> GetByGenre(string connectionString);
    IEnumerable<MediaModel> GetByType(string connectionString);
}