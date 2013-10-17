package utilidades;

public class ObjectoTablaSimbolos {
	public String value;
	public String type;
	public int numOfChar;
	
	public ObjectoTablaSimbolos(String _value, String _type, int _numOfChar) {
		value = _value;
		type = _type;
		numOfChar = _numOfChar;
	}
	
	public ObjectoTablaSimbolos(String _type) {
		value = null;
		type = _type;
		numOfChar = 0;
	}
	
	@Override
	public String toString() {
		if (value == null && numOfChar == 0) {
			return "Tipo: " + type;
		}
		
		return "Tipo: " + type + ", Valor: " + value + ", NumChar: " + numOfChar;
	}
	
}
