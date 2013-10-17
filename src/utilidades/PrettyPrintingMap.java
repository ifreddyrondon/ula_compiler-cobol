package utilidades;

import java.util.Iterator;
import java.util.Map;

public class PrettyPrintingMap<K, V> {

	private Map<K, V> map;

	    public PrettyPrintingMap(Map<K, V> map) {
	        this.map = map;
	    }

	    public String toString() {
	        StringBuilder sb = new StringBuilder();
	        Iterator<java.util.Map.Entry<K, V>> iter = map.entrySet().iterator();
	        while (iter.hasNext()) {
	            java.util.Map.Entry<K, V> entry = iter.next();
	            sb.append(entry.getKey());
	            sb.append('=').append(" ");
	            sb.append(entry.getValue());
	            sb.append("\n");
	        }
	        return sb.toString();

	    }
	
}
