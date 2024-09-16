public class WrapperClass1 {
 public Boolean isSelected {get;set;}
 public Contact contactRecord {get;set;}
 public WrapperClass1(Contact contactRecord, Boolean isSelected) {
    this.contactRecord = contactRecord;
    this.isSelected = isSelected;
 }
 }