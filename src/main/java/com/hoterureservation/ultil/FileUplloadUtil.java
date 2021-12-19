package com.hoterureservation.ultil;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileUplloadUtil {

    public static void saveFile(String uploadDir, String filename, MultipartFile multipartFile) throws IOException{
        Path uploadPath = Paths.get(uploadDir);
        System.out.println(uploadPath);
        if(!Files.exists(uploadPath)){
            Files.createDirectories(uploadPath);
        }
        try(InputStream inputStream = multipartFile.getInputStream()){
            Path filePath = uploadPath.resolve(filename);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e){
            throw new IOException("ko the luu anh: "+ filename, e);
        }
    }
}
