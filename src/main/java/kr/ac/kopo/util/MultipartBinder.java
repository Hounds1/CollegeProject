package kr.ac.kopo.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class MultipartBinder {
    public String operate(MultipartFile paramFile) {
        String fileRealName = paramFile.getOriginalFilename();

        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
        String uploadFolder = "D:\\test\\upload";

        UUID uuid = UUID.randomUUID();

        String[] uuids = uuid.toString().split("-");

        String uniqueName = uuids[0];

        File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);
        try {
            paramFile.transferTo(saveFile);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return uniqueName + fileExtension;
    }
}
