package kr.ac.kopo.util;

public class LangNameConverter {

    public String convert(String target){
        String str;

        if(target.equals("nodejs") || target.equals("vuejs")){
            str = target.replace("nodejs", "Node.js")
                    .replace("vuejs","Vue.js");
        } else {
            str = target.replace("java", "Java")
                    .replace("python", "Python")
                    .replace("ummlang", "Umm Lang")
                    .replace("ruby", "Ruby")
                    .replace("swift", "Swift")
                    .replace("kotlin", "Kotlin")
                    .replace("js", "Java Script")
                    .replace("ts", "Type Script")
                    .replace("react", "React")
                    .replace("angular", "Angular");
        }

        return str;
    }
}
