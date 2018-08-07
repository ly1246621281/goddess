package goddess.utility;

import java.util.HashMap;
import java.util.Map;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;


public class Config {
	private static PropertiesConfiguration config;
	private static final Map<String, PropertiesConfiguration> CONFIGURATIONS = new HashMap<String, PropertiesConfiguration>();
	private static Config instance = null;
	private Config()
	{
        String name = "/goddess.properties";
        config = CONFIGURATIONS.get(name);
        if (config == null)
        {
            try
            {    
                config = new PropertiesConfiguration(name);
                config.setReloadingStrategy(new FileChangedReloadingStrategy());
                CONFIGURATIONS.put(name, config);
            }
            catch (ConfigurationException e)
            {
                throw new RuntimeException("cannot find property file for : " + name);
            }
        }
	}
    

    public static String getString(String key)
    {
    	if(instance == null)
    		instance = new Config();
        return config.getString(key);
    }
    
    public static void main(String[] args)
    {
    	System.out.println(Config.getString("appid"));
    }

}
