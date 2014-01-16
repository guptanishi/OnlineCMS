package process;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class TextToImage {
	public static Boolean convert(String que, String path){
		int TEXTWORDLENGTH = 100, FONTSIZE = 15, CANVASWIDTH = 710, LINESPACING = -3, HEIGHTADJUST = 5; 
							/* LINESPACING RANGE +6 to -6 || HEIGHTADJUST AS PER REQIUREMENT */
		Boolean lastlineresolve = false;
        int strlen= que.length();
        if(strlen%TEXTWORDLENGTH == 0){ // When both numbers are fully divisible
        	lastlineresolve = true; // resolving last line.
        }
        int txtloop = (int)Math.ceil( strlen / (float)TEXTWORDLENGTH);
        String[] lines = new String[txtloop];
        int first = 0, last = TEXTWORDLENGTH,l;
        Boolean txtover = true;
        
        for(int i = 0; i < txtloop; i++)
        {
        	if(last > strlen){
        		last = strlen;
        		txtover = false;
	        }
        	l = last;
        	if(txtover){	
    			while(!que.substring(--l, l+1).equals(" ")){}
        	}
        	if(txtloop-1 == i){
        		if(lastlineresolve)
        			l = strlen;
        	}
    		lines[i] = que.substring(first,l);
	        first = l + 1; 
        	last = first + TEXTWORDLENGTH;
        	
        }
        /*Because font metrics is based on a graphics context, we need to create
          a small, temporary image so we can ascertain the width and height
          of the final image*/
        BufferedImage img = new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = img.createGraphics();
        Font font = new Font("Arial", Font.PLAIN, FONTSIZE);
        g2d.setFont(font);
        FontMetrics fm = g2d.getFontMetrics();
        
        //-------------------------------
        int textvspacing = LINESPACING;
        int width = CANVASWIDTH;
        int height = 0;
        // Canvas Image height Calculation
        for(int i = 0; i< txtloop; i++){
        	height += fm.getHeight() + textvspacing;
        }
        //-------------------------------
        
        g2d.dispose();
        img = new BufferedImage(width, height+HEIGHTADJUST, BufferedImage.TYPE_INT_ARGB);
        g2d = img.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
        g2d.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);
        g2d.setFont(font);
        fm = g2d.getFontMetrics();
        g2d.setColor(Color.BLACK);
        //-------------------------------
        int temp = fm.getAscent();
        if(lines[0] != null)
        	g2d.drawString(lines[0], 0, temp);
        for(int i = 0; i < txtloop - 1; i++){
        	temp += (fm.getHeight() + textvspacing);
        	if(lines[i+1] != null)
        		g2d.drawString(lines[i+1], 0 , temp);
	        }
        //-------------------------------
        g2d.dispose();
        try {
            ImageIO.write(img, "png", new File(path));
            return true;
        } catch (IOException ex) {
            ex.printStackTrace();
            return false;
        }
	}
}
