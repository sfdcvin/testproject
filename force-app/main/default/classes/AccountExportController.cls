public class AccountExportController {
    public String csvContent { get; private set; }
    
    public AccountExportController() {
               // Query Account records
        List<Account> accounts = [SELECT Id, Name, Phone, Website FROM Account limit 5];
        
        // Initialize CSV content
        String csvContent = 'Id,Name,Phone,Website\n';
        
        // Append each Account record to the CSV content
        for (Account acc : accounts) {
            csvContent += '"' + acc.Id + '","' + acc.Name + '","' + acc.Phone + '","' + acc.Website + '"\n';
        }
    }
}