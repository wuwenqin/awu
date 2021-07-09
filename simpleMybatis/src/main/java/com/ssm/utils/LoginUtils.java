package com.ssm.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class LoginUtils {

    public   boolean isChinaPhoneLegal(String str) throws PatternSyntaxException {
        String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
        Pattern p = Pattern.compile(regExp);
        Matcher m = p.matcher(str);
        return m.matches();
    }

    public   boolean isLetterDigit(String str){
        boolean isDigit=false;
        boolean isLetter=false;
        for(int i=0;i<str.length();i++){
            if(Character.isDigit(str.charAt(i))){
                isDigit=true;
            }
            else if(Character.isLetter(str.charAt(i))){
                isLetter=true;
            }
        }
        String regex="^[a-zA-Z0-9]{6,12}$";
        boolean isRight=isDigit&& isLetter && str.matches(regex);
        return isRight;
    }

}
