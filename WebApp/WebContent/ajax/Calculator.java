package swingTest;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Calculator extends JPanel implements ActionListener {
	// Font 정의
	Font fnt = new Font("Arial",Font.BOLD, 20);
	
	//JFrame - north
	JTextField resultTf = new JTextField("0.0");
	
	//JFrame - center
	JPanel centerPane = new JPanel(new BorderLayout()); // FlowLayout -> BorderLayout
		JPanel northPane = new JPanel(new GridLayout(1,3));
		JPanel btnPane = new JPanel(new GridLayout(4,4));
		
	String btnLbl[] = {"Backspace","Clear","End","7","8","9","+","4","5","6","-","1","2","3","*","0",".","=","/"};

	//연산자 보관 변수
	String operator ="";
	//피연산자 보관
	double result = 0.0;
	
	
	public Calculator() {
		//레이아웃이 플로우 레이아웃 -> 보더레이아웃으로 변경
		setLayout(new BorderLayout());
//		super("계산기");// 프레임 제목
		//JFrame - north
		add("North",resultTf);
		resultTf.setFont(fnt);
		//		SwingConstants.RIGHT 상위
		//		resultTf.setHorizontalAlignment(4)   constant field values
		resultTf.setHorizontalAlignment(JTextField.RIGHT);
		
		//JFrame - center
		add("Center",centerPane);
		centerPane.add("North", northPane);
		centerPane.add(BorderLayout.CENTER,btnPane);
		
		
		//버튼 생성
		for(int i = 0; i<btnLbl.length; i++) {
			JButton btn = new JButton(btnLbl[i]);
			btn.setFont(fnt);// 글꼴 유형 크기
			if(i<3) {
				northPane.add(btn);
			} else {
				btnPane.add(btn);
				btn.setBackground(Color.LIGHT_GRAY);
			}
			// 이벤트 등록
			btn.addActionListener(this);
		}
		
//		setSize(400,250);// 사이즈 정의
//		setVisible(true);// 창을 보여준다
//		setDefaultCloseOperation(DISPOSE_ON_CLOSE); // 화면꺼짐
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		String eventBtn = ae.getActionCommand();
		System.out.println(eventBtn);
		
		switch(eventBtn) {
		case "End" : System.exit(0);break;
		
		case "0" : case "1": case "2": case"3":
		case"4":case"5":case"6":
		case"7":case"8":case"9": setNumber(eventBtn); break;
		case".":setPoint(eventBtn);break;
		case "Backspace" : setBackspace(); break;
		case "+":case"-":case"/":case"*": setOperator(eventBtn); break;
		case "=":setResult(); break;
		case "Clear" : setClear();
		}
	}
	//데이터 초기화
	public void setClear() {
		result = 0.0;
		operator = "";
		resultTf.setText("0.0");
	}
	
	// 연산하기
	public void setResult() {
		double secondNum = Double.parseDouble(resultTf.getText());
		switch(operator) {
		case "+" : result = result + secondNum; break;
		case "-" : result = result - secondNum; break;
		case "*" : result = result * secondNum; break;
		case "/" : result = result / secondNum; break;
		}
		resultTf.setText(String.valueOf(result));
		operator = "";
	}
	
	// 연산자 처리
	public void setOperator(String operator) {
		//연산자 보관
		this.operator = operator;
		result = Double.parseDouble(resultTf.getText());//숫자 보관
		resultTf.setText("");
		
	}
	
	//백스페이스 처리
	public void setBackspace() {
		String lblStr = resultTf.getText(); // 12345678
		String cutStr = lblStr.substring(0, lblStr.length()-1);
		resultTf.setText(cutStr);
	}
	
	//숫자 처리
	public void setNumber(String num) {
		//JTextField 의 원래 값 얻어오기
		String lblStr = resultTf.getText(); // 0.0
		if(lblStr.equals("0.0")) {
			resultTf.setText(num); // 클릭한 숫자 버튼을 셋팅
		} else {
			resultTf.setText(lblStr+num);
		}
	}
	
	//소수점 처리
	public void setPoint(String a) {
		String lblStr = resultTf.getText();
		int idx = lblStr.indexOf(".");
		if(idx == -1) {
			resultTf.setText(lblStr+".");
		}
	}
	
	
//	public static void main(String[] args) {
//		new Calculator();
//	}
	
	
}
