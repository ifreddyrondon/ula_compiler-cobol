package ui;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.JButton;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JTabbedPane;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Map;
import java.util.Vector;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import sintactico.Yylex;
import sintactico.parser;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {
	private File file = null;
	private lexico.Yylex yl;
	private sintactico.Yylex yl2;
	private JPanel panelAnalisisLexico;
	private JPanel panelAnalisisSintactico;
	private static JTable table;
	private JTabbedPane tabbedPane;
	private JTextArea textAreaErroresLexicos;
	private JTextArea textAreaErroresSintacticos;
	private JTextArea textAreaErroresSemanticos;
	private Boolean analisisLexico = false;
	private Boolean analisisSintactico = false;
	private int originalWidth = 381;
	private int originoriginalWidthTabbed;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainFrame frame = new MainFrame();
					frame.setVisible(true);
					frame.setLocationRelativeTo(null);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainFrame() {
		setTitle("Cobolito");
		setResizable(false);

		getContentPane().setLayout(null);

		tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBounds(0, 0, 382, 464);
		tabbedPane.setBackground(Color.WHITE);
		originoriginalWidthTabbed = tabbedPane.getWidth();
		getContentPane().add(tabbedPane);

		panelAnalisisLexico = new JPanel();
		panelAnalisisLexico.setBorder(null);
		panelAnalisisLexico.setBackground(new Color(228, 228, 228));
		tabbedPane.addTab("Analisis Lexico", null, panelAnalisisLexico,
				null);
		panelAnalisisLexico.setLayout(null);

		JButton btnCargarArchivo = new JButton("Cargar Archivo");
		btnCargarArchivo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		btnCargarArchivo.setBounds(10, 6, 345, 38);
		panelAnalisisLexico.add(btnCargarArchivo);

		String textAreaStringStart = "\n\n\n   Para comenzar debes presionar el \n           Boton \"Cargar Archivo\" \n           y seleccionar tu codigo";
		final JTextArea textAreaLexico = new JTextArea(textAreaStringStart);
		textAreaLexico.setFont(new Font("Helvetica", 12, 20));
		textAreaLexico.setBounds(16, 47, 348, 351);
		textAreaLexico.setEditable(false);
		JScrollPane scrollLexico = new JScrollPane(textAreaLexico);
		scrollLexico.setBounds(10, 45, 345, 367);
		panelAnalisisLexico.add(scrollLexico);

		final JPanel panelTablaSimbolosLexico = new JPanel();
		panelTablaSimbolosLexico.setBounds(379, 45, 452, 367);
		panelTablaSimbolosLexico.setBackground(new Color(228, 228, 228));
		panelAnalisisLexico.add(panelTablaSimbolosLexico);

		table = new JTable();
		table.setFont(new Font("Helvetica", 12, 12));
		panelTablaSimbolosLexico.add(table);

		JLabel lblTablaDeSimbolosLexico = new JLabel("Tabla de Simbolos");
		lblTablaDeSimbolosLexico.setFont(new Font("Helvetica Neue",
				Font.BOLD, 17));
		lblTablaDeSimbolosLexico.setBounds(545, 11, 147, 22);
		panelAnalisisLexico.add(lblTablaDeSimbolosLexico);

		JLabel lblErroresLexico = new JLabel("Errores Lexicos");
		lblErroresLexico.setFont(new Font("Helvetica Neue", Font.BOLD, 17));
		lblErroresLexico.setForeground(Color.RED);
		lblErroresLexico.setBounds(890, 15, 128, 16);
		panelAnalisisLexico.add(lblErroresLexico);

		JPanel panelErroresLexico = new JPanel();
		panelErroresLexico.setBounds(850, 45, 220, 359);
		panelErroresLexico.setBackground(new Color(228, 228, 228));
		panelAnalisisLexico.add(panelErroresLexico);

		textAreaErroresLexicos = new JTextArea();
		textAreaErroresLexicos.setEditable(false);
		textAreaErroresLexicos.setFont(new Font("Helvetica Neue", 12, 14));
		textAreaErroresLexicos.setForeground(new Color(255, 99, 71));
		textAreaErroresLexicos.setBackground(new Color(228, 228, 228));
		panelErroresLexico.add(textAreaErroresLexicos);

		panelAnalisisSintactico = new JPanel();
		tabbedPane.addTab("Analisis Sintactico/Semantico", null,
				panelAnalisisSintactico, null);
		panelAnalisisSintactico.setLayout(null);
		panelAnalisisSintactico.setBackground(new Color(228, 228, 228));

		JButton btnCargarArchivoSintaxis = new JButton("Cargar Archivo");
		btnCargarArchivoSintaxis.setBounds(10, 6, 345, 38);
		panelAnalisisSintactico.add(btnCargarArchivoSintaxis);

		final JTextArea textAreaSintactico = new JTextArea(
				textAreaStringStart);
		textAreaSintactico.setBounds(16, 47, 348, 351);
		textAreaSintactico.setFont(new Font("Helvetica", 12, 20));
		textAreaSintactico.setEditable(false);
		JScrollPane scrollSintactico = new JScrollPane(textAreaSintactico);
		scrollSintactico.setBounds(10, 45, 345, 367);
		panelAnalisisSintactico.add(scrollSintactico);

		final JTextArea textAreaSemantico = new JTextArea();
		textAreaSemantico.setBounds(370, 47, 348, 351);
		textAreaSemantico.setFont(new Font("Helvetica", 8, 13));
		textAreaSemantico.setEditable(false);
		JScrollPane scrollSemantico = new JScrollPane(textAreaSemantico);
		scrollSemantico.setBounds(370, 45, 345, 367);
		panelAnalisisSintactico.add(scrollSemantico);
		
		JLabel lblSemantico = new JLabel("Analisis Semantico");
		lblSemantico.setFont(new Font("Helvetica Neue", Font.BOLD,
				17));
		lblSemantico.setBounds(467, 11, 156, 16);
		panelAnalisisSintactico.add(lblSemantico);
		
		
		JLabel lblErroresSintacticos = new JLabel("Errores Sintacticos");
		lblErroresSintacticos.setForeground(Color.RED);
		lblErroresSintacticos.setFont(new Font("Helvetica Neue", Font.BOLD,
				17));
		lblErroresSintacticos.setBounds(770, 11, 156, 16);
		panelAnalisisSintactico.add(lblErroresSintacticos);

		JPanel panelErroresSintacticos = new JPanel();
		panelErroresSintacticos.setBounds(720, 45, 267, 355);
		panelErroresSintacticos.setBackground(new Color(228, 228, 228));
		panelAnalisisSintactico.add(panelErroresSintacticos);

		textAreaErroresSintacticos = new JTextArea();
		textAreaErroresSintacticos.setForeground(new Color(255, 69, 0));
		textAreaErroresSintacticos.setBackground(new Color(228, 228, 228));
		textAreaErroresSintacticos.setFont(new Font("Helvetica Neue", Font.PLAIN, 14));
		textAreaErroresSintacticos.setEditable(false);
		panelErroresSintacticos.add(textAreaErroresSintacticos);

		JPanel panelErroresSemanticos = new JPanel();
		panelErroresSemanticos.setBounds(1000, 45, 255, 355);
		panelErroresSemanticos.setBackground(new Color(228, 228, 228));
		panelAnalisisSintactico.add(panelErroresSemanticos);

		textAreaErroresSemanticos = new JTextArea();
		textAreaErroresSemanticos.setFont(new Font("Helvetica Neue", Font.PLAIN, 14));
		textAreaErroresSemanticos.setBackground(new Color(228, 228, 228));
		textAreaErroresSemanticos.setForeground(new Color(255, 69, 0));
		textAreaErroresSemanticos.setEditable(false);
		panelErroresSemanticos.add(textAreaErroresSemanticos);

		JLabel lblErroresSemanticos = new JLabel("Errores Semanticos");
		lblErroresSemanticos.setForeground(Color.RED);
		lblErroresSemanticos.setFont(new Font("Helvetica Neue", Font.BOLD,
				17));
		lblErroresSemanticos.setBounds(1040, 11, 161, 16);
		panelAnalisisSintactico.add(lblErroresSemanticos);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 381, 504);

		JMenuBar menuBar = new JMenuBar();
		setJMenuBar(menuBar);

		JMenu mnCobolito = new JMenu("Cobolito");
		menuBar.add(mnCobolito);

		JMenuItem mntmAcercaDe = new JMenuItem("Acerca de");
		mnCobolito.add(mntmAcercaDe);		

		tabbedPane.addMouseListener(new MouseListener() {
			@Override
			public void mouseReleased(MouseEvent arg0) {
				// TODO Auto-generated method stub
			}

			@Override
			public void mousePressed(MouseEvent arg0) {
				// TODO Auto-generated method stub
			}

			@Override
			public void mouseEntered(MouseEvent arg0) {
				// TODO Auto-generated method stub
			}

			@Override
			public void mouseExited(MouseEvent arg0) {
				// TODO Auto-generated method stub
			}

			@Override
			public void mouseClicked(MouseEvent arg0) {
				redimencionar(Integer.toString(tabbedPane
						.getSelectedIndex()));
			}
		});

		// LEXICO.....................................................................................................................................................................
		btnCargarArchivo.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				// Borrar el contenido del archivo de salida
				File archivoAbierto = new File("src/salidas/out.txt");
				File archivoAbierto2 = new File(
						"src/salidas/tabla_simbolos.txt");
				File archivoAbierto3 = new File(
						"src/salidas/errores_lex.txt");
				Writer output = null;
				Writer output2 = null;
				Writer output3 = null;
				try {
					output = new BufferedWriter(new FileWriter(
							archivoAbierto));
					output2 = new BufferedWriter(new FileWriter(
							archivoAbierto2));
					output3 = new BufferedWriter(new FileWriter(
							archivoAbierto3));
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					output.write("");
					output2.write("");
					output3.write("");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						output.close();
						output2.close();
						output3.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				// Limpiamos la tabla de datos de la pantalla
				panelTablaSimbolosLexico.remove(0);
				validate();
				repaint();

				JFileChooser chooser = new JFileChooser();
				chooser.setDialogTitle("Selecciona el fuente");
				FileNameExtensionFilter filtroCobol2 = new FileNameExtensionFilter(
						"Archivo fuente Cobol (cob)", "COB");
				chooser.setFileFilter(filtroCobol2);
				FileNameExtensionFilter filtroCobol = new FileNameExtensionFilter(
						"Archivo fuente Cobol (cbl)", "CBL");
				chooser.setFileFilter(filtroCobol);
				if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
					file = chooser.getSelectedFile();
					textAreaLexico.setText(chooser.getSelectedFile()
							.getName() + "\n\n");
					
					textAreaErroresLexicos.setText("\n");
					textAreaErroresSintacticos.setText("\n");
					textAreaErroresSemanticos.setText("\n");
					try {

						BufferedReader bf = new BufferedReader(
								new FileReader(file));

						yl = new lexico.Yylex(bf);
						yl.yylex();
						BufferedReader br = null;
						try {
							textAreaLexico.setFont(new Font(
									"Helvetica", 12, 13));
							textAreaSintactico.setFont(new Font(
									"Helvetica", 12, 13));
							textAreaLexico.setText("\n");
							textAreaSintactico.setText("\n");

							FileInputStream fstream = new FileInputStream(
									"src/salidas/out.txt");
							DataInputStream entrada = new DataInputStream(
									fstream);
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							String linea = br.readLine();
							while (linea != null) {
								textAreaLexico.append(linea);
								textAreaLexico.append("\n");
								linea = br.readLine();
							}
							br.close();
							fstream.close();
							table.setModel(toTableModel(lexico.Yylex.tablaSimbolos));
							panelTablaSimbolosLexico
									.add(new JScrollPane(
											table));

							// Errores
							FileInputStream fstream2 = new FileInputStream(
									"src/salidas/errores_lex.txt");
							DataInputStream entrada2 = new DataInputStream(
									fstream2);
							br = new BufferedReader(
									new InputStreamReader(
											entrada2));
							String linea2 = br.readLine();
							while (linea2 != null) {
								textAreaErroresLexicos
										.append(linea2);
								textAreaErroresLexicos
										.append("\n");
								linea2 = br.readLine();
							}
							br.close();
							fstream2.close();

							validate();
							repaint();

							analisisLexico = true;
							redimencionar("lexico");

						} catch (IOException e) {
							e.printStackTrace();
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					JOptionPane.showMessageDialog(null,
							"Selecciona un archivo!!");
				}
			}
		});
		// SINTAXIS.....................................................................................................................................................................
		btnCargarArchivoSintaxis.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent arg0) {
				// Borrar el contenido del archivo de salida
				File archivoAbierto = new File("src/salidas/out.txt");
				File archivoAbierto2 = new File(
						"src/salidas/tabla_simbolos.txt");
				File archivoAbierto22 = new File(
						"src/salidas/tabla_simbolos_sintactico.txt");
				File archivoAbierto3 = new File(
						"src/salidas/errores_lex.txt");
				File archivoAbierto4 = new File(
						"src/salidas/out_sintactico.txt");
				File archivoAbierto44 = new File(
						"src/salidas/out_semantico.txt");
				File archivoAbierto5 = new File(
						"src/salidas/errores_sintactico.txt");
				File archivoAbierto55 = new File(
						"src/salidas/errores_semantico.txt");
				Writer output = null;
				Writer output2 = null;
				Writer output22 = null;
				Writer output3 = null;
				Writer output4 = null;
				Writer output44 = null;
				Writer output5 = null;
				Writer output55 = null;
				try {
					output = new BufferedWriter(new FileWriter(
							archivoAbierto));
					output2 = new BufferedWriter(new FileWriter(
							archivoAbierto2));
					output22 = new BufferedWriter(new FileWriter(
							archivoAbierto22));
					output3 = new BufferedWriter(new FileWriter(
							archivoAbierto3));
					output4 = new BufferedWriter(new FileWriter(
							archivoAbierto4));
					output44 = new BufferedWriter(new FileWriter(
							archivoAbierto44));
					output5 = new BufferedWriter(new FileWriter(
							archivoAbierto5));
					output55 = new BufferedWriter(new FileWriter(
							archivoAbierto55));
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					output.write("");
					output2.write("");
					output22.write("");
					output3.write("");
					output4.write("");
					output44.write("");
					output5.write("");
					output55.write("");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						output.close();
						output2.close();
						output22.close();
						output3.close();
						output4.close();
						output44.close();
						output5.close();
						output55.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				JFileChooser chooser = new JFileChooser();
				chooser.setDialogTitle("Selecciona el fuente");
				FileNameExtensionFilter filtroCobol2 = new FileNameExtensionFilter(
						"Archivo fuente Cobol (cob)", "COB");
				chooser.setFileFilter(filtroCobol2);
				FileNameExtensionFilter filtroCobol = new FileNameExtensionFilter(
						"Archivo fuente Cobol (cbl)", "CBL");
				chooser.setFileFilter(filtroCobol);
				if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
					file = chooser.getSelectedFile();
					textAreaLexico.setText(chooser.getSelectedFile()
							.getName() + "\n\n");
					try {
						BufferedReader bf = new BufferedReader(
								new FileReader(file));

						parser parserObj = new parser();
						yl2 = new sintactico.Yylex(bf);
						parserObj.setScanner(yl2);
						BufferedReader br = null;
						try {
							textAreaLexico.setFont(new Font(
									"Helvetica", 12, 13));
							textAreaSintactico.setFont(new Font(
									"Helvetica", 12, 13));
							textAreaLexico.setText("\n");
							textAreaSintactico.setText("\n");
							textAreaErroresLexicos.setText("\n");
							textAreaErroresSintacticos.setText("\n");
							textAreaErroresSemanticos.setText("\n");
							// Corriendo el analizador Sintactico
							parserObj.debug_parse();
							// Imprimiendo tabla de simbolos
							String tablaSimbolosString = Yylex.tablaSimbolos
									.print();
							System.out.println(tablaSimbolosString);
							
							FileWriter fw = null;
							PrintWriter pw = null;
							try {
								fw = new FileWriter(
										"src/salidas/tabla_simbolos_sintactico.txt",
										true);
								pw = new PrintWriter(fw);
								pw.println(tablaSimbolosString);
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

							// Escribiendo salidas en pantalla
							FileInputStream fstream = new FileInputStream(
									"src/salidas/out.txt");
							DataInputStream entrada = new DataInputStream(
									fstream);

							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							String linea = br.readLine();
							while (linea != null) {
								textAreaLexico.append(linea);
								textAreaLexico.append("\n");
								linea = br.readLine();
							}
							br.close();
							entrada.close();
							fstream.close();
							
							fstream = new FileInputStream(
									"src/salidas/out_sintactico.txt");
							entrada = new DataInputStream(
									fstream);
							
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							linea = br
									.readLine();
							while (linea != null) {
								textAreaSintactico
										.append(linea);
								textAreaSintactico.append("\n");
								linea = br.readLine();
							}
							br.close();
							entrada.close();
							fstream.close();
							
							fstream = new FileInputStream(
									"src/salidas/out_semantico.txt");
							entrada = new DataInputStream(
									fstream);
							
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							linea = br
									.readLine();
							while (linea != null) {
								textAreaSemantico
										.append(linea);
								textAreaSemantico.append("\n");
								linea = br.readLine();
							}
							
							br.close();
							entrada.close();
							fstream.close();
							
							table = new JTable(
									toTableModel(sintactico.Yylex.tablaSimbolos
											.getTablaSimbolos()));

							panelTablaSimbolosLexico
									.add(new JScrollPane(
											table));

							// Errores
							fstream = new FileInputStream(
									"src/salidas/errores_lex.txt");
							entrada = new DataInputStream(
									fstream);
							
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							linea = br.readLine();
							while (linea != null) {
								textAreaErroresLexicos
										.append(linea);
								textAreaErroresLexicos
										.append("\n");
								linea = br.readLine();
							}
							br.close();
							entrada.close();
							fstream.close();

							// Errores
							fstream = new FileInputStream(
									"src/salidas/errores_sintactico.txt");
							entrada = new DataInputStream(
									fstream);
							
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							linea = br.readLine();
							while (linea != null) {
								textAreaErroresSintacticos
										.append(linea);
								textAreaErroresSintacticos
										.append("\n");
								linea = br.readLine();
							}
							br.close();
							entrada.close();
							fstream.close();

							// Errores
							fstream = new FileInputStream(
									"src/salidas/errores_semantico.txt");
							entrada = new DataInputStream(
									fstream);
							
							br = new BufferedReader(
									new InputStreamReader(
											entrada));
							linea = br.readLine();
							while (linea != null) {
								textAreaErroresSemanticos
										.append(linea);
								textAreaErroresSemanticos
										.append("\n");
								linea = br.readLine();
							}
							
							br.close();
							entrada.close();
							fstream.close();
							
							
							analisisLexico = true;
							analisisSintactico = true;
							redimencionar("sintactico");
							
							validate();
							repaint();

						} catch (Exception x) {
							System.out.println("Error fatal.");
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					JOptionPane.showMessageDialog(null,
							"Selecciona un archivo!!");
				}
			}
		});

	}

	public static TableModel toTableModel(Map<?, ?> map) {

		Vector<String> colHdrs = new Vector<String>();
		colHdrs.addElement(new String("Identificador"));
		colHdrs.addElement(new String("  Descripcion  "));

		DefaultTableModel model = new DefaultTableModel(new Object[] {
				"Key", "Value" }, 0);

		model.setColumnIdentifiers(colHdrs);

		for (Map.Entry<?, ?> entry : map.entrySet()) {
			model.addRow(new Object[] { entry.getKey(),
					entry.getValue().toString() });
		}

		return model;
	}

	public void redimencionar(String _pestana) {
		int x = getX();
		int y = getY();

		if (_pestana.equals("0") || _pestana.equals("1")) {

			if (!analisisLexico && !analisisSintactico) {
				tabbedPane.setBounds(0, 0, originoriginalWidthTabbed,
						tabbedPane.getHeight());
				setBounds(x, y, originalWidth, getHeight());
			} else if (_pestana.equals("0") && analisisLexico) {
				if (textAreaErroresLexicos.getText().equals("\n")) {
					tabbedPane.setBounds(0, 0, 900,
							tabbedPane.getHeight());
					setBounds(x, y, 900, getHeight());
				} else {
					tabbedPane.setBounds(0, 0, 1100,
							tabbedPane.getHeight());
					setBounds(x, y, 1101, getHeight());
				}
			} else if (_pestana.equals("1") && analisisSintactico) {
				
				/* Sintactico */
				if (textAreaErroresSintacticos.getText().equals("\n")
						&& textAreaErroresSemanticos.getText()
								.equals("\n")
						&& textAreaErroresLexicos.getText().equals(
								"\n")) {

					tabbedPane.setBounds(0, 0,
							748,
							tabbedPane.getHeight());
					setBounds(x, y, 749, getHeight());

				} else if (!textAreaErroresLexicos.getText().equals("\n")
						&& textAreaErroresSintacticos.getText()
								.equals("\n")
						&& textAreaErroresSemanticos.getText()
								.equals("\n")) {

					tabbedPane.setBounds(0, 0,
							originoriginalWidthTabbed,
							tabbedPane.getHeight());
					setBounds(x, y, originalWidth, getHeight());
				
				} else {
					tabbedPane.setBounds(0, 0, 1288,
							tabbedPane.getHeight());
					setBounds(x, y, 1289, getHeight());
				}
				/* Sintactico */
			} else {
				tabbedPane.setBounds(0, 0, originoriginalWidthTabbed,
						tabbedPane.getHeight());
				setBounds(x, y, originalWidth, getHeight());
			}

		} else {
			if (_pestana.equals("lexico")) {
				// Redimencionando
				if (textAreaErroresLexicos.getText().equals("\n")) {
					tabbedPane.setBounds(0, 0, 900,
							tabbedPane.getHeight());
					setBounds(x, y, 900, getHeight());
				} else {
					tabbedPane.setBounds(0, 0, 1100,
							tabbedPane.getHeight());
					setBounds(x, y, 1101, getHeight());
				}

			} else if (_pestana.equals("sintactico")) {
				
				if (textAreaErroresSintacticos.getText().equals("\n")
						&& textAreaErroresSemanticos.getText()
								.equals("\n")
						&& textAreaErroresLexicos.getText().equals(
								"\n")) {

					tabbedPane.setBounds(0, 0, 748,
							tabbedPane.getHeight());
					setBounds(x, y, 749, getHeight());

					JOptionPane.showMessageDialog(null, "Perfecto!!");

				} else if (!textAreaErroresLexicos.getText().equals("\n")
						&& textAreaErroresSintacticos.getText()
								.equals("\n")
						&& textAreaErroresSemanticos.getText()
								.equals("\n")) {

					tabbedPane.setBounds(0, 0,
							originoriginalWidthTabbed,
							tabbedPane.getHeight());
					setBounds(x, y, originalWidth, getHeight());
					
					JOptionPane.showMessageDialog(null, "Errores Lexicos!!");
					
				} else {
					tabbedPane.setBounds(0, 0, 1288,
							tabbedPane.getHeight());
					setBounds(x, y, 1289, getHeight());
				}
			}
		}
		setLocationRelativeTo(null);
	}

}
