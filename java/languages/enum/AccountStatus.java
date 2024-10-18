// from https://howtodoinjava.com/java/enum/enum-with-multiple-values/
public enum AccountStatus 
{
    PURGED("P", "purged", -1),
    INACTIVE("I", "inactive", 0),
    ACTIVE("A", "active", 1);

    private final String shortName;
    private final String fullName;
    private final int code;

    AccountStatus(String shortName, String fullName, int code) {
        this.shortName = shortName;
        this.fullName = fullName;
        this.code = code;
    }

    public String getShortName() {
        return shortName;
    }

    public String getFullName() {
        return fullName;
    }

    public int getCode() {
        return code;
    }

    // Reverse lookup methods
    public static Optional<AccountStatus> getAccountStatusByValue(String value) {
        return Arrays.stream(AccountStatus.values())
            .filter(accStatus -> accStatus.shortName.equals(value) 
                || accStatus.fullName.equals(value))
            .findFirst();
    }
    
    public static Optional<AccountStatus> getAccountStatusByValue(int value) {
        return Arrays.stream(AccountStatus.values())
            .filter(accStatus -> accStatus.code == value)
            .findFirst();
    }
}