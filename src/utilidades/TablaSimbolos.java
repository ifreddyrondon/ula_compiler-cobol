package utilidades;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.*;

public class TablaSimbolos {

	private Map<String, ObjectoTablaSimbolos> tablaSimbolos;
	private String lastKeyEntered;
	private String lastTypeEntered;
	private Boolean initValueOfVar;
	private String clause;

	public TablaSimbolos() {
		setTablaSimbolos(new TreeMap<String, ObjectoTablaSimbolos>());
		setLastKeyEntered(null);
		setLastTypeEntered(null);
		setInitValueOfVar(false);
	}

	/**
	 * Anadir un nuevo objeto a la tabla de simbolos
	 * 
	 * @param _key
	 * @param _type
	 * @param _value
	 * @param _numOfChar
	 */
	public void add(String _key, String _type, String _value, int _numOfChar) {
		ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(_value, _type,
				_numOfChar);
		getTablaSimbolos().put(_key, aux);
		setLastKeyEntered(_key);
	}

	/**
	 * Anadir solo key para cuando se alla procesado ya el TIPO
	 * 
	 * @param _key
	 */
	public void add(String _key) {
		if (lastTypeEntered != null) {
			ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(null,
					lastTypeEntered, 0);
			getTablaSimbolos().put(_key, aux);
			setLastKeyEntered(_key);
		}
	}

	/**
	 * No tomar en cuenta en el informe
	 * 
	 * @param _key
	 * @param _type
	 */
	public void add(String _key, String _type) {
		ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(_type);
		getTablaSimbolos().put(_key, aux);
	}

	/**
	 * Actualizar objeto
	 * 
	 * @param _key
	 * @param _type
	 * @param _value
	 * @param _numOfChar
	 */
	public void updateObject(String _key, String _type, String _value,
			int _numOfChar) {

		if (getTablaSimbolos().get(_key) == null) {
			System.err.println("Error SEMANTICO, var: " + _key
					+ " , no declarada");
		} else {
			getTablaSimbolos().remove(_key);
			ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(_value,
					_type, _numOfChar);
			getTablaSimbolos().put(_key, aux);
			setLastKeyEntered(_key);
		}
	}

	/**
	 * Actualizar ultimo objeto agregado sin necesidad de introducir su
	 * identificador
	 * 
	 * @param _type
	 * @param _value
	 * @param _numOfChar
	 */
	public void updateLastKey(String _type, String _value, int _numOfChar) {

		if (getTablaSimbolos().get(lastKeyEntered) == null) {
			semantic_errors(new ErrorSemantico(lastKeyEntered,
					"No declarada"));
		} else {
			getTablaSimbolos().remove(lastKeyEntered);
			ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(_value,
					_type, _numOfChar);
			getTablaSimbolos().put(lastKeyEntered, aux);
			logSemantico(lastKeyEntered, "Identificador de variable actualizado en la Tabla de Simbolos");
		}
	}

	/**
	 * Actualizar solo el valor del ultimo objeto agregado sin necesidad de
	 * introducir su identificador
	 * 
	 * @param _value
	 * @param _type
	 */
	public void updateValueOfLastKey(String _value, String _type) {
		if (getTablaSimbolos().get(lastKeyEntered) == null) {
			semantic_errors(new ErrorSemantico(lastKeyEntered,
					"No declarada"));
		} else if (getTablaSimbolos().get(lastKeyEntered) != null
				&& initValueOfVar) {
			String type = getTablaSimbolos().get(lastKeyEntered).type;
			if (type.equals(_type)) {
				int numOfChar = getTablaSimbolos().get(lastKeyEntered).numOfChar;
				getTablaSimbolos().remove(lastKeyEntered);
				ObjectoTablaSimbolos aux = new ObjectoTablaSimbolos(
						_value, type, numOfChar);
				getTablaSimbolos().put(lastKeyEntered, aux);
				setInitValueOfVar(false);
			} else {
				semantic_errors(new ErrorSemantico(lastKeyEntered,
						"Tipo incompatible con " + _value));
			}
		}
	}

	/**
	 * Encuentro el tipo de un identificador
	 * 
	 * @param _value
	 * @return Devuelve un String con el tipo del ultimo identificador
	 *         ingresado, serado por coma de el numero de caracteres que se
	 *         pueden ingresar en el
	 */
	public String getTypeOfLastKeyEnteredAndNumOfCharSeparatedByCommas(
			String _value) {
		if (getLastKeyEntered() != null) {

			// Alfanuméricas: se indican con un PIC X(número de
			// caracteres). Podrán tener como valores números y letras.
			if (_value.substring(0, 1).equalsIgnoreCase("x")) {
				return "alfanumerica,"
						+ _value.substring(2, _value.length() - 1);
			}
			// Numeros
			else if (_value.substring(0, 1).equals("9")) {

				// Normales
				if (!_value.contains("V") || !_value.contains("v")) {
					return "entero,"
							+ _value.substring(2,
									_value.length() - 1);
				}
				// Decimales
				else {
					String valueLowerCase = _value.toLowerCase();
					String[] valueFloat = valueLowerCase.split("v");
					return "float,"
							+ _value.substring(
									2,
									valueFloat[0].length() - 1);
				}
			} else if (_value.substring(0, 1).equalsIgnoreCase("Z")) {
				// Normales
				if (!_value.contains(",")) {
					return "entero,"
							+ _value.split(".").toString()
									.length();
				}
				// Decimales
				else {
					String[] valueFloat = _value.split(",");
					return "float,"
							+ valueFloat[0].split(".").toString()
									.length();
				}
			}
			return null;
		}
		return null;
	}

	/**
	 * Verifica que un identificador ya fue ingresado en la tabla de simbolos
	 * 
	 * @param _key
	 * @return
	 */
	public boolean checkKey(String _key) {
		if (getTablaSimbolos().get(_key) == null) {
			semantic_errors(new ErrorSemantico(_key, "No declarada"));
			return false;
		}
		if (clause == "DISPLAY") {
			logSemantico(_key, "DISPLAY :Comprobando la existencia del identificador");
			clause = null;
		}
		else {
			logSemantico(_key, "Comprobando la existencia del identificador");
		}
		return true;
	}

	/**
	 * Guarda un identificador y su tipo en los ultimos ingresados para su
	 * posterior comprobacion
	 * 
	 * @param _key
	 * @param _type
	 */
	public void saveKeyAndTypeInLastEntered(String _key, String _type) {
		lastKeyEntered = _key;
		lastTypeEntered = _type;
	}

	/**
	 * Log Analisis Semantico
	 */
	public void logSemantico(String _identifier, String _reason) {
		FileWriter fw = null;
		PrintWriter pw = null;

		try {
			fw = new FileWriter("src/salidas/out_semantico.txt", true);
			pw = new PrintWriter(fw);
			pw.println("Identificador: " + _identifier + ", Accion: "
					+ _reason);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != fw) {
					fw.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("LOG SEMANTICO, Identificador: "
				+ _identifier + ", Accion: " + _reason);
	}

	/**
	 * Guarda la clause a ejecutar
	 * @param _clause
	 */
	public void saveClause(String _clause){
		setClause(_clause);
	}
	
	
	/**
	 * Rutina para manejo de errores Semanticos
	 * 
	 * @param error
	 */
	public void semantic_errors(ErrorSemantico error) {
		FileWriter fw = null;
		PrintWriter pw = null;

		try {
			fw = new FileWriter("src/salidas/errores_semantico.txt", true);
			pw = new PrintWriter(fw);
			pw.println("Error Semantico");
			if (error.identifier != null) {
				pw.println("Identificador: " + error.identifier
						+ "\nRazon: " + error.reason);
			} else {
				pw.println("Razon: " + error.reason);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != fw) {
					fw.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.err.println("ERROR SEMANTICO, Identificador: "
				+ error.identifier + ", razon: " + error.reason);
	}

	/**
	 * Imprime en un String la tabla de simbolos
	 * 
	 * @return
	 */
	public String print() {
		String tablaSimbolosString = new PrettyPrintingMap<String, ObjectoTablaSimbolos>(
				getTablaSimbolos()).toString();
		return tablaSimbolosString;
	}

	/**
	 * @return the lastKeyEntered
	 */
	public String getLastKeyEntered() {
		return lastKeyEntered;
	}

	/**
	 * @param lastKeyEntered
	 *              the lastKeyEntered to set
	 */
	public void setLastKeyEntered(String lastKeyEntered) {
		this.lastKeyEntered = lastKeyEntered;
	}

	/**
	 * @return the lastTypeEntered
	 */
	public String getLastTypeEntered() {
		return lastTypeEntered;
	}

	/**
	 * @param lastTypeEntered
	 *              the lastTypeEntered to set
	 */
	public void setLastTypeEntered(String lastTypeEntered) {
		this.lastTypeEntered = lastTypeEntered;
	}

	/**
	 * @return the tablaSimbolos
	 */
	public Map<String, ObjectoTablaSimbolos> getTablaSimbolos() {
		return tablaSimbolos;
	}

	/**
	 * @param tablaSimbolos
	 *              the tablaSimbolos to set
	 */
	public void setTablaSimbolos(
			Map<String, ObjectoTablaSimbolos> tablaSimbolos) {
		this.tablaSimbolos = tablaSimbolos;
	}

	/**
	 * @return the initValueOfVar
	 */
	public Boolean getInitValueOfVar() {
		return initValueOfVar;
	}

	/**
	 * @param initValueOfVar
	 *              the initValueOfVar to set
	 */
	public void setInitValueOfVar(Boolean initValueOfVar) {
		this.initValueOfVar = initValueOfVar;
	}

	/**
	 * @return the clause
	 */
	public String getClause() {
		return clause;
	}

	/**
	 * @param clause the clause to set
	 */
	public void setClause(String clause) {
		this.clause = clause;
	}

}