package c8_dataTypesAndStrings;

import java.util.Scanner;

public class PasswordValidator {

    private String username;
    private String currentPwd;
    private boolean validPwd;
    private String errorMsg;
    private static Scanner sc = new Scanner(System.in);

    public PasswordValidator(String username, String currentPassword){
        this.username = username;
        this.currentPwd = currentPassword;
    }

    public boolean isValid(){
        return validPwd;
    }

    public String getErrorMessage(){
        return errorMsg;
    }

    public void closeScanner(){
        sc.close();
    }

    public static PasswordValidator login(){
        System.out.println("Enter your username:");
        String username = sc.nextLine();

        System.out.println("Enter your password:");
        String password = sc.nextLine();

        return new PasswordValidator(username, password);
    }

    public static void main(String[] args){
        var validator = login();
        validator.printPasswordRules();

        do{
            var proposedPassword = validator.getProposedPassword();
            validator.changePassword(proposedPassword);

            if(!validator.isValid()){
                System.out.println(validator.getErrorMessage());
            }

        }while(!validator.isValid());

        System.out.println("The proposed password is valid");

        validator.closeScanner();
    }

    public void printPasswordRules(){
        System.out.println("Your new password must meet the following requirements:");
        System.out.println("* at least 8 characters long");
        System.out.println("* contain an uppercase letter");
        System.out.println("* contain a special character");
        System.out.println("* not contain the username");
        System.out.println("* not the same as the old password");
        System.out.println();
    }

    public String getProposedPassword(){
        System.out.println("Enter your new password:");
        return sc.nextLine();
    }

    public void changePassword(String newPassword){

        validPwd= true;
        errorMsg = "";

        if(newPassword.length() < 8){
            validPwd = false;
            errorMsg += "\n Your password must be at least 8 characters.";
        }

        //Alternatively, can loop through string and use Character.isUpperCase on each char
        if(newPassword.equals(newPassword.toLowerCase())){
            validPwd = false;
            errorMsg += "\n Your password must include an uppercase letter.";
        }

        if(newPassword.matches("[a-zA-Z0-9 ]*")){
            validPwd = false;
            errorMsg += "\n Your password must include a special character (e.g. %,$[:).";
        }

        if(newPassword.toUpperCase().contains(username.toUpperCase())){
            validPwd = false;
            errorMsg += "\n Your password cannot contain your username.";
        }

        if(newPassword.equals(currentPwd)){
            validPwd = false;
            errorMsg += "\n Your password must be different from your current password.";
        }
    }

}
