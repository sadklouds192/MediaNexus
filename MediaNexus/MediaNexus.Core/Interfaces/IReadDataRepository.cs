namespace MediaNexus.Core.Interfaces;

public interface IReadDataRepository<T>
{
    T GetDataById(string connectionString, int id);
    IEnumerable<T> GetAllData(string connectionString);
}