
namespace MediaNexus.Core.Models;

public class MediaModel
{
    public int MediaId { get; set; }
    public  required string Title { get; set; }
    public string? Description { get; set; }
    public required MediaType Type { get; set; }
    public required DateTime StartDate { get; set; }
    public DateTime? EndDate { get; set; }
    public int TotalCount { get; set; }
    public required MediaUnit Unit { get; set; }
}