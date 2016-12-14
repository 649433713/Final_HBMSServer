package model;

import message.ResultMessage;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Created by alex on 12/5/16.
 */
public class ImageHelper {

    public String makedir(int userID)throws Exception{
        File userFolder=getdir(userID);
        userFolder.mkdirs();
        return userFolder.getPath();
    }

    public File getdir(int userID) throws Exception{
        String rootPath=getProjectPath()+"/res/";
        File userFolder=new File(rootPath+userID);
        return userFolder;
    }

    public void deldir(File file){
        if(file.exists()){
            if(file.isFile()){
                file.delete();
            }else{
                File[] files=file.listFiles();
                for(int i=0;i<files.length;i++){
                    this.deldir(files[i]);
                }
                file.delete();
            }
        }else{
            return;
        }
    }

    public String getProjectPath() throws Exception{
        File directory = new File("");
        String path = directory.getCanonicalPath() ;
        return path;
    }

    public void saveImage(File file,String path) throws Exception{
        //remind that the "path" includes the file name and its format, eg. test.jpg
        File imageToSave=new File(path);
        Image image=ImageIO.read(file);
        if(image==null)return;
        int w=image.getWidth(null);
        int h=image.getHeight(null);
        BufferedImage bi = new BufferedImage(w, h, BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = bi.getGraphics();
        try {
            g.drawImage(image, 0, 0, null);
            ImageIO.write(bi,"jpg",imageToSave);
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
