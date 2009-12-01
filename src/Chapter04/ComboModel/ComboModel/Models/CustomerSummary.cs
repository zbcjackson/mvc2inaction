namespace ComboModel.Models
{
	public class CustomerSummary
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public int Number { get; set; }
		public bool Active { get; set; }
		public string ServiceLevel { get; set; }
		public string OrderCount { get; set; }
		public string MostRecentOrderDate { get; set; }
	}
}