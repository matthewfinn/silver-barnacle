import java.util.Arrays;
import java.util.Optional;

public class EnumWithMultipleValues 
{
    public static void main(String[] args) 
    {
        //Print all enum and values
        
        for(AccountStatus as : AccountStatus.values()) {
            System.out.println("Status " + as.getCode() + " is : " + as.getFullName());
        }
        
        //Reverse Lookup Examples
        
        Optional<AccountStatus> statusEnum 
            = AccountStatus.getAccountStatusByValue(0);
        
        if(statusEnum.isPresent()) {
            System.out.println("Account Status Full Name: " + statusEnum.get().getFullName());
            System.out.println("Account Status Short name: " + statusEnum.get().getShortName());
        }
        
        Optional<AccountStatus> activeStatusEnum
            = AccountStatus.getAccountStatusByValue("A");
        
        if(statusEnum.isPresent()) {
            System.out.println("Account Status Full Name : " + activeStatusEnum.get().getFullName());
            System.out.println("Account Status Code : " + activeStatusEnum.get().getCode());
        }
    }
}