package ie.mf.gtp.languages;

import static ie.mf.gtp.languages.LanguageCodes.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class Languages {

    private static final Map<String, String> map;

    static {
        // Instantiate the map and populate it with key-value pairs
        // Using a LinkedHashMap as for some reason this will preserve ordering when populating the key set into an ArrayList whereas a regular HashMap doesn't
        map = new LinkedHashMap<>();
        map.put(EN_LANGUAGE_NAME,EN_LANGUAGE_CODE);
        map.put(DE_LANGUAGE_NAME,DE_LANGUAGE_CODE);
        map.put(FR_LANGUAGE_NAME,FR_LANGUAGE_CODE);
    }

    public static ArrayList<String> getListOfLangNames(){
        return new ArrayList<>(map.keySet());
    }

    public static String getLanguageCode(String name){
        return map.get(name);
    }
}
