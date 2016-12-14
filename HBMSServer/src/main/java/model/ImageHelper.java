package model;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Created by alex on 12/5/16.
 */
public class ImageHelper {
    public String getProjectPath() throws Exception{
        File directory = new File("");
        String path = directory.getCanonicalPath() ;
        return path;
    }

    public void saveImage(Image image,String path){
        if(image==null)return;
        int w=image.getWidth(null);
        int h=image.getHeight(null);
        BufferedImage bi = new BufferedImage(w, h, BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = bi.getGraphics();
        try {
            g.drawImage(image, 0, 0, null);
            ImageIO.write(bi,"jpg",new File(path));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public boolean deleteImage(String path){
        File file=new File(path);
        if(file.isFile()&&file.exists()){
            file.delete();
            return true;
        }else return false;

    }
}
