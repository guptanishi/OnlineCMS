package db;

public class thread {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread t=new Thread(){
		
		  public void run(){
			
            	System.out.println("Hello..Admin!!");
		
			}
		};
		
	    t.start();
	}
}
