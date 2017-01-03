package trng.hbrnt;

import java.util.Scanner;

import com.hbrnt.dao.CountryDao;
import com.hbrnt.dao.CustomException;
import com.hbrnt.dao.ICountryDao;
import com.hbrnt.pojo.cache.Country;

public class CountryApp 
{
	
	ICountryDao countryDao;
	static Scanner scanner;
	
	public CountryApp() {
		countryDao = new CountryDao();
		scanner = new Scanner(System.in);
	}
	
    public static void main( String[] args ) throws CustomException {
    	CountryApp countryApp = new CountryApp();
    	System.out.println(countryApp.findCountry(123));
    	System.out.println(countryApp.findCountry(123));
    	System.out.println(countryApp.findCountry(124));
	}

	private Country findCountry(int countryId) {
		return countryDao.findCountry(countryId);
	}
}
