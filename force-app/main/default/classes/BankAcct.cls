public class BankAcct {
    private Integer balance=0;
    public String acctName;
    
    public String acctType;
    
    
    public void makeDeposit(Integer deposit)
    {
        balance=balance+deposit;
    }
    
    public Integer getBalance()
    {
        return balance;
    }

}